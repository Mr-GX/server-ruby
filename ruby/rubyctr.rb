#ruby 条件判断 false、nil为假，其余为真

#puts("控制语句test=#{2<2}")

=begin
if语句（判断语句是false或nil为假，其余为真）
a=40
if a>10&&a<30 then
	puts("if判断结果为true")
else
	puts("if判断结果为false")
end
=end

=begin
while循环语句
i=1
while i<=10
	puts("while循环输出=#{i}")
	i=i+1
end
=end

count=5
count.times do
puts("循环次数确定的迭代器语句test")
end