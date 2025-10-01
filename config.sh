## 在运行 ql repo 命令时，是否自动删除失效的脚本与定时任务
AutoDelCron="true"

## 在运行 ql repo 命令时，是否自动增加新的本地定时任务
AutoAddCron="true"

## 拉取脚本时默认的定时规则，当匹配不到定时规则时使用，例如: 0 9 * * *
DefaultCronRule=""

## ql repo命令拉取脚本时需要拉取的文件后缀，直接写文件后缀名即可
RepoFileExtensions="js mjs py pyc"

## 代理地址，支持HTTP/SOCK5，例如 http://127.0.0.1:7890
ProxyUrl=""

## 资源告警阙值，默认CPU 80%、内存80%、磁盘90%
CpuWarn=80
MemoryWarn=80
DiskWarn=90

## 设置定时任务执行的超时时间，例如1h，后缀"s"代表秒(默认值), "m"代表分, "h"代表小时, "d"代表天
CommandTimeoutTime=""

## 在运行 task 命令时，随机延迟启动任务的最大延迟时间，如 RandomDelay="300" ，表示任务将在 1-300 秒内随机延迟一个秒数，然后再运行，取消延迟赋值为空
RandomDelay=""

## 需要随机延迟运行任务的文件后缀，直接写后缀名即可，多个后缀用空格分开，例如: js py ts
## 默认仅给javascript任务加随机延迟，其它任务按定时规则准点运行。全部任务随机延迟赋值为空
RandomDelayFileExtensions=""

## 每小时的第几分钟准点运行任务，当在这些时间运行任务时将忽略 RandomDelay 配置，不会被随机延迟
## 默认是第0分钟和第30分钟，例如21:00或21:30分的任务将会准点运行。不需要准点运行赋值为空
RandomDelayIgnoredMinutes=""

## 如果你自己会写shell脚本，并且希望在每次容器启动时，额外运行你的 shell 脚本，请赋值为 "true"
EnableExtraShell=""

## 是否自动启动bot，默认不启动，设置为true时自动启动，目前需要自行克隆bot仓库所需代码，存到ql/repo目录下，文件夹命名为dockerbot
AutoStartBot=""

## 是否使用第三方bot，默认不使用，使用时填入仓库地址，存到ql/repo目录下，文件夹命名为diybot
BotRepoUrl=""

## 通知环境变量
## 1. Server酱
## https://sct.ftqq.com/r/13363
## 下方填写 SCHKEY 值或 SendKey 值
export PUSH_KEY=""

## 2. BARK
## 下方填写app提供的设备码，例如：https://api.day.app/123 那么此处的设备码就是123
export BARK_PUSH=""
## 下方填写推送图标设置，自定义推送图标(需iOS15或以上)
export BARK_ICON="https://qn.whyour.cn/logo.png"
## 下方填写推送声音设置，例如choo，具体值请在bark-推送铃声-查看所有铃声
export BARK_SOUND=""
## 下方填写推送消息分组，默认为"QingLong"
export BARK_GROUP="QingLong"
## bark 推送时效性
export BARK_LEVEL="active"
## bark 推送是否存档
export BARK_ARCHIVE=""
## bark 推送跳转 URL
export BARK_URL=""

## 3. Telegram
## 下方填写自己申请@BotFather的Token，如10xxx4:AAFcqxxxxgER5uw
export TG_BOT_TOKEN="7721621247:AAEe7MktZZrq0FjAITKbLg3CgWTo0wsL_LQ"
## 下方填写 @getuseridbot 中获取到的纯数字ID
export TG_USER_ID="888531452"
## Telegram 代理IP（选填）
## 下方填写代理IP地址，代理类型为 http，比如您代理是 http://127.0.0.1:1080，则填写 "127.0.0.1"
## 如需使用，请自行解除下一行的注释
export TG_PROXY_HOST=""
## Telegram 代理端口（选填）
## 下方填写代理端口号，代理类型为 http，比如您代理是 http://127.0.0.1:1080，则填写 "1080"
## 如需使用，请自行解除下一行的注释
export TG_PROXY_PORT=""
## Telegram 代理的认证参数（选填）
export TG_PROXY_AUTH=""
## Telegram api自建反向代理地址（选填）
## 教程：https://www.hostloc.com/thread-805441-1-1.html
## 如反向代理地址 http://aaa.bbb.ccc 则填写 aaa.bbb.ccc
## 如需使用，请赋值代理地址链接，并自行解除下一行的注释
export TG_API_HOST=""

## 4. 钉钉
## 官方文档：https://developers.dingtalk.com/document/app/custom-robot-access
## 下方填写token后面的内容，只需 https://oapi.dingtalk.com/robot/send?access_token=XXX 等于=符号后面的XXX即可
export DD_BOT_TOKEN=""
export DD_BOT_SECRET=""

## 企业微信反向代理地址
## (环境变量名 QYWX_ORIGIN)
export QYWX_ORIGIN=""

## 5. 企业微信机器人
## 官方说明文档：https://work.weixin.qq.com/api/doc/90000/90136/91770
## 下方填写密钥，企业微信推送 webhook 后面的 key
export QYWX_KEY=""

## 6. 企业微信应用
## 参考文档：http://note.youdao.com/s/HMiudGkb
## 下方填写素材库图片id（corpid,corpsecret,touser,agentid），素材库图片填0为图文消息, 填1为纯文本消息
export QYWX_AM=""

## 7. iGot聚合
## 参考文档：https://wahao.github.io/Bark-MP-helper
## 下方填写iGot的推送key，支持多方式推送，确保消息可达
export IGOT_PUSH_KEY=""

