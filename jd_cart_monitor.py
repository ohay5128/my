#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
京东购物车降价监控脚本
功能：监控购物车商品降价（比加入时降价）
推送：飞书机器人
"""
import os
import sys
import json
import re
import requests
from datetime import datetime

JD_COOKIE = os.getenv('JD_COOKIE', '')
FSKEY = os.getenv('FSKEY', '')

# 数据文件路径
DATA_DIR = '/ql/data/jd_cart'
HISTORY_FILE = f'{DATA_DIR}/jd_cart_history.json'

def log_info(msg):
    """输出信息日志"""
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(f"[INFO] {timestamp} {msg}")


def log_error(msg):
    """输出错误日志"""
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(f"[ERROR] {timestamp} {msg}", file=sys.stderr)


def log_success(msg):
    """输出成功日志"""
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(f"[SUCCESS] {timestamp} {msg}")


# ==================== 飞书推送 ====================
def send_feishu_text(message):
    """发送飞书文本消息"""
    if not FSKEY:
        log_info("未配置飞书key，仅输出到日志")
        print(message)
        return True

    headers = {'Content-Type': 'application/json'}
    data = {
        "msg_type": "text",
        "content": {"text": message}
    }

    try:
        webhook = "https://open.feishu.cn/open-apis/bot/v2/hook/" + FSKEY
        response = requests.post(webhook, headers=headers, json=data, timeout=10)
        result = response.json()
        if result.get('StatusCode') == 0 or result.get('code') == 0:
            log_success("飞书消息发送成功")
            return True
        else:
            log_error(f"飞书消息发送失败: {result}")
            return False
    except Exception as e:
        log_error(f"飞书消息发送异常: {str(e)}")
        return False


def send_price_drop_alert(items):
    """发送降价提醒"""
    if not items:
        return

    items_text = ""

    for i, item in enumerate(items, 1):
        # 计算原价
        original_price = item['price'] + item['cut']

        items_text += f"\n{i}. {item['name']}\n"
        items_text += f"   原价：¥{original_price:.2f}\n"
        items_text += f"   当前价：¥{item['price']:.2f}\n"
        items_text += f"   比加入时降：¥{item['cut']:.2f}\n"

    message = f"""【📉 京东购物车降价提醒】

