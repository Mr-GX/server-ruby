#Ruby Time类与Date类

#1.Time类与Date类
=begin
	Time：用于表示时间，年月日时分秒时区，以秒为单位
	Date：只用于表示年月日，以天为单位
=end

#2.时间的获取
# Time#new Time#now	获取当前时间的Time对象
p(Time.new,Time.now)
# Time#mktime(year[,month[,day[,hour[,min[,sec[,usec]]]]]]) 指定时间获取Time对象
p(Time.mktime(1990,11,3,10,10,10))
# t#year/month/day/hour/min/sec/usec（秒以下的位数，以毫秒为单位）/to_i（从1970-1-1到当前时间的秒数）/wday（一周中的第几天，0周日）/mday（一月中的第几天）/yday（一年中的第几天，1是1月1日）/zone
t=Time.now
p(t.usec,t.to_i,t.wday,t.mday,t.yday,t.zone)

#3.时间的计算	Time对象间可以互相比较、运算。以及Time对象秒数的操作
t1=Time.now
sleep(1)
t2=Time.now
p(t1<t2,t2-t1)
p(t2+60*60*24)

#4.时间的格式
# t#strftime(format)/to_s/rfc2822（生成符合电子邮件头部信息中的Date：字段格式的字符串，需要引用time库）/iso8601（生成符合ISO 8601国际标准的时间格式的字符串，需要引用time库）
require "time"
t=Time.now
p(t.to_s,t.strftime("%Y-%m-%d %H:%M:%S %z"),t.rfc2822,t.iso8601)

#5.本地时间
# t#utc（将Time对象时区改为国际协调时间）/localtime（将Time对象时区国际协调时间改为本地时间）
t=Time.now
t.utc
p(t)
t.localtime
p(t)

#6.从字符串中获取时间
# Time#parse(str)	需要引用time库，操作以字符串形式表示的时间，返回对应的Time对象
require "time"
p(Time.parse("2016/10/11"))

#7.日期的获取 使用Date类需引用date库