## 8. Push Plus
## 官方网站：http://www.pushplus.plus
## 下方填写您的Token，微信扫码登录后一对一推送或一对多推送下面的token，只填 PUSH_PLUS_TOKEN 默认为一对一推送
export PUSH_PLUS_TOKEN="8dedc5cdf79547cea7dc42029e043638"
## 一对一多推送（选填）
## 下方填写您的一对多推送的 "群组编码" ，（一对多推送下面->您的群组(如无则新建)->群组编码）
## 1. 需订阅者扫描二维码 2、如果您是创建群组所属人，也需点击“查看二维码”扫描绑定，否则不能接受群组消息推送
export PUSH_PLUS_USER="qwer"
## 发送模板，支持html,txt,json,markdown,cloudMonitor,jenkins,route,pay
export PUSH_PLUS_TEMPLATE="html"
## 发送渠道，支持wechat,webhook,cp,mail,sms
export PUSH_PLUS_CHANNEL="wechat"
## webhook编码，可在pushplus公众号上扩展配置出更多渠道
export PUSH_PLUS_WEBHOOK=""
## 发送结果回调地址，会把推送最终结果通知到这个地址上
export PUSH_PLUS_CALLBACKURL=""
## 好友令牌，微信公众号渠道填写好友令牌，企业微信渠道填写企业微信用户id
export PUSH_PLUS_TO=""

## 9. 微加机器人
## 官方网站：http://www.weplusbot.com
## 下方填写您的Token；微信扫描登录后在"我的"->"设置"->"令牌"中获取
export WE_PLUS_BOT_TOKEN=""
## 消息接收人；
## 个人版填写接收消息的群编码，不填发送给自己的微信号
## 专业版不填默认发给机器人自己，发送给好友填写wxid，发送给微信群填写群编码
export WE_PLUS_BOT_RECEIVER=""
## 调用版本；分为专业版和个人版，专业版填写pro，个人版填写personal
export WE_PLUS_BOT_VERSION="pro"

## 10. go-cqhttp
## gobot_url 推送到个人QQ: http://127.0.0.1/send_private_msg  群：http://127.0.0.1/send_group_msg
## gobot_token 填写在go-cqhttp文件设置的访问密钥
## gobot_qq 如果GOBOT_URL设置 /send_private_msg 则需要填入 user_id=个人QQ 相反如果是 /send_group_msg 则需要填入 group_id=QQ群
## go-cqhttp相关API https://docs.go-cqhttp.org/api
export GOBOT_URL=""
export GOBOT_TOKEN=""
export GOBOT_QQ=""

## 11. gotify
## gotify_url 填写gotify地址,如https://push.example.de:8080
## gotify_token 填写gotify的消息应用token
## gotify_priority 填写推送消息优先级,默认为0
export GOTIFY_URL="http://192.168.2.16:1001"
export GOTIFY_TOKEN="AkauOy4YVVsBZ9b"
export GOTIFY_PRIORITY=0

## 12. PushDeer
## deer_key 填写PushDeer的key
export DEER_KEY=""

## 13. Chat
## chat_url 填写synology chat地址，http://IP:PORT/webapi/***token=
## chat_token 填写后面的token
export CHAT_URL=""
export CHAT_TOKEN=""

## 14. aibotk
## 官方说明文档：http://wechat.aibotk.com/oapi/oapi?from=ql
## aibotk_key (必填)填写智能微秘书个人中心的apikey
export AIBOTK_KEY=""
## aibotk_type (必填)填写发送的目标 room 或 contact, 填其他的不生效
export AIBOTK_TYPE=""
## aibotk_name (必填)填写群名或用户昵称，和上面的type类型要对应
export AIBOTK_NAME=""

## 15. CHRONOCAT
## CHRONOCAT_URL 推送 http://127.0.0.1:16530
## CHRONOCAT_TOKEN 填写在CHRONOCAT文件生成的访问密钥
## CHRONOCAT_QQ 个人:user_id=个人QQ 群则填入group_id=QQ群 多个用英文;隔开同时支持个人和群 如：user_id=xxx;group_id=xxxx;group_id=xxxxx
## CHRONOCAT相关API https://chronocat.vercel.app/install/docker/official/
export CHRONOCAT_URL=""
export CHRONOCAT_QQ=""
export CHRONOCAT_TOKEN=""

## 16. SMTP
## JavaScript 参数
## 邮箱服务名称，比如126、163、Gmail、QQ等，支持列表 https://github.com/nodemailer/nodemailer/blob/master/lib/well-known/services.json
export SMTP_SERVICE=""

## Python 参数
## SMTP 发送邮件服务器，形如 smtp.exmail.qq.com:465
export SMTP_SERVER=""
## SMTP 发送邮件服务器是否使用 SSL，填写 true 或 false
export SMTP_SSL=""

## smtp_email 填写 SMTP 收发件邮箱，通知将会由自己发给自己
export SMTP_EMAIL=""
## smtp_password 填写 SMTP 登录密码，也可能为特殊口令，视具体邮件服务商说明而定
export SMTP_PASSWORD=""
## smtp_name 填写 SMTP 收发件人姓名，可随意填写
export SMTP_NAME=""

## 17. PushMe
## 官方说明文档：https://push.i-i.me/
## PUSHME_KEY (必填)填写PushMe APP上获取的push_key
## PUSHME_URL (选填)填写自建的PushMeServer消息服务接口地址，例如：http://127.0.0.1:3010，不填则使用官方接口服务
export PUSHME_KEY=""
export PUSHME_URL=""

## 18. 飞书机器人
## 官方文档：https://www.feishu.cn/hc/zh-CN/articles/360024984973
## FSKEY 飞书机器人的 FSKEY
export FSKEY=""

## 19. Qmsg酱
## 官方文档：https://qmsg.zendee.cn/docs/api/
## qmsg 酱的 QMSG_KEY
## qmsg 酱的 QMSG_TYPE send 为私聊，group 为群聊
export QMSG_KEY=""
export QMSG_TYPE=""

## 20.Ntfy
## 官方文档: https://docs.ntfy.sh
## ntfy_url 填写ntfy地址,如https://ntfy.sh
## ntfy_topic 填写ntfy的消息应用topic
## ntfy_priority 填写推送消息优先级,默认为3
export NTFY_URL=""
export NTFY_TOPIC=""
export NTFY_PRIORITY="3"

