#Ruby 正则表达式类Regexp 
#1.正则表达式的写法与用法 使用//将正则表达式括起来 
#创建方法 使用Regexp#new(str) %r特殊语法（模式中包含/时比较方便。%r(模式)、%r<模式>、%r|模式|、%r!模式!）

#2.正则表达式的模式与匹配 /正则表达式模式/(加i不区分大小写) =~ 希望匹配的字符串 匹配成功返回首次成功匹配的位置，否则返回nil
#匹配普通字符
p(/test/ =~ "ruby test test")
p(/test/i =~ "ruby Test")
p(/测试/ =~ "ruby 测试")
#匹配行首和行尾	 使用模式/^正则表达式模式$/ 	
#^（匹配行首）$（匹配行尾）特殊意义的字符并不用于匹配^$字符被称为元字符 元字符前加\会转义，不再具有元字符功能，本身会用于匹配
#匹配任意字符的.元字符,1个.代表一位
p(/^ABC$/ =~ "ABC",/^ABC/ =~ "1ABC",/ABC$/ =~ "ABC1",/A..C/ =~ "A0xC")
#指定匹配字符的范围	 1个或多个[]	匹配多个字符中的1个  
#[]内部使用A-Z/a-z/0-9/A-Za-z/A-Za-z_... 加-表示一定范围的字符串
#[]内部开头使用^表示指定字符以外的字符串
p(/[ABC]/ =~ "VBE",/[a-z]/ =~ "047bc5",/[^a-z]/ =~ "047bc5")
#使用反斜杠\和1个英文字母的模式
# \s表示空白符，匹配空格（0x20）、制表符（Tab）、换行符、换页符
# \d匹配0-9的数字
# \w匹配英文字母与数字
# \A匹配字符串开头
# \z匹配字符串末尾
p(/a\se/ =~ "a e",/\d\d/ =~ "10",/\w\w/ =~ "w0",/\Aabc/ =~ "abcde",/cde\z/ =~ "abcde")
#重复 重复匹配多次相同的字符 *重复0次以上  +重复1次以上  ?重复0次或1次  *?0次以上的重复中最短的部分  +?1次以上的重复中最短的部分
p(/A.*C/ =~ "ABBBC",/A+C/ =~ "C",/AAA?C/ =~ "AC",/A*?C/ =~ "ACAAAAC",/A+?C/ =~ "ACAAAAC")
#()与重复  重复匹配多个字符
p(/^(ABC)*$/ =~ "ABCABC",/^(ABC).*$/ =~ "ABCDDABC")
#选择 |在几个候选匹配模式中匹配任意一个
p(/^(ABC|DEF)/ =~ "ABCE",/^(ABC|DEF)/ =~ "DEF00")

#3.使用quote方法（转义正则表达式的所有元字符）的正则表达式  返回转义了元字符的正则表达式字符串，再结合new方法生成新的正则表达式
reg1=Regexp.new("abc*def")
reg2=Regexp.new(Regexp.quote("abc*def"))
p(reg1,reg2,reg1 =~ "abc*def",reg2 =~ "abc*def")

#4.正则表达式的选项 可以改变正则表达式的一些默认效果	/../模式后面加i（忽略英文字母大小写）、x（忽略空白字符及#后的字符）、m（可以使用.匹配换行符）
#正则表达式的选项常量 Regexp::IGNORECASE（不区分大小写）、Regexp::EXTENDED（忽略空白符）、Regexp::MULTILINE（匹配多行）
p(/DEF.GHI/m =~ "ABC\nDEF\nGHI",/abc/i =~ "ABC\nDEF\nGHI",/abc #测试/ix =~ "ABC\nDEF\nGHI")
p(Regexp.new("ruby test",Regexp::IGNORECASE|Regexp::MULTILINE) =~ "RUBY TESTruby test")

#5.捕获 从正则表达式的匹配部分中提取其中的某部分 通过"$数字"就可以获取匹配了正则表达式中用()括住部分的表达式
/(.)(.)(.)/ =~ "abc"
p($1,$2,$3)
/(.)(?:\d\d)+(.)/ =~ "123456"	#?:过滤不需要捕获的模式
p($1,$2)
#$`（匹配部分前的字符串） $&（匹配部分的字符串） $'（匹配部分后的字符串）
/C./ =~ "ABCDEF"
p($`,$&,$')

#6.使用正则表达式的方法
#String类的sub和gsub方法 代码rubystr.rb第59行
#scan方法 可以匹配但不能像sub和gsub一样置换操作 其中使用()时匹配部分会以数组形式返回（如果不指定块，则直接返回匹配的字符串数组，如果指定与()相等数量的块参数，则返回各个元素）
"abracatabra".scan(/.a/) do |matched|
	p(matched)
end
"abracatabra".scan(/(.)(a)/) do |matched|
	p(matched)
end
"abracatabra".scan(/(.)(a)/) do |a,b|
	p(a+b)
end
p("abracatabra".scan(/.a/))

#7.正则表达式的例子
%r|http://([^/]*)/| =~ "http://www.after615.com/"
p($1)
p(/\d+-?\d*/ =~ "010-1234") #匹配邮政编码