#Ruby File类与Dir类
#1.File类 操作文件
#1.1变更文件名 File#rename(old,new)
#如果文件不存在或没有适当的文件操作权限，则操作失败并抛出异常
File.rename("old.txt","new.txt")
File.rename("old.txt","backup/new.txt")	#将文件移动到已存在的目录下，不存在目录时会报错。无法跨文件系统或驱动器移动文件
#1.2复制文件
def copy(from,to)
	File.open(from) do |input|
		File.open(to, "w") do |file|
			file.write(input.read)
		end
	end
end
#也可以引用FileUtils库，使用FileUtils#cy（文件拷贝）FileUtils#mv（文件移动并且可以跨文件系统和驱动器）等操作文件的方法
#1.3删除文件 File#delete(file) File#unlink(file)
File.delete("foo")
#2.Dir类 操作目录 目录中包括目录和文件 路径:文件位置的目录名 根目录:目录树的起点,只用/表示
#Dir#pwd（获取当前目录） Dir#chdir(dir)（变更当前目录）	当前目录下的文件可以通过指定文件名打开，但变更了当前目录时，则需要指定目录名
p(Dir.pwd)
Dir.chdir("ruby/2.0.0")	#根据相对路径移动
Dir.chdir("/etc")		#根据绝对路径移动
Dir.chdir("../..")		#移动到上2层的目录中
#2.1目录内容的获取