## 21. wxPusher
## 官方文档: https://wxpusher.zjiecode.com/docs/
## 管理后台: https://wxpusher.zjiecode.com/admin/
## wxPusher 的 appToken
export WXPUSHER_APP_TOKEN=""
## wxPusher 的 topicIds，多个用英文分号;分隔 topic_ids 与 uids 至少配置一个才行
export WXPUSHER_TOPIC_IDS=""
## wxPusher 的 用户ID，多个用英文分号;分隔 topic_ids 与 uids 至少配置一个才行
export WXPUSHER_UIDS=""

## 22. 自定义通知
## 自定义通知 接收回调的URL
export WEBHOOK_URL=""
## WEBHOOK_BODY 和 WEBHOOK_HEADERS 多个参数时，直接换行或者使用 $'\n' 连接多行字符串，比如 export dd="line 1"$'\n'"line 2"
export WEBHOOK_BODY=""
export WEBHOOK_HEADERS=""
## 支持 GET/POST/PUT
export WEBHOOK_METHOD=""
## 支持 text/plain、application/json、multipart/form-data、application/x-www-form-urlencoded
export WEBHOOK_CONTENT_TYPE=""

## 其他需要的变量，脚本中需要的变量使用 export 变量名= 声明即可
###kuku3863
export weibo_my_cookie="https://api.weibo.cn/2/cardlist?networktype=wifi&qa_optimize_enable=1&card211_enable=1&image_type=heif&launchid=10000365--x&pd_redpacket2022_enable=1&is_pad=false&oem_os=miui_11&orifid=profile_me%24%24231093_-_chaohua&uicode=10001387&ul_hid=b489c72c-9703-4d99-a8e9-88ccfdaf0d84&ul_sid=a711551a-26c8-400b-905f-bef42da609fe&moduleID=708&wb_version=7210&hotSearchPushCard=1&card159164_emoji_enable=1&source_code=10000011_profile_me&lcardid=139d4489-5e51-44f5-b244-aed6e1dc462e&c=android&s=1bc619c7&ft=0&tz=Asia%2FShanghai&ua=Xiaomi-MIX%202S__weibo__15.1.2__android__android10&wm=4251_4002&aid=01A5_RYJ1l1G0mGLCIN8AqkwBd_bOcQJGZn43yJbTMU5_uQdg.&fid=232478_-_bottom_mine_followed&uid=7008584066&v_f=2&v_p=90&from=10F1295010&gsid=_2A25K5fWQDeRxGeFO61oU-CrMzTqIHXVnsw5YrDV6PUJbkdAGLRXmkWpNQZop2TuYspUKLMaIIqYtJmOs_V4bCp4P&imsi=&lang=zh_CN&lfid=231093_-_chaohua&page=1&skin=default&count=20&dlang=zh-CN&oldwm=5311_4002&sflag=1&oriuicode=10000011_10000011&containerid=232478_-_bottom_mine_followed&ignore_inturrpted_error=true&no_location_permission=1&luicode=10000011&android_id=bf13bf4649276c6a&supergroup_album_v2=1&client_key=8487b4367656e1aea751c066779ebb84&need_new_pop=1&card199_realtime_enable=1&ul_ctime=1742833421942&is_winter_olympics_enable=1&need_head_cards=1&cum=80BF89E5"

