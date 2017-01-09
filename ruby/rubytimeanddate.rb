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
# Date#today	获取当前日期的Date对象
require "date"
puts(Date.today)
# d#year/month/day/wday（一周中的第几天，0周日）/mday（一月中的第几天）/yday（一年中的第几天，1是1月1日）
d=Date.today
p(d.year,d.month,d.day,d.wday,d.mday,d.yday)
# Date#new(year,month,day) 指定日期获取Date对象.day为-1时表示月末那天，-2为月末前一天...
d=Date.new(2016,10,10)
puts(d)

#8.日期的运算
#日期间减法运算结果是Rational(有理数) 运算符>>可以获取后一个月相同日期的Date对象
d1=Date.new(1990,11,3)
d2=Date.new(2016,10,12)
puts(d2-d1)
d3=Date.today
puts(d3+1,d3-1,d3>>2)

#9.日期的格式
# d#strftime(format)	将日期按指定的格式转换为字符串，时间部分换转换为0
puts(d3.strftime("%Y-%m-%d %H:%M:%S %z"),d3.to_s)

#10.从字符串中获取日期
# Date#parse(str)
puts(Date.parse("2016/10/11"))


#练习题
#1
def cparsedate(str)
  now = Time.now
  year = now.year
  month = now.month
  day = now.day
  hour = now.hour
  min = now.min
  sec = now.sec 
  str.scan(/(上午|下午)?(\d+)(年|月|日|点|分|秒)/) do
    case $3
    when "年"
      year = $2.to_i
    when "月"
      month = $2.to_i
    when "日"
      day = $2.to_i
    when "点"
      hour = $2.to_i
      hour += 12 if $1 == "下午"
    when "分"
      min = $2.to_i
    when "秒"
      sec = $2.to_i
    end
  end
  return Time.mktime(year, month, day, hour, min, sec)
end
p(cparsedate("2016年10月12日上午11点4分59秒"))

#2.
require "date"

module Calendar
  WEEK_TABLE = [
    [99, 99, 99, 99, 99, 99,  1,  2,  3,  4,  5,  6,  7],
    [ 2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14],
    [ 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
    [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28],
    [23, 24, 25, 26, 27, 28, 29, 30, 31, 99, 99, 99, 99],
    [30, 31, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99],
  ]

  module_function

  def cal(year, month)
    first = Date.new(year, month, 1)       # 被指定的月的1号
    end_of_month = ((first >> 1) - 1).day  # 次月的1号的前1天
    start = 6 - first.wday                 # 表示在表格的哪个位置

    puts first.strftime("%B %Y").center(21)
    puts " Su Mo Tu We Th Fr St"
    WEEK_TABLE.each do |week|
      buf = ""
      week[start, 7].each do |day|
        if day > end_of_month
          buf << "   "
        else
          buf << sprintf("%3d", day)
        end
      end
      puts buf
    end
  end
end

t = Date.today
Calendar.cal(t.year, t.month)