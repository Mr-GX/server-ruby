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
#index索引操作实际上就是数组对集合封装的一个功能而已
#集合的基本运算分为交集（取出同时属于2个集合的元素，并创建新的集合）和并集 （取出2个集合所有的元素，并创建新的集合）
#补集 获取某个集合中不属于另外一个集合的元素 Array类中把某个集合中属于另一个集合的元素删除的差运算
ary1=["a","b","c"]
ary2=["b","c","d"]
p(ary1&ary2,ary1|ary2,ary1-ary2)

# +与|的不同 都是用来连接数组，只是元素有相同时处理不同.|会排除相同元素，+不排除
p(ary1|ary2,ary1+ary2)

#4.作为列的数组
=begin
数据结构的队列queue和栈stack都是典型的列结构，其都包含追加元素和获取元素这2种操作数据的方式
队列是一种按元素被追加时的顺序来获取元素的数据结构，就是FIFO先进先出等待队列
栈是一种按照元素被追加时的顺序相反的顺序来获取元素的数据结构，就是LIFO先进后出
追加元素 从数组头部元素操作unshift，从尾部操作push
删除元素 从数组头部元素操作shift，从尾部操作pop
引用元素 从数组头部元素操作first，从尾部操作last
使用push和shift方法实现队列，使用push和pop方法实现栈
=end
ary1.push("d")
p(ary1)
ary1.shift()
p(ary1)
p(ary1.first)

ary2.push("e")
p(ary2)
ary2.pop()
p(ary2)
p(ary2.last)

#5.主要的数组方法
#追加元素
ary3=[1,2,3,4,5]
ary3.unshift(0)	#从头部操作 追加0
p(ary3)

ary3.push(6)	#从尾部操作 追加6
#ary3<<6	同上
p(ary3)

ary3.concat([7,8])	#连接2个数组 concat是具有破坏性的方法（会改变接收者对象值的方法，用!区分破坏性方法） +会根据原来的数组元素创建新的数组
#ary=ary3+[7,8] 基本同上
p(ary)

ary3[0]=1
p(ary3)
ary3[0..2]=1 #将数组指定的部分的元素替换为1
p(ary3)
ary3[0,2]=1 #同上
p(ary3)

#删除元素
ary4=[1,2,3,nil,4,4,5,6]
ary4.compact!()	#破坏性方法删除nil元素并替换原来的数组返回，如果什么也没删除的话返回nil
#ary=ary4.compact()	#删除nil元素返回新的数组
p(ary4)

ary4.delete(4)	#删除数组种值为2的元素
p(ary4)

ary4.delete_at(2)	#删除index=2的元素
p(ary4)

ary4.delete_if{|i| i<=1}	#判断块中真假，如果为真删除i元素
#ary4.reject!{|i| i<=3}
p(ary4)

ary4.slice!(0)	#删除数组中的指定部分，并返回删除部分的值
#ary4.slice!(0..1)
#ary4.slice!(0,1)
p(ary4)

ary5=[1,2,3,4,3,2,1]	#删除数组中的重复元素
ary5.uniq!()
p(ary5)

ary5.shift()	#删除头部第一个元素
ary5.pop()		#删除尾部第一个元素
p(ary5)

#替换数组元素
ary6=[1,2,3,4,5]
ary6.collect!{|i| i*2}	#将元素传给块，块处理后生成新的数组
#ary6.map!{|i| i*2}	同上
p(ary6)

p([1,2,3,4,5].fill(0),[1,2,3,4,5].fill(0,2),[1,2,3,4,5].fill(0,2,2),[1,2,3,4,5].fill(0,2..3)) #ary.fill(value,begin,len)

ary7=[1,[2,3],4]
ary7.flatten!()	#平坦化数组。展开嵌套数组成为一个哒数组
p(ary7)

ary6.reverse!()	#反转数组的元素顺序
p(ary6)

ary8=[1,3,2,9,8]
ary8.sort!()	#数组排序，没有块时使用<=>运算符比较
#ary8.sort!{|i,j| i>j}
p(ary8)

p(ary8.sort_by{|i| -i})	#数组排序。根据块中运算结果对数组元素排序

#7.数组与迭代器
(1..5).each do |i|
	print("#{i}  ")
end

#8.处理数组中的元素