###wd210010
###天气推送
export city_code="101271606"
export plustoken="8dedc5cdf79547cea7dc42029e043638"
###STLXZ签到
export stl_cookie="8dedcX_CACHE_KEY=6b691df57de0f58bdc8a3125aa178d7a; PHPSESSID=tfk98c2qqsq49t9qsjl83dfo9u; wordpress_logged_in_551d8ad33ea26dbf8de7df033398e37e=smile23452651%7C1744068965%7CJ24SI5RuOPG4Kx0qsBTBgnM6fSSCCi89CiN0qnAdgd1%7C7fcb9a498a696af353ceb27430422a735e0c5e8cb0584113c6dd88f5d03c6b235cdf79547cea7dc42029e043638"
###千图网签到
export qtw_cookie="qt_visitor_id=%22b052a9d370b837dea0b1535c9667228c%22; qt_type=0; did=%2280686b3d1f90de97%22; history_did_data_80686b3d1f90de97=%22eyJkaXN0aW5jdF9pZCI6IjgwNjg2YjNkMWY5MGRlOTciLCJ1dG1fY2FtcGFpZ24iOjAsInV0bV9zb3VyY2UiOjAsInV0bV9tZWRpdW0iOjAsInV0bV90ZXJtIjowLCJ1dG1fY29udGVudCI6MCwidGlkIjowfQ%3D%3D%22; qiantudata2018jssdkcross=%7B%22distinct_id%22%3A%22195ca87829a210-0d22a2d8d95f71-4c657b58-1327104-195ca87829bcba%22%7D; qtjssdk_2018_cross_new_user=1; new-old-switch=new; loginBackUrl=%22https%3A%5C%2F%5C%2Fwww.58pic.com%5C%2F%22; register_success_target_path=%22%5C%2F%5C%2Fwww.58pic.com%5C%2Fenroll%3Ffrom%3Dteam%26type%3Dpurpose%22; imgCodeKey=%220cb972ad70854b39095367dbcddce66d%22; auth_id_v2=nttJn7I4zD8nmw5s5m7-DwSOIQPJSNnwhHJ7DDCAedn7Y7OT3ZmlzyGGd54pFdURrldMGnbnljSH4w9vElLerAChe4WGoIXAQy5nqMRu5T1y8UgEVDiSfvGwBl2S7e1sjojZ-HMLE-Xjc18ShR4cJ8bH_g9Mkd46ec8zdtxymFwVTNxWqq9oNi1fcdHmXPrgbi-1pzsdi6i03Mma2e0q9Fy-0qrcKE3d9pkE5-J2hlSbQa5S0CuzHh20ampkmsN33zxXZ6Gpwgvl4htUzsmegQ; auth_id_list=w-vJrIPUSek9vBuAdX3FQfPIFa5GiSBjrd8Y0E8tuuyGmQIsTMbpI5MrpBTC6cA0Wh8FQMAcKQf5TmskpSuK1okxjeGm00bSpCget8l4DijhOPGZ9GbMxCkWgTip3VLzR4blgACXlZRWqCkaZuZ_VQ5Rj8WvfVxehVa-sd_4SAMjuK4_l4W5Y070aYvpatncWbWWWPyZFAkNqL64Pn7lHpri96edyS6dll1qT422et363Lc308_XoVUK4CSlJzFDBlrGPVL5T1LORA1dTKlGfv8WEycjxpTJoC4CzcxNlrOiHNu-_OsxVyUKFh0an_GjzgDA_WInweKw3Em3qC84UeB-t7PdYAOascdyrU5A0xZTumwp4kIfbIUXgmTBps1D7gzG9jN1m2sRMWOid_TSoo1KUBhslUk7r5ebX23zUdMd5afCiV9_wDbjyi2ByqaTQO6jPbYX8idTTGUnZdDmSAma6WnqPPr8J-5s6Av6kyK2cFZu-MlxmiVGxEPJKnQztjCS5zaxxAjPi6PvW7mQ9JYBnEIS1DvLEnJzBbJCrlK3UaUtjrnWPEDVVUf5uZMA; login_status=1; auth_id=%2282758556%7CODI3NTg1NTY%3D%7C1744069261%7C7e929bc3a867251745c37aee6ab6eaec%22; ssid=%2267e1ed8d48fbd7.99918554%22; _is_pay=0; qt_risk_visitor_id=%228d1398972bb0d2674bdcceab5c74fab0%22; tid_today_data_80686b3d1f90de97_20250325=%22eyJub1RvZGF5RGlkIjoxfQ%3D%3D%22; history_uid_data_82758556=%22eyJ1aWQiOiI4Mjc1ODU1NiIsImRpc3RpbmN0X2lkIjoiODA2ODZiM2QxZjkwZGU5NyIsInV0bV9jYW1wYWlnbiI6MCwidXRtX3NvdXJjZSI6MCwidXRtX21lZGl1bSI6MCwidXRtX3Rlcm0iOjAsInV0bV9jb250ZW50IjowLCJmaXJzdF90cmFmZmljX3NvdXJjZV90eXBlIjowLCJ0aWQiOjB9%22; success_target_path=%22%5C%2F%5C%2Fwww.58pic.com%5C%2F%22; sns_uid=82758556; qt_uid=%2282758556%22; censor=%2220250325%22; preseat=%u6211%u7684VIP%u9875%u9762; _uab_collina=174285969884201576943779; message2=1; han_data_is_pay:82758556=%222%22; tfstk=gM3oB8_rP0r7MhDOexzWXaHiS3-vP_aQcvQLpyee0-yfeTQ-TZ5qOY08YLa--xD-H2nRJXlFtXazA0eLeJ4nOAAvBFLtNbaQzdp9W-kafa41UayFpSr4OyVPGcit6baQ8KhDq-rSNAW3Dhnz8I44T5bU8uzF3IVg9y7zYaSV3-NU8yrzTr84wWFFUgreijybTyyELyluG3yS8qu23M9VgxuHz4VuqRlzUbEruIEVVYecXGgmmowN--bF8qVrMNxMDNxLQcw8XRk2ka4ngWD0X0vGrvcE1Drm-TR-QxonLSiXKM2iYbnskoCF4j03Eluzm6Ot_bNELkmXINFuymqir0OC3bkTEczS91v-ilm0fSrVtgz-Xf3Qb48lC-E_txqtqdboQgSd0GWkMwN29qSCAuPbiR3fjaRSaizFJIAcbBZzG7w9iIjCAuPbiRdDiGRQ4SN7B; buy_all_sku_82758556=false; IPSSESSION=21qu79j0qo7hmlrv84g8ilftu1; ui_58pic=dWlkPTgyNzU4NTU2JnVjPTIwMjUtMDMtMjUgMDc6NDM6MDMmdj0xJnVzPSZ0PThiMmFmODZkNWUzZDBjMjE4YjRkNGNkMmZhNDdhNTA3MTc0Mjg1OTc4My4wOTE4ODU2MjMmZ3I9MSZ1cnM9; track_id=d1ea00ceba82a14db59965fd79edef1c5ad595d030f7d9bedb79302b400cd746a%3A2%3A%7Bi%3A0%3Bs%3A8%3A%22track_id%22%3Bi%3A1%3Bs%3A52%3A%228b2af86d5e3d0c218b4d4cd2fa47a5071742859783.091885623%22%3B%7D; public_property=%22eyJ1aWQiOiI4Mjc1ODU1NiIsImxpYiI6InBocCIsImxpYl92ZXJzaW9uIjoiMS4wIiwiZXF1aXAiOjEsImRpc3RpbmN0X2lkIjoiODA2ODZiM2QxZjkwZGU5NyIsImV2ZW50X25hbWUiOiIiLCJzZXJ2ZXJfYWdlbnQiOiJNb3ppbGxhXC81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXRcLzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZVwvMTM0LjAuMC4wIFNhZmFyaVwvNTM3LjM2IEVkZ1wvMTM0LjAuMC4wIiwidXJsIjoiaHR0cDpcL1wvd3d3LjU4cGljLmNvbVwvIiwidGltZSI6MTc0Mjg1OTgwMiwiY2xpZW50X2lwIjoiMTcxLjg5LjUzLjIxNSIsIm9zIjoiV2luZG93cyAxMCIsImJyb3dzZXIiOiJDaHJvbWUiLCJicm93c2VyX3ZlcnNpb24iOiIxMzQuMC4wLjAiLCJyZWZlcnJlciI6Imh0dHBzOlwvXC93d3cuNThwaWMuY29tXC91XC84Mjc1ODU1NlwvZWRpdCIsImxhdGVzdF90cmFmZmljX3NvdXJjZV90eXBlIjpudWxsLCJsYXRlc3RfcmVmZXJyZXIiOm51bGwsImxhdGVzdF9yZWZlcnJlcl9ob3N0IjpudWxsLCJsYXRlc3Rfc2VhcmNoX2tleXdvcmQiOm51bGwsImxhdGVzdF91dG1fbWVkaXVtIjpudWxsLCJsYXRlc3RfdXRtX2NhbXBhaWduIjpudWxsLCJsYXRlc3RfdXRtX3Rlcm0iOm51bGwsImxhdGVzdF91dG1fc291cmNlIjpudWxsLCJsYXRlc3RfdGlkIjpudWxsLCJsYXRlc3RfdXRtX2NvbnRlbnQiOm51bGwsInF5X2lkIjowLCJ1c2VyX3N0YXR1cyI6MSwidGlkIjowLCJ1dG1fc291cmNlIjowLCJ1dG1fbWVkaXVtIjowLCJ1dG1fY2FtcGFpZ24iOjAsInV0bV9jb250ZW50IjowLCJ1dG1fdGVybSI6MH0%3D%22; qt_utime=1742859803; big_data_visit_time=1742859803"
###小米社区任务得成长值
export mi_account='1427459750'
export mi_password='ZQL921101zch'
###科技玩家签到
export kjwj_username="809932602@qq.com"
export kjwj_password="ZQL921101zch"
###夸克签到
export COOKIE_QUARK="ctoken=-7Pm5ZxjQupky2pzfEh2KuAo; b-user-id=6fa40fb8-2d4a-1b7a-9e5e-9b0edae5b033; grey-id=5cb48ec2-f219-a30c-e720-7b8c50faa01a; grey-id.sig=w3ZA_Wls2Zwsq43HWrP6bRHqwze3TY3HFtYC1oot4r0; isQuark=true; isQuark.sig=hUgqObykqFom5Y09bll94T1sS9abT1X-4Df_lzgl8nM; _UP_A4A_11_=wb9c7161dfd34f15b0a24f27056aaa8f; _UP_D_=pc; __wpkreporterwid_=5f05135e-41e9-4ba7-3c10-688fe64441c1; _UP_F7E_8D_=8gnyxJ%2BRu9RsAJ5tIhbv0UPwKLOVbxJPcg0RzQPI6KmBtV6ZMgPh38l93pgubgHDQqhaZ2Sfc0qv%2BRantbfg1mWGAUpRMP4RqXP78Wvu%2FCfvkWWGc5NhCTV71tGOIGgDBR3%2Bu6%2Fjj448WcvW%2BrZF83ZcbcwDawvDdjkhOclrgipqYAbrjqRo9YuUE9%2Fs5crDEn21dZLBeV%2Bc0W2is4xiq6v5%2F2PYv5cDtgmUOa1o3aAVnmq8VgCR9iU1VZu4DtwRoAg3J36dS9aj1m9P204NQdNf5Nyo3ldtw6TWtrcg0yJducQVbH%2BT5yM6TQ0ySWQ88mFyMhj2VouQ%2B%2BFKM%2B0tL1ggY93VJqD%2BguZ2Gmw5X%2FVXG5%2BATr9eEKxIvk7CLNVTZPG%2BMXyVR0GjxobkrXAZ3eIMTE7RyZru; _UP_30C_6A_=st9c762011ab7lqha8pddhusgkgmjr5b; _UP_TS_=sg1a95ab480170ace3073565c044dc31387; _UP_E37_B7_=sg1a95ab480170ace3073565c044dc31387; _UP_TG_=st9c762011ab7lqha8pddhusgkgmjr5b; _UP_335_2B_=1; __pus=71b7928517263fda3264cd6987c26022AAQa9ulHTUh8t43JuzJML68idNJom35+HiLrMHE/tWMa4BiSm1b69HvD7ftygRB9JvX9P6nDRa0VeoxYP0pYBjRZ; __kp=137be6b0-090c-11f0-8db6-fd495d04df12; __kps=AASX04k/Foc/k2h5K/wK8AjG; __ktd=ElNuGNW177J+FwamT5l8Rw==; __uid=AASX04k/Foc/k2h5K/wK8AjG; web-grey-id=45270c47-f352-ec7d-ad70-9754e8dd8419; web-grey-id.sig=40FGocdZyRuZ9YdDq6JS2rHxCbh28PBSg9eQgqrDnjg; tfstk=gtuxpAwnMLv0WuUHoEtlSH-Vi_RkEVhVyxlCSR2cfYH-tYygfoV0WlMbEqqglKzTC8MNmZ2goVH-UYkmif0t4NhE_qA4SIzqgPz6KpYnWjl47ad6smuYPzNsNS6_G347qqPOgpYH-jMl3zN9KqxzcswQ1PNbfZGWw5Vg5ZZjC8Z7OWXb5PM6waNU1Gsf5Pw5P8P_5RM_5QhSNZfYIswOWDTeBO5JDq_154FYV3cUFLoskSEYdjgA5NtQMoeIG8pF5GwbVfrt717TXjiEQWMfhdeZybgjAv9lm-iL6XmtGE_7oqljAlgBQGG4o-USlDC15bUYnA3tUtp8dqlS8zZkRBhSzxcqyff657D3FjubWeOUkrwby7uMUZwtVcg00PWXBRu-NqiO45unJNmGKJFGDQdRbGrbaaRSmP2pHXbuwJAlqGSaq7P8KQdRbGrba7eHZgjNbuVP.; __puus=67dc9eebbef7c81faa13b6c57780fb85AAQ9ot3kbixrRFr8pOVxcX85hV3CyqUyqMyAi5DL6rs58lSL4aSb9qbYsBWMyO7UGMPCaACqlmy/Phgzr9UHa3T2ns+W/GIRJIBkypM1tPzsFYC0X8Z3q9fDIJc//VypXyeDphLWJZcVD8KlXuCknvgOApMjwq1uClBMh5jwtKkDx96Pwqv9ewUSAlQ8m+wPxFWu98sLLO6eYdmeetxc1UOv"
###IKuuu机场签到帐号版
export ikuuu='1065284227@qq.com&ZQL921101zch'
###BsaLee
###有道云签到
export YOUDAO_COOKIE="hb_MA-B0D8-94CBE089C042_source=cn.bing.com; __yadk_uid=4XMCDRjO0reRl8a5CHwhsiUOsvScwmBN; OUTFOX_SEARCH_USER_ID_NCOO=970141677.8138413; NTES_YD_SESS=gJWQfcs42BTnvMzzpDmR_pJoP026gqeJ3qBVvom3rrALj0mKjiCG5_LolN3MFit2sn2i81ICN9eNxT4FOvJQzbNuDuygy2yfCb0hiJGHszuyQHRYvPnjEz2IoRKvNc0gdgCKMnJZr5MENp9uzbQZxGY42YK28nfLnCv1cXUi8lTDfuJVjSSIpaNnw0cVz4t85tfePihLjRQO_PRXbkmnrdeaV75kW0t5utokWSteRHwR8; S_INFO=1742832660|0|0&60##|18113355128; P_INFO=18113355128|1742832660|1|youdaonote|00&99|null&null&null#sic&510600#10#0|&0|null|18113355128; YNOTE_SESS=v2|ccM01Qhxom6ukLwzhLO50U5RMqy6LeuRpyRMz50MUfRqB6MOY0LzE0P40MTFhfTB0wyOMYEhfUf0QuhHkMPMwLRzERLezhLkA0; YNOTE_PERS=v2|cellphone||YNOTE||web||-1||1742832661045||171.89.53.215||weixinobU7Vjn0JUAR_17yg2Mfvzfr-_yM||wK6MkEkfw4RlA6MkY0MO5RzW6LPynMJ4Rll6LlEhMeK0JLhMpLP4kW0wyRMTyPMQ40QK0fQ46Mq4RUfOM6ykfUm0; YNOTE_LOGIN=3||1742832661209; YNOTE_CSTK=BL8RtneF"
###电信
export chinaTelecomAccount="18113355128#921017&18113356252#990918&18113355759#690714&19915537653#921017&19960293430#690714"
###同程旅行
export tongcheng="18113355128 41f8dde887ff7d2179ad7b5512269551 456ee6098c98127d"
###塔斯汀签到
export tasitingsign="18113355128 sssef4874de-ed65-4af5-b598-73787ea3f56b"

