#ruby 正则表达式 /模式/(加i不区分大小写) =~ 希望匹配的字符串
#匹配成功返回成功匹配的位置，否则返回nil
puts("#{/test/ =~ "ruby test"}")
puts("#{/test/i =~ "ruby Test"}")
puts("#{/测试/ =~ "ruby 测试"}")

