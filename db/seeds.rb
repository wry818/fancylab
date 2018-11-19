# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.create email: "xyang@entertainment.com", password: "temp1234", password_confirmation: "temp1234", admin_flag: true
#
# UserProfile.create user: user, first_name: "Xiaobing", last_name: "Yang", child_profile: false
#
# # Create three default campaign stories
# CampaignStory.create title: "模版1", created_at: Time.new
# CampaignStory.create title: "模版2", created_at: Time.new
# CampaignStory.create title: "模版3", created_at: Time.new
# CampaignStory.create title: "模版4", created_at: Time.new
#
# # Create the collection of direct donation
# Collection.create id: 0, name: "Direct Donation", active: false, slug: "Direct-Donation", created_at: Time.now, donation_percentage: 100
#
# # Create the default user of EPI Support
# user = User.create id: -1, email: "support@epi.com", password: "temp1234", password_confirmation: "temp1234", admin_flag: false
#
# UserProfile.create user: user, first_name: "EPI", last_name: "Support", child_profile: false
#
# # Set default chairperson email text
# admin_setting = AdminSetting.new
# admin_setting.default_cp_email_message = '<p>Please help us raise even more funds by joining the online fundraiser for {{fundraiser.title}}. It is simple and fun to set up your own personal fundraising page. Then, you can reach out to your supporters through email and social media and so they can purchase directly from your page, while you get credit!</p>
# <p>Click <a href="{{fundraiser.signup.url}}" target="_blank">this link</a> to get started.</p>
# <p>The SOONER you join, the MORE you can sell!</p>'
# admin_setting.save
#
# AccountType.create id: 1, name: "18岁及以上"
# AccountType.create id: 2, name: "14-17岁"
# AccountType.create id: 3, name: "13岁及以下"
# AccountType.create id: 4, name: "销售"
# AccountType.create id: 5, name: "客服"

FancylabVideo.create id: 1, video_id: "u0314u5sl8o", video_title: "光影", video_name: "【奇妙实验室】光影", video_url: "http://v.qq.com/iframe/player.html?vid=r0603afhnan&auto=0", video_likes: 65
FancylabVideo.create id: 2, video_id: "d0315nhpyj5", video_title: "动物音乐会", video_name: "【奇妙实验室】动物音乐会", video_url: "http://v.qq.com/iframe/player.html?vid=m0603emjqxm&auto=0", video_likes: 97

Course.create id: 1, title: "植物・说", cover_image_id: "v1541746437/800b42a9a8c2dbf8001bacd9af9ddc8f_bejkus.png", introduction: "给宝贝的一堂特殊的自然科学启蒙课！带领宝贝玩转大自然~", description: "", base_price: 169, issue_count: 13, subscriber_count: 289, slug: "zws"
Course.create id: 2, title: "奇妙微学堂", cover_image_id: "v1541736914/1bbb009ba708ada9baedd3f9598376bf_xcs852.png", introduction: "源自欧美STEAM教育体系最专业的科学课。系统的整理了声音、空气、光影等十一大主题的内容。有趣的实验故事，科学达人的指导解答，用家里随手可得的素材陪孩子玩出最炫的神奇实验！", description: "", base_price: 28, issue_count: 59, subscriber_count: 398, slug: "qmwxt"
Course.create id: 3, title: "拯救妈妈的最全手工大合集", cover_image_id: "v1541746435/5c8f1ff6fc23b4f3fb934816f721472b_wwwpxq.png", introduction: "还在为每次节假日孩子幼儿园布置的手工作业发愁吗？还在为新年该怎么制作贺卡苦恼吗？我们帮你解决！专栏内包括各种各样你需要的手工，手把手教你如何制作，用最简单的材料，最详细的步骤让你变身超人妈妈~ 横扫所有手工作业！", description: "", base_price: 199, issue_count: 101, subscriber_count: 303, slug: "zjmmdzqsgdhj"

AdvertisementImage.create id: 1, image_id: "v1541746467/ae945df25d11b1ad9988c6a36797aaa3_pouypo.png"
AdvertisementImage.create id: 2, image_id: "v1541746469/eb39a5c1a5e8880773482f5a55c5c23d_gckg6o.png"
AdvertisementImage.create id: 3, image_id: "v1541746467/119b2804ddfe13984a501c7bd2688ea1_dabzw8.png"