###smallfawn
export sfsyBee="true"
export sfsyUrl="https://mcs-mimp-web.sf-express.com/mcs-mimp/share/app/shareRedirect?sign=nOTxyiy8wMYX%2B%2FM98F67eqEVyFtl3dWFwJW4S%2BouIeTVv1jBZKJH2uSfG18GannnCqa41kqHU%2BgS6xryhUEM2qBVDgnrvmo8mAaw4d50njxZl5%2Fd64W8urYFSYtHkHFwUUBaqkEkKGhtKqEdXjB%2Fx%2F4puZp081tDLOBxZmejDX25905dB7SGQ6jDom1VuSP8Zf5zsjKqqLKpvmplKFSfYZwmIORurEdR7qRdcooby7iWy%2FrAV1DF%2B%2BRY3gQ0Mxsu%2FvjLphfBkXjUgNgO8eGvCmu83ThBplaQVz7I5o725%2BDRKuERxGds4M6OjAdToz7vpq8fqjIe2EmOHwgDY4tsCw%3D%3D&source=SFAPP&bizCode=619@VWJWUTNWdEJ2WFRRdCtxUmxLei9sbG9xTEdsNFh3ZVd3bU5RTDJiVFQ2c0dVQ1VLLzdDMVhKZE55R1lxZXdiVzVwVE5TWjJ3aDdKbkMxZFJOU2VRY2FyejZlaytoT2FxUzdrS1JBTXMyVVRSOUVLTk9tZzVESjF4WTh5QU5sdHdIeWpGNUxXbXlXRlpJR1lZelloblFBPT0=&citycode=834&cityname=%E5%87%89%E5%B1%B1%E5%BD%9D%E6%97%8F%E8%87%AA%E6%B2%BB%E5%B7%9E"
export chery_data="jpdwKgJpT-VINJVvvAIAWgAAAAAAAAAU"

