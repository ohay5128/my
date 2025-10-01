# cron: 0 0 */3 * *
# new Env("日志定时清理")
import os
import re
import sys
from datetime import datetime, timedelta

LOG_DIR = "/ql/data/log"  # 青龙日志目录（Docker默认路径）
RETAIN_DAYS = 2      # 保留最近2天的日志
TIMEZONE_OFFSET = 8  # 时区修正（北京时间+8）

def parse_log_date(filename):
    """ 终极日期解析（兼容青龙所有版本日志格式） """
    patterns = [
        # 匹配 2025-03-27-02-25-00-771.log（带毫秒）
        r"(\d{4}-\d{2}-\d{2})-\d{2}-\d{2}-\d{2}-\d{3}\.log$",
        # 匹配 20250415.log（旧版格式）
        r"(\d{8})\.log$",
        # 匹配 2025_04_15.log（特殊格式）
        r"(\d{4}_\d{2}_\d{2})\.log$"
    ]
    
    for pattern in patterns:
        match = re.search(pattern, filename)
        if match:
            date_str = match.group(1).replace("_", "-")
            try:
                return datetime.strptime(date_str, "%Y-%m-%d")
            except:
                return datetime.strptime(date_str, "%Y%m%d")
    return None

def clean_logs():
    now = datetime.utcnow() + timedelta(hours=TIMEZONE_OFFSET)  # 时区校准
    cutoff = now - timedelta(days=RETAIN_DAYS)
    total_deleted = 0
    dirs_removed = set()

    # 递归清理文件
    for root, dirs, files in os.walk(LOG_DIR, topdown=False):
        # 处理文件
        for f in files:
            file_path = os.path.join(root, f)
            log_date = parse_log_date(f)
            
            if not log_date:
                continue  # 跳过非日志文件
            
            if log_date < cutoff:
                try:
                    os.remove(file_path)
                    total_deleted += 1
                    print(f"✅ 已删除 | {os.path.relpath(file_path, LOG_DIR)}")
                except Exception as e:
                    print(f"❌ 删除失败 | {f} ({str(e)})")

        # 标记待删除目录
        if root != LOG_DIR:
            try:
                if not os.listdir(root):
                    os.rmdir(root)
                    dirs_removed.add(root)
                    print(f"🗂️ 已清理空目录 | {os.path.relpath(root, LOG_DIR)}")
            except Exception as e:
                print(f"⚠️ 目录清理失败 | {root} ({str(e)})")

    # 结果统计
    print("\n" + "="*40)
    print(f"📅 截止时间: {cutoff.strftime('%Y-%m-%d')}")
    print(f"🗑️ 总删除文件: {total_deleted}")
    print(f"📂 清理空目录: {len(dirs_removed)}")
    print("="*40)

if __name__ == "__main__":
    print(f"🚀 启动日志清理任务（保留{RETAIN_DAYS}天）...")
    try:
        clean_logs()
        print("✅ 所有操作已完成")
    except Exception as e:
        print(f"🔥 发生严重错误: {str(e)}")
        sys.exit(1)
