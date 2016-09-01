#ruby File读取

=begin
file=File.open(ARGV[0])#打开文件
text=file.read         #读取文件数据
print(text)            #打印文件数据
file.close             #关闭文件
=end

#print(File.read(ARGV[0]))#只是读取文件数据时

=begin
#逐行打印文件数据
file=File.open(ARGV[0])
file.each_line do |line_data|
	print(line_data)
end
file.close
=end

#正则表达式匹配逐行，打印文件数据
pattern=Regexp.new(ARGV[0])
file=File.open(ARGV[1])
file.each_line do |line_data|
	if  pattern =~ line_data.force_encoding("UTF-8")#编码转化
		print(line_data)
	end
end
file.close