export dewuUserAgent="Mozilla/5.0 (Linux; Android 10; MIX 2S Build/QKQ1.190828.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/135.0.7049.99 Mobile Safari/537.36/duapp/5.65.0(android;10)"
export dewuSK="9RR8Kttq8jFAZMKSj5ma8q4Czy8zoBFjFpI2bI00OK3ERSuexqNy0UPZTuNOOUHzRighoVBNsxTave5nJHbfGg730V1w"
export dewu="eyJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NDUyNzkxOTksImV4cCI6MTc3NjgxNTE5OSwiaXNzIjoiMTdlYTQxZjA5ODQyM2I3NiIsInN1YiI6IjE3ZWE0MWYwOTg0MjNiNzYiLCJ1dWlkIjoiMTdlYTQxZjA5ODQyM2I3NiIsInVzZXJJZCI6MTQxNTM2ODEwNCwidXNlck5hbWUiOiLmn6_ku6XnhpkiLCJpc0d1ZXN0IjpmYWxzZX0.YctMLy1MRe7hjMy_5rbDmmt6A8bCqlffQOBwnkVDrF5fyW4TkujrzzCRMFMVNcCoS4pEzxLstL0aP-YM2Owqerf5_WMC4N3g7gVva89xIEjl_2wkBqb5SR4ad4TIEzFNPdChb8_VuMzfsdGGiwYLuFKpAOcK30weyj_zTYXTNU3gBUTNn17JXwXObxkV8ndH4abdC_RvNB_7T0YvR23ySV9-b4o2vTL8b_F3DSQ2_gQSioeGqpq959s5wn3BKBeWbOB5ppzrmPa_Y7JRUVrjAY3k0ojJim7HiS_ecpenszFoTFBAWA4IfQDsOFPF2jy00PsDRqhiGAbINPyy9h39gg#85e710fd88a4c5ae7386ac04eb27b72c0293e082451cc0a4696715ce7ca77b94ab48668dac49b6c9362ef3c714ef6d9f3850f0e9c2c22a11f592a9a3dcd13ec6e00fbe0ab4eb4025461e83c404e261b6|1415368104|1745279069|38892cd70f5edf63f37bcc1f55aa978f937c3cd6|1-0|79ca5825ca3404ce"


