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

#输出操作 IO#puts(str0,str1,...)（换行输出String类对象，不是的话调用to_s转换）IO#putc(char)（输出参数char指定的字符编码对应的字符，参数为字符串输出首字母）
#IO#print(str0,str1,...)（输出参数指定的字符串，参数为String以外对象将自动转换为字符串输出）IO#printf(fmt,str0,str1,...)（按照fmt指定的格式输出）
$stdout.puts(1,2,3)
$stdout.putc(82)
$stdout.putc("Ruby")
$stdout.putc("\n")
$stdout.print("Ruby\n")
$stdout.printf("%d%s",1,"Ruby")
#IO#write(str)（输出参数str指定的字符串，参数为String以外对象将自动转换为字符串输出，返回值为输出的字节数）
size=$stdout.write("\nRuby\n")
p(size)
#IO << str 输出参数str指定的字符串，<<会返回接收者本身
$stdout<<"foo\n"

#3.文件指针 将文件分成固定长度的文件块，来直接访问某个位置的数据，但不能超过指定长度的数据
#使用文件指针或当前文件偏移量来表示IO对象指向的文件位置，读写文件时，指针会自动移动。也可以使指针指向任意位置来读写数据
#IO#pos（获取文件指针现在的位置）IO#pos=(position)（改变文件指针的位置）
File.open("C:/Users/InSight/Desktop/test.txt") do |io|
	p(io.read(5))
	p(io.pos)
	io.pos=0
	p(io.gets)
end
#IO#seek(offset,whence)	移动文件指针，参数offset为用于指定位置的整数，参数whence用于指定offset如何移动
#whence中指定的值 IO::SEEK_SET（将指针移动到offset指定的位置）IO::SEEK_CUR（将offset视为相对于当前位置的偏移位置来移动指针）IO::SEEK_END（将offset指定为相对于文件末尾的偏移位置）
#IO#rewind（将指针返回到文件的开头）IO#truncate(size)（按照参数size指定的大小截断文件）
File.open("C:/Users/InSight/Desktop/test.txt","r+") do |io|
	p(io.gets)
	io.rewind
	p(io.gets)
	io.truncate(io.pos)	#删除当前文件指针以后的数据
end

#4.二进制模式与文本模式 兼容不同OS换行符问题 前提是以行为单位输入输出，需要转换时称为文本模式，不需要转换时称为二进制模式
#IO#binmode 新的IO对象默认是文本模式.转换为二进制模式的IO对象无法再次转换为文本模式
File.open("C:/Users/InSight/Desktop/test2.txt","w") do |io|
	io.binmode
	io.write("Hello World\n")
end

#5.缓冲	在使用write或print等方法操作IO对象时，程序内部开辟出一定的空间用于保存临时生成的数据副本，这部分空间就是缓冲buffer。缓冲里积累一定量的数据后就会做实际的输出处理，然后清空缓冲
#使用临时缓冲进行数据处理称为缓冲处理buffering
#标准错误输出结果会立即反映出来，建议在显示程序中正常信息以外的信息时使用标准错误输出
#同步数据的操作和输出 IO#flush（强制输出缓冲中的数据） IO#sync IO#sync=(state)（通过io.sync=true,程序写入缓冲时flush方法会自动调用）
$stdout.print "out1 "
$stdout.print "out2\n";$stdout.flush

$stdout.sync=true
$stdout.print "out1 "
$stdout.print "out2\n"

#6.与命令进行交互 IO#popen(command,mode) open("lcommand",mode) 参数mode参考File#open代码第15行
#改造文件rubyfile.rb第22行代码

#7.open-uri库
#IO对象可以是：控制台、文件、管道（pipe进程间通信时使用）、套接字（socket网络间通信时使用）
require "open-uri"
#指定HTTP头部信息
options={
	"Accept-Language"=>"zh-cn,en;q=0.5"
}
#通过HTTP读取数据
open("http://www.after615.com",options) do |io|
	puts io.read
end
=begin
#通过FTP读取数据
open("ftp://www.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz") do |io|
	open("C:/Users/InSight/Desktop/ruby-2.0.0-p0.tar.gz","w") do |file|	#打开本地文件
		file.write(io.read)
	end
end
=end

#8.stringio库 StringIO是模拟IO对象的对象,一般用于测试程序输出。StringIO对象接收模拟输出结果并保存到该对象中，然后使用read方法读取该输出
require "stringio"
io=StringIO.new
io.puts("A","B","C")
io.rewind
p(io.read)
#将字符串对象作为IO数据处理
io1=StringIO.new("A\nB\nC\n")
p(io1.gets,io1.gets,io1.gets)
