#Ruby 散列类Hash
#1.散列的创建	
# 使用字面量直接创建
test1={"name"=>"gx","sex"=>"male"}
test2={:name=>"gx",:sex=>"male"}
test3={name:"gx",sex:"male"}
p(test1,test2,test3,test1["name"],test2[:name],test3[:name])
# Hash#new 若指定参数则该参数为散列的默认值，也就是指定不存在的键时返回的值。若不指定参数散列的默认值是nil
p(Hash.new["no_param"],Hash.new("default_value")["no_param"])

#2.值的获取与设定
hash=Hash.new
hash["name"]="gx"
hash.store("key","value")	# Hash#store设定键值
puts(hash["name"],hash["key"],hash.fetch("key"))	#hash.fetch("no_this_key") 获取不存在的键时会发生异常，可以为其加上默认值hash.fetch("no_this_key","default_value")
p(hash.fetch("test"){String.new})	#fetch方法可以使用块，此时块的执行结果为散列的默认值
#一次性获取所有的键、值 Hash#keys Hash.values Hash#to_a	也可以使用Hash#each_key或each_value方法逐个获取并处理键、值
p(hash.keys,hash.values,hash.to_a)
#散列的默认值（即指定散列中不存在的键时的返回值）
puts(Hash.new(1))
#创建时指定默认值 代码第8行
#通过块指定默认值
h=Hash.new do |hash,key|	#|将要创建的散列，散列当前的键|
	hash[key]=key.upcase
end
h["a"]="a"
p(h["a"],h["b"])
#使用Hash#fetch方法指定默认值 代码15、16行

#3.查看指定对象是否为散列的键或值 Hash#key?(key) Hash#has_key?(key) Hash#include?(key) Hash#member?(key) Hash#value?(value) Hash#has_value?(value)
puts(test1.key?("name"),test1.has_key?("name"),test1.include?("name"),test1.member?("name"))
puts(test1.value?("gx"),test1.has_value?("gx"))

#4.查看散列的大小（即散列中键的数量） Hash#size Hash#length Hash#empty?
puts(test1.size,test1.length,test1.empty?)

#5.删除键值 Hash#delete(key) Hash#delete_if{|key,value| ...} Hash#reject!{|key,value| ...}
p(test1.delete("name")["name"])
p(test1.delete("no_exist_key"){|key| "#{key}"})	#delete方法使用块，如果不存在键，则返回块的执行结果
p(test1.delete_if{|key,value| key=="test_key"})	#不符合删除条件时返回原来的散列
p(test1.reject!{|key,value| key=="test_key"})	#不符合删除条件时返回nil

#6.初始化散列 Hash#clear 类似Hash#new 区别是clear清空了变量引用的对象，new是创建了新的散列赋给变量
p(test2.clear)
#处理有2个键的散列 散列的值也可是散列，就是散列的散列
test4={"name"=>{"name1"=>"gx","name2"=>"liby"},"sex"=>{"male"=>"gx","sex2"=>"female"}}
p(test4["name"]["name1"])

#7.计算单词数量（查看rubystr.rb文件第100行）

#8.遍历散列
test3.each do |key,value|
	print("key=#{key}",",value=#{value}","\n")
end