export dewuCK="eyJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NDUyNzkxOTksImV4cCI6MTc3NjgxNTE5OSwiaXNzIjoiMTdlYTQxZjA5ODQyM2I3NiIsInN1YiI6IjE3ZWE0MWYwOTg0MjNiNzYiLCJ1dWlkIjoiMTdlYTQxZjA5ODQyM2I3NiIsInVzZXJJZCI6MTQxNTM2ODEwNCwidXNlck5hbWUiOiLmn6_ku6XnhpkiLCJpc0d1ZXN0IjpmYWxzZX0.YctMLy1MRe7hjMy_5rbDmmt6A8bCqlffQOBwnkVDrF5fyW4TkujrzzCRMFMVNcCoS4pEzxLstL0aP-YM2Owqerf5_WMC4N3g7gVva89xIEjl_2wkBqb5SR4ad4TIEzFNPdChb8_VuMzfsdGGiwYLuFKpAOcK30weyj_zTYXTNU3gBUTNn17JXwXObxkV8ndH4abdC_RvNB_7T0YvR23ySV9-b4o2vTL8b_F3DSQ2_gQSioeGqpq959s5wn3BKBeWbOB5ppzrmPa_Y7JRUVrjAY3k0ojJim7HiS_ecpenszFoTFBAWA4IfQDsOFPF2jy00PsDRqhiGAbINPyy9h39gg#85e710fd88a4c5ae7386ac04eb27b72c0293e082451cc0a4696715ce7ca77b94ab48668dac49b6c9362ef3c714ef6d9f3850f0e9c2c22a11f592a9a3dcd13ec6e00fbe0ab4eb4025461e83c404e261b6|1415368104|1745279069|38892cd70f5edf63f37bcc1f55aa978f937c3cd6|1-0|79ca5825ca3404ce#9RR8Kttq8jFAZMKSj5ma8q4Czy8zoBFjFpI2bI00OK3ERSuexqNy0UPZTuNOOUHzRighoVBNsxTave5nJHbfGg730V1w"
export meituanCookie="AgFMIoHU50PuHRrFSY4iPSNI0lxJM38o6KcekiXAUL8D99XMT7mw7JGjSvMiYzyXEHwONY6Uyts0rAAAAACfKAAAEHVa-MkiLrSuYDcAO3wneXoUh-hbaezF8aVa0gEQ976DDF8GUN3nh4f0OArv06q3"

