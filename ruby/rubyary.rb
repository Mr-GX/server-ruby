#array相关，自增长

=begin
array声明，赋值，数量
names=[1,2,3,4]
names[0]=0
names[4]=5
puts("array的大小=#{names.size}",names)
=end

names=[0,2,3,4]
names.each do |i|
	puts("array遍历i=#{i}")
end