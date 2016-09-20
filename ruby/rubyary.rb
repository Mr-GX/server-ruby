#Ruby 数组类Array 


#1.Array创建，赋值(自增长)，数量
names=[1,2,3,4]
names[0]=0
names[4]=5
puts("array.size=#{names.size}")
p(names)

#使用Array#new方法创建数组
p(Array.new)	#创建元素个数为0的数组
p(Array.new(5))	#创建元素个数为5的数组，初始值为nil
p(Array.new(5,1))	#创建元素个数为5的数组，初始值为1

#使用%w（创建不包含空白的字符串数组）、%i（创建符号数组）
str=%w(Ruby Perl Python Java)
sym=%i(Ruby Perl Python Java)
p(str,sym)

#to_a方法 将其他对象转换为数组
hash={name:"gx",sex:"male"}
p(hash.to_a)

#split方法 对用逗号或空白间隔的字符串转换为数组
str1="2016.9.20 foo.html proxy.example.rb  hash".split()
p(str1)

#2.index的使用方法
#获取元素
ary=[1,2,3,4,5]
p(ary[1],ary[-1],ary[4]) #index为正时从头部获取元素，超出index返回nil，index为负时从尾部获取元素，尾部第一个元素index为-1
p(ary[1..3],ary[1..4])	#ary[n..m]指定index范围  m超出数组长度时与指定数组最后一位index的返回一致
p(ary[1,2])	#ary[n,len] 获取从n这个index开始len个元素
p(ary.at(1),ary.slice(1))	#等价于ary[1]
p(ary.slice(1..3))			#等价于ary[n..m]
p(ary.slice(1,2))			#等价于ary[n,len]

#元素赋值
ary[0]=6	#单个赋值
p(ary)
ary[1..2]=[7,8]		#多个赋值
p(ary)
ary[3,2]=[9,10]
p(ary)

#元素插入 指定ary[index,0]就可以在index前插入新元素
ary[0,0]=[1,2,3,4,5]
p(ary)

#通过多个index获取分散的元素并创建数组 Array#values_at(index1,index2)
p(ary.values_at(1,3,5,7,9))

#3.作为集合的数组

#4.作为列的数组
names=[0,2,3,4]
names.each do |i|
	puts("array遍历i=#{i}")
end