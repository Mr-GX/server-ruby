#ruby 循环each方法、while语句、times方法、for语句、until语句、loop方法

=begin
#times方法 重复做确定的次数
5.times do #do~end(跨行 多个处理的集合)部分可以写成{~}(一行 单个处理)
	puts("循环次数确定的迭代器语句test")
end

5.times do |i|#循环从0开始
	puts("第#{i}次循环")
end
=end

=begin
#for语句(ruby内部用each方法实现的)
names=["gx","guox","guoxin"]#数组对象
for name in names do
	puts(name)
end

sum=0
for i in 1..5#范围对象：开始的数值..结束的数值
	sum += i
end
puts(sum)
=end

=begin
#while语句(一直执行直到条件不成立end)
i=1
sum=0
while i<=5
	sum += i
	i += 1
end
puts(sum)
=end

=begin
#until语句(一直执行直到条件成立end)
i=1
sum=0
until i>5
	sum += i
	i += 1
end
puts(sum)
=end

=begin
#each方法
names=["gx","guox","guoxin"]
names.each do |name|
	puts(name)
end
=end

=begin
#loop方法（没有终止循环条件，需要用命令break、next、redo等控制循环）
i=0
loop do
	puts("loop循环次数=#{i}")
end
=end

#循环控制命令break、next、redo
names=["gx","guox","guoxin"]
i=0
names.each do |name|
	i += 1
	if i==2
		#break #条件成立时中断循环 输出[1,gx]
		#next  #条件成立时跳过当前循环 输出[1,gx] [3,guoxin]
		#redo  #条件成立时返回循环开头重新执行 输出[1,gx] [3,guox] [4,guoxin]
	end
	puts("[#{i},#{name}]")
end