SubCourse.create id: 1, title: "用科学实验 陪孩子“玩”一整年", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/compress/1bbb009ba708ada9baedd3f9598376bf.png", description: "", base_price: 0, slug: "ykxsy-phz-w-yzn", course_type: 1, browser_count: 232
SubCourse.create id: 2, title: "关于种植的问题", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/compress/59e4253730c00c209db1764501984383.jpeg", description: "", base_price: 0, slug: "gyzzdwt", course_type: 1, browser_count: 331
SubCourse.create id: 3, title: "添加客服微信", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/compress/008a53edaf9cb3864e36f1eff3e36720.jpeg", description: "", base_price: 0, slug: "tjkfwx", course_type: 1, browser_count: 72
SubCourse.create id: 4, title: "风吹画课程模板", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/compress/1065efe980142117a85d59be0c183554.png", description: "", base_price: 0, slug: "fchkcmb", course_type: 1, browser_count: 122
SubCourse.create id: 5, title: "链接若失效 请联系妙妙", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/compress/429564ba2e1c99bcec4c5c892a5f9c3c.png", description: "", base_price: 0, slug: "ljrsx-qlxmm", course_type: 1, browser_count: 121
SubCourse.create id: 6, title: "动物杂技手工", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/compress/e24766a5f985c63e6d914f2bcb14249a.jpg", description: "", base_price: 0, slug: "dwzjsg", course_type: 1, browser_count: 50
SubCourse.create id: 7, title: "给宝贝的一堂特殊的自然科学启蒙课！带领宝贝玩转大自然~", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/compress/ab327a0206805d5763a8ef61c8bc7bf5.png", description: "", base_price: 0, slug: "gbbdyttsdzrkxqmk-dlbbwzdzr", course_type: 1, browser_count: 71
SubCourse.create id: 8, title: "01 种子席德和它的朋友们", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/f1310f6fb2b76d0884de3ae948ef9d94.png", description: "", base_price: 0, slug: "zzxdhtdmym", course_type: 2, browser_count: 462
SubCourse.create id: 9, title: "02 种子藏在哪里", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/f1310f6fb2b76d0884de3ae948ef9d94.png", description: "", base_price: 0, slug: "zzcznl", course_type: 2, browser_count: 244
SubCourse.create id: 10, title: "03 席德要长大", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/f1310f6fb2b76d0884de3ae948ef9d94.png", description: "", base_price: 0, slug: "xdyzd", course_type: 2, browser_count: 279
SubCourse.create id: 11, title: "04 种子们的毕业旅行", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/f1310f6fb2b76d0884de3ae948ef9d94.png", description: "", base_price: 0, slug: "zzmdbylx", course_type: 2, browser_count: 181
SubCourse.create id: 12, title: "如果你没有了感觉", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/f1310f6fb2b76d0884de3ae948ef9d94.png", description: "", base_price: 0, slug: "rgnmylgj", course_type: 2, browser_count: 181
SubCourse.create id: 13, title: "味道情报员", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/293324537c4b796376c290f1c57d80aa.png", description: "", base_price: 0, slug: "wdqby", course_type: 2, browser_count: 279
SubCourse.create id: 14, title: "你的眼睛会说谎", cover_image_id: "http://wechatapppro-1252524126.file.myqcloud.com/apphnifzSnm8631/image/cd791de9fc77064872daacb344c814c4.png", description: "", base_price: 0, slug: "ndyjhsh", course_type: 2, browser_count: 244

CoursesSubCourse.create course_id: 1, sub_course_id: 1
CoursesSubCourse.create course_id: 1, sub_course_id: 2
CoursesSubCourse.create course_id: 1, sub_course_id: 3
CoursesSubCourse.create course_id: 1, sub_course_id: 8
CoursesSubCourse.create course_id: 1, sub_course_id: 9
CoursesSubCourse.create course_id: 1, sub_course_id: 10
CoursesSubCourse.create course_id: 1, sub_course_id: 11

CoursesSubCourse.create course_id: 2, sub_course_id: 12
CoursesSubCourse.create course_id: 2, sub_course_id: 13
CoursesSubCourse.create course_id: 2, sub_course_id: 14

CoursesSubCourse.create course_id: 3, sub_course_id: 4
CoursesSubCourse.create course_id: 3, sub_course_id: 5
CoursesSubCourse.create course_id: 3, sub_course_id: 6