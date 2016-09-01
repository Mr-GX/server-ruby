#散列（map集合）类似数组
test={:name=>"gx",:sex=>"male"}
#test={name:"gx",sex:"male"}

#赋值，输出
=begin
test[:name]="gxl"
puts(test[:name])
=end

#遍历
test.each do |key,value|
	print("key=#{key}",",value=#{value}","\n")
end