💰 发现 {len(items)} 件商品已降价！
{items_text}
⏰ 更新时间：{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""
    return send_feishu_text(message)

def get_cookies():
    """从环境变量获取Cookie列表"""
    cookies_str = JD_COOKIE.strip()
    if not cookies_str:
        log_error("未配置JD_COOKIE环境变量")
        return []

    # 支持多账号：cookie1&cookie2
    cookie_list = [c.strip() for c in cookies_str.split('&') if c.strip()]
    log_info(f"加载了 {len(cookie_list)} 个账号的Cookie")
    return cookie_list


# ==================== 购物车数据获取（移动端API） ====================
def get_cart_data_mobile(cookie):
    """使用移动端API获取购物车数据"""
    url = "https://p.m.jd.com/cart/cart.action"

    headers = {
        'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1',
        'Referer': 'https://home.m.jd.com/',
        'Cookie': cookie
    }

    try:
        log_info("正在获取购物车数据...")
        response = requests.get(url, headers=headers, timeout=15)

        if response.status_code != 200:
            log_error(f"请求失败，状态码: {response.status_code}")
            return None

        # 检查是否登录成功
        if 'plogin.m.jd.com' in response.url or '京东登录' in response.text or '请输入手机号' in response.text:
            log_error("Cookie已失效，请重新获取")
            return None

        log_success("购物车数据获取成功")
        return response.text

    except Exception as e:
        log_error(f"获取购物车数据异常: {str(e)}")
        return None

def parse_price_drop_items(html_content):
    """从HTML中解析降价商品"""
    try:
        # 查找 window.cartData 的起始位置
        cart_data_pattern = r'window\.cartData\s*=\s*\{'
        match = re.search(cart_data_pattern, html_content)
        if not match:
            log_error("未找到cartData")
            return []

        # 使用括号计数提取完整的JSON对象
        start_pos = match.end() - 1  # { 的位置
        brace_count = 0
        i = start_pos

        while i < len(html_content):
            char = html_content[i]
            if char == '{':
                brace_count += 1
            elif char == '}':
                brace_count -= 1
                if brace_count == 0:
                    # 找到匹配的结束括号
                    json_str = html_content[start_pos:i+1]
                    cart_json = json.loads(json_str)
                    log_success("cartData解析成功")
                    return parse_from_json(cart_json)
            elif char == '"' and html_content[i-1:i] != '\\':
                # 跳过字符串内容
                j = i + 1
                while j < len(html_content) and html_content[j] != '"':
                    if html_content[j] == '\\' and j + 1 < len(html_content):
                        j += 2
                    else:
                        j += 1
                i = j
            i += 1

    except Exception as e:
        log_error(f"解析降价商品异常: {str(e)}")
        return []


def parse_from_json(cart_data):
    """从JSON数据中解析降价商品"""
    items = []

    try:
        cart = cart_data.get('cart', {})
        vender_carts = cart.get('venderCart', [])

        for vender_cart in vender_carts:
            shop_info = vender_cart.get('popInfo', {})
            shop_name = shop_info.get('vname', '未知店铺')
            sorted_items = vender_cart.get('sortedItems', [])

            for item_type in sorted_items:
                poly_type = item_type.get('polyType')
                if poly_type not in ['1', '3', '4']:
                    continue

                poly_item = item_type.get('polyItem', {})
                product_list = poly_item.get('products', [])

                for product in product_list:
                    sku_info = product.get('mainSku', {})
                    if not sku_info:
                        continue

                    # 检查降价信息（margin字段，单位是分）
                    margin_cents = product.get('margin', '0')
                    try:
                        margin_cents = int(margin_cents)
                    except:
                        margin_cents = 0

                    # 只保留有降价的商品
                    if margin_cents > 0:
                        price_cents = int(product.get('price', 0))
                        price = price_cents / 100.0
                        cut = margin_cents / 100.0

                        items.append({
                            'sku_id': sku_info.get('id', ''),
                            'name': sku_info.get('name', ''),
                            'price': price,
                            'cut': cut,
                            'cut_text': f"比加入时降￥{cut:.1f}",
                            'shop': shop_name
                        })

        return items

    except Exception as e:
        log_error(f"解析JSON数据异常: {str(e)}")
        return []

def save_history(items):
    """保存降价商品历史"""
    try:
        os.makedirs(DATA_DIR, exist_ok=True)

        history = {}
        if os.path.exists(HISTORY_FILE):
            with open(HISTORY_FILE, 'r', encoding='utf-8') as f:
                history = json.load(f)

        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        history[timestamp] = items

        with open(HISTORY_FILE, 'w', encoding='utf-8') as f:
            json.dump(history, f, ensure_ascii=False, indent=2)

        log_success(f"历史记录已保存")

    except Exception as e:
        log_error(f"保存历史记录失败: {str(e)}")

def main():
    """主函数"""
    print("=" * 60)
    log_info("京东购物车降价监控脚本启动")
    print("=" * 60)

    # 初始化
    os.makedirs(DATA_DIR, exist_ok=True)

    # 获取Cookie
    cookie_list = get_cookies()
    if not cookie_list:
        log_error("未配置有效的Cookie，脚本退出")
        return

    all_drop_items = []

    # 遍历所有账号
    for idx, cookie in enumerate(cookie_list, 1):
        print(f"\n{'='*60}")
        log_info(f"正在处理第 {idx}/{len(cookie_list)} 个账号")
        print(f"{'='*60}")

        html_content = get_cart_data_mobile(cookie)
        if not html_content:
            log_error("获取购物车数据失败，跳过此账号")
            continue

        # 解析降价商品
        drop_items = parse_price_drop_items(html_content)
        if drop_items:
            all_drop_items.extend(drop_items)

    # 发送降价提醒
    if all_drop_items:
        # 按降价金额排序
        all_drop_items.sort(key=lambda x: x['cut'], reverse=True)

        log_success(f"总共发现 {len(all_drop_items)} 个降价商品")
        send_price_drop_alert(all_drop_items)
        save_history(all_drop_items)
    else:
        log_info("未发现降价商品")

    log_success("监控任务完成")


if __name__ == '__main__':
    main()
