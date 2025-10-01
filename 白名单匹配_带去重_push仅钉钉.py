import requests
import time
import json
import hmac
import hashlib
import base64
import urllib.parse
import os

# 白名单关键词
whitelistKeywords = ["白名单", "关键词"]

# 钉钉配置
push_config = {
    "DD_BOT_TOKEN": "",
    "DD_BOT_SECRET": "SEC"
}

# 已推送 ID 文件路径
push_log_path = "temp/alpush.txt"
os.makedirs("temp", exist_ok=True)
#下面不用填

def load_pushed_ids():
    if os.path.exists(push_log_path):
        with open(push_log_path, "r", encoding="utf-8") as f:
            return set(line.strip() for line in f if line.strip().isdigit())
    return set()


def save_pushed_id(post_id):
    with open(push_log_path, "a", encoding="utf-8") as f:
        f.write(f"{post_id}\n")


def listfilter(title, content):
    return any(keyword in title or keyword in content for keyword in whitelistKeywords)


def push_dingtalk(title, content, post_id):
    timestamp = str(round(time.time() * 1000))
    secret_enc = push_config["DD_BOT_SECRET"].encode("utf-8")
    string_to_sign = f"{timestamp}\n{push_config['DD_BOT_SECRET']}"
    string_to_sign_enc = string_to_sign.encode("utf-8")
    hmac_code = hmac.new(secret_enc, string_to_sign_enc, digestmod=hashlib.sha256).digest()
    sign = urllib.parse.quote_plus(base64.b64encode(hmac_code))

    url = (
        f'https://oapi.dingtalk.com/robot/send?access_token={push_config["DD_BOT_TOKEN"]}'
        f"&timestamp={timestamp}&sign={sign}"
    )
    headers = {"Content-Type": "application/json;charset=utf-8"}
    link = f"https://new.xianbao.fun/weibo/{post_id}.html"
    data = {
        "msgtype": "text",
        "text": {
            "content": f"{title}\n\n{content}\n{link}"
        }
    }

    try:
        response = requests.post(url, data=json.dumps(data), headers=headers, timeout=15).json()
        if response.get("errcode") == 0:
            print("✅ 钉钉机器人 推送成功！")
            return True
        else:
            print(f"❌ 推送失败: {response}")
            return False
    except Exception as e:
        print(f"❌ 推送异常: {e}")
        return False


def fetch_and_monitor():
    headers = {
        "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 "
                      "(KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36 Edg/137.0.0.0"
    }
    url = "https://new.ixbk.net/plus/json/push.json"

    try:
        resp = requests.get(url, headers=headers, timeout=10)
        resp.raise_for_status()
        data = resp.json()
    except Exception as e:
        print(f"❌ 抓取数据失败: {e}")
        return

    pushed_ids = load_pushed_ids()

    for item in data:
        post_id = str(item.get("id", ""))
        title = item.get("title", "")
        content = item.get("content", "")

        if post_id in pushed_ids:
            continue

        if listfilter(title, content):
            if push_dingtalk(title, content, post_id):
                save_pushed_id(post_id)


if __name__ == "__main__":
    fetch_and_monitor()
