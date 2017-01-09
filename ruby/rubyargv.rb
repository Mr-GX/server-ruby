#ruby预定义的ARGV数组
#ruby rubyargv.rb "test" "test1"(输入窗口将变量传递给ARGV数组，如果多个脚本参数用空格间隔)
#puts("第一个传递的参数：#{ARGV[0]}","第二个传递的参数：#{ARGV[1]}")
var1=ARGV[0].to_i#to_i把字符串转换为整形
var2=ARGV[1].to_i
puts("加法运算：#{var1} + #{var2}=#{var1+var2}","减法运算：#{var1} - #{var2}=#{var1-var2}","乘法运算：#{var1} * #{var2}=#{var1*var2}","除法运算：#{var1} / #{var2}=#{var1/var2}",)