###sudojia
###甄稀冰淇淋小程序
export ZX_ICE_TOKEN='rvknhGUHI17OzVMtSMFyZOlFYO3IxamVT9cjMGsIBbQUBFzfIERSVu4xAflHJtCgbOLMKeWm0m6iOThqAhsUUpxAZlAmPYluUIoXzLc1iNc='
###薇诺娜专柜商城
export WNNA_TOKEN='f1ff76e2f41cc9fe26b84ca3a62feec972b9463d'
###TILTA影像城小程序
export TILTA_TOKEN='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyTm8iOiJvalc5MTZ4Z1FUMjZKUlphZkxXbU9FVklJR044IiwicHJvamVjdCI6InRpZXRvdV9hcGkiLCJoZWFkZXIiOiJBTkRST0lEMSwyMjIuMjE1LjE2NC4xOSxIVFRQLzEuMSxDSFJPTUVfTU9CSUxFLDEzNC4wLjY5OTguMTM2IiwiZXhwIjoxNzQ0NjM3ODI3LCJpYXQiOjE3NDQ0MjE4Mjd9.kZYvPB93_kDIwaa3FdvF9sLTD7N3ZaHsapM07QNeK8w'
###特步会员中心小程序
export TEBU_TOKEN='eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJhcHBJZFwiOlwid3gxMmUxY2IzYjA5YTBlNmYwXCIsXCJhcHBOYW1lXCI6XCLnibnmraXkvJrlkZjkuK3lv4NcIixcImdyb3VwSWRcIjo2MDAwMDEyNSxcImp3dFRva2VuS2V5XCI6XCIyZDJiNDliYTUzZmIzNjlkZDdiYmE2ZTMwYjkzOTU2ZjkxMDU2ZmIwMzEzNmEyYjMzYTE0YjU2NTU1MzgyNDQ3XCIsXCJtYWxsSWRcIjoxMDAwMDAxMTEsXCJtYWxsTmFtZVwiOlwi54m55q2l6Zu25ZSu5Lya5ZGY5L-x5LmQ6YOoXCIsXCJuaWNrXCI6XCJvY1V5cXdRZmxxRldFNGpVclctZVFPbTlFQm9jXCIsXCJvcGVuSWRcIjpcIm81elRjNHRlQ0tTdkp3bVFxWjhMWGMtVDVjeTRcIixcInNlc3Npb25LZXlcIjpcIkQ0VlZrQ2dpZVhiYjVhY2dOeWx5UFBQQllpVml4UmtEU0NYaHRjdC9kblE9XCIsXCJzaW5nbGVTaG9wXCI6ZmFsc2UsXCJ1bmlvbklkXCI6XCJvTWZXS3M5OFhkZmVJT00tQW9ubjhIeFlsR0w4XCJ9IiwiaWF0IjoxNzQ0NDIyMTI3fQ.qGiOJBL4CooqzqSJkMd2TsUM_0JVdyJRhio-Vjww1kL7VlrIWVoKJWVotzVmtFajsG-2Z9Cz6--i2Ct5FwTo0A'
###塔斯汀+
export TASTI_TOKEN='sss9cdfd1c1-3185-44c3-8409-1426f06f3bce'
###星妈优选
export STAR_MOM_TOKEN='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ4bXl4IiwiZXhwIjoxNzQ0NDI5NzQyLCJpYXQiOjE3NDQ0MjI1NDIsInVzZXIiOiJ1c2VySW5mbzpZYlJWQ1JBeURyaXpreUNWODU5aG1nMkk1WURVRmxVVExLOGM4cHJvSUpSSEJld1dPdDdCcmJsaFVzMW15aVRQWmlTVU9nZ2lveE5TMmx3MmJ4ME4ybDVnMlZKTmtldElTeUd1YVAraDdCN1ZPVWRsZG1QWVhmQWwzbmozajk3emROQUJyWFJPYzMyUXU5SzdIWHhxaGM3SVBnVDFMOC9XbkJsdldNYVZHQVZLSVI1UHFTZ2poUG84dExhb0NFOFhuUFlrL0lQQzFFK1o4VkN5L0dsalNOUkljTll0V2FSNE8rZEw4Mm9hdlVGbDgxeGNkM2Nadmt0WEtoRm5FcHIwOW1IdjYrRlYvMkxVTUVlZDlhUU9md1EzMzNoRlp1QWlBdytjMnE0YmdBMUl2QTdQZG0xcFFOSTFmaDJCQThnaGIyZWczbmFoZmtTR3hib3lCSWhrTGc9PSJ9.EWBYquJbzHCzyRzrfqDihfCUzRhmQg5j87hRoqS1nrM'
###爷爷不泡茶
export PAO_TEA_TOKEN='jXn327NLokxh6Z_WNbC_-3NihdDMCCgCLfjwPlHGlVywY_kAB6x_EXYqn9gcqW7nENkI5FO3y-NPbGmiaWI0hQ#activityId'
###雀巢会员
export NESTLE_TOKEN='eyJhbGciOiJSUzI1NiIsImtpZCI6Ijk1RDNEQzJDRDg0REM5Nzc1MDE0NzhBQkVDQjBBQ0Q5MjU3QjRGMjNSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6ImxkUGNMTmhOeVhkUUZIaXI3TENzMlNWN1R5TSJ9.eyJuYmYiOjE3NDQ0MjMwNzEsImV4cCI6MTc0NzAxNTA3MSwiaXNzIjoiaHR0cDovL2lkZW50aXR5OjgwODAiLCJjbGllbnRfaWQiOiJ3ZWNoYXRNaW5pIiwic3ViIjoib2lySWQxY3R4RHZjd2hYNVVLNWdJaDVYelphZyIsImF1dGhfdGltZSI6MTc0NDQyMzA3MSwiaWRwIjoibG9jYWwiLCJ1bmlvbmlkIjoib2lySWQxY3R4RHZjd2hYNVVLNWdJaDVYelphZyIsIm1pbmlfb3BlbmlkIjoib050SzE1QThfYTdZbFMyQUsyc1NjXzdKTW5qWSIsInVzZXJfaWQiOiIxNjAwMDAwMDAwMDAzOTE0MTY1IiwianRpIjoiQ0MzMDZEQjc3RDNGREZBNEY5RTcwQzkxMDYxNzI2RDEiLCJpYXQiOjE3NDQ0MjMwNzEsInNjb3BlIjpbImdhdGV3YXlfYXBpIiwiZ29vZHMiLCJtZW1iZXIiLCJvcmRlcnMiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsid2VjaGF0X2F1dGhfY29kZSJdfQ.A7j54Ler5QKHalKgH0L-MHUjIy2WX4dl_RIlbNfAcP4-hthg-BRCQdqU-kiWz3QHE8g31WKdeNOwiQ8BJ-DOgBqVas4TI-oZ7a6LzdslkfxzilpKtvUa8iw0WTIMwPedDrsrZSfxoXC4e3DAjY_pBawwMeSh1GiGzMAJ0VlLCWO1z6dEmM9htuN7lHJK3yaKuHrQtdKYaeG-o-Dh9uVzw-ZwtdEk_MUh7Kar44gfLIoF9a9rTJnpT0W3kuLsdGj4NceMEJqZbjwFLk0TpVA6ysSnRXcNV1BWnGdXdS6bZuZ2H-cLIvaFmvIgjVAYhGFf0T6Gi2kcUQNh26t29MDc1A'
###南方航空小程序
export NFHK_COOKIE='2041c32737de48daadc4fa288fa8da58'
###奈雪点单小程序
export NAIXUE_TOKEN='eyJhbGciOiJIUzI1NiJ9.eyJ1bmlvbkNvZGUiOiJQNjIyMjY1Njg3NjY5OTk5NjE2NyIsInVzZXJJZCI6IjE0MjAyMzY2OCIsImJyYW5kIjoiMjYwMDAyNTIiLCJwaG9uZSI6Im9iOXlBNG5YMF9HRUg0SjVzTGFZMzFZeFhyS1kiLCJpc3MiOiJwZC1wYXNzcG9ydCIsInN1YiI6IjE0MjAyMzY2OCIsImlhdCI6MTc0NDQyMzkxMSwiZXhwIjoxNzU0NzkxOTExfQ.T7AGDGebbr4g3_7Q76OA-xLENFF_giJK1BqIYfW8cBc'
###阿里云盘签到
export ALI_REFRESH_TOKEN="2e4886d2a2d24622828a2c3589624d9f" 