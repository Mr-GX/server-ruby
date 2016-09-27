#Ruby IO类 让程序与外部进行数据的输入input/输出output操作
#1.输入/输出的种类
#标准的输入（$stdin）/输出（$stdout.print）/错误输出（$stderr.print）
$stdout.print "Output to $stdout\n"
$stderr.print "Output to $stderr\n"
#ruby rubyio.rb > io.txt     在命令后加>文件名 将程序执行时标准输出的结果保存到该文件中，而标准错误输出内容显示到控制台中
#ruby rubyio.rb < io.txt     通过文件输入内容
#$stdin#tty? 判断IO对象是否与控制台关联 
if $stdin.tty?
	print "stdin is a tty\n"
else
	print "stdin is not a tty\n"
end
#文件输入/输出 IO类的File子类处理，File类中还封装了文件删除、属性变更等文件专用功能
#通过File#open(file,mode)或open(file,mode)打开文件并获取新的IO对象 mode模式会指定以何种目的打开文件，缺省模式为只读"r",模式后加b表示二进制模式，如"rb","rb+"
#"r+"读写	"w"只写（文件不存在则创建，存在则清空将文件大小设为0） "w+"读写（其余同"w"） "a"追加（文件不存在创建）"a+"读取/追加（其余同"a"）
#File#close()关闭已打开的文件（File#open使用块时会自动关闭） File#closed?检测IO对象是否被关闭 File#read(file)一次性读取文件file的内容
File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	while line=io.gets
		p(line)
	end
end

io=File.open("C:/Users/InSight/Desktop/test.txt")
io.close()
p(io.closed?)

p(File.read("C:/Users/InSight/Desktop/test.txt"))

#2.基本的输入输出操作
#输入操作 IO#gets(rs)、IO#each(rs)、IO#each_line(rs)、IO#readlines(rs)  用参数rs的字符串分行 缺省时是\n  返回结果中包含行末尾的换行符，可以使用chomp!剔除
File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	while line=io.gets
		line.chomp!
		p(line)
	end
p(io.eof?)	#IO#eof?判断输入是否完成
end

File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	io.each_line do |line|
		line.chomp!
		p(line)
	end
end

File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	ary=io.readlines	#返回将每行数据作为元素封装的数组
	ary.each do |line|
		line.chomp!
		p(line)
	end
end

#使用gets和each_line方法逐行读取数据时，会自动记录读取的行数lineno  IO#lineno IO#lineno=(number)
=begin
ruby rubyio.rb < C:/Users/InSight/Desktop/test.txt
$stdin.each_line do |line|
	printf("%3d %s",$stdin.lineno,line)
end
=end

#IO#each_char（逐个字符读取io中数据并执行块，并将得到的字符串作为块变量传递）
File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	io.each_char do |char|
		p(char)
	end
end

#IO#each_byte（逐个字节读取io中数据并执行块，并将得到的字节对应ASCII码以整数值形式作为块变量传递）
File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	io.each_byte do |byte|
		p(byte)
	end
end

#IO#getc（只读取io中一个字符，并返回其字符串对象。数据读完后再读取返回nil）
File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	while ch=io.getc
		p(ch)
	end
end

#IO#ungetc(ch)（将参数ch指定的字符大小的字符串对象回退到io的输入缓存中）
File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	p(io.getc)
	io.ungetc(100)
	p(io.gets)
end

#IO#getbyte（只读取io中一个字节，并将得到的字节对应ASCII码以整数值形式作为块变量传递。数据读完后再读取返回nil）
#IO#ungetbyte(byte)（将参数byte指定的一个字节退回到输入缓冲中，参数为整数时，将该整数除以256后的余数作为ASCII码字符返回一个字节，参数为字符串时只返回字符串第一个字节）
#IO#read(size)（读取参数size指定大小的数据，缺省时一次性读取所有数据并返回）
File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	p(io.read(5))
	p(io.read)
end

#输出操作 IO#puts(str0,str1,...)
