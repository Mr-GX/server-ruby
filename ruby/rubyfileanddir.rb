#Ruby File类与Dir类
#1.File类 操作文件
#1.1变更文件名 File#rename(old,new)
#如果文件不存在或没有适当的文件操作权限，则操作失败并抛出异常
#File.rename("old.txt","new.txt")
#File.rename("new.txt","RubyTest/old.txt")	#将文件移动到已存在的目录下，不存在目录时会报错。无法跨文件系统或驱动器移动文件
#1.2复制文件
def copy(from,to)
	File.open(from) do |input|
		File.open(to, "w") do |file|
			file.write(input.read)
		end
	end
end
#1.3删除文件 File#delete(file) File#unlink(file)

#2.Dir类 操作目录 目录中包括目录和文件 路径:文件位置的目录名 根目录:目录树的起点,只用/表示
#Dir#pwd（获取当前目录） Dir#chdir(dir)（变更当前目录）	当前目录下的文件可以通过指定文件名打开，但变更了当前目录时，则需要指定目录名
p(Dir.pwd)
#Dir.chdir("ruby/2.0.0")	#根据相对路径移动
#Dir.chdir("/etc")		#根据绝对路径移动
Dir.chdir("../..")		#移动到上2层的目录中
#2.1目录内容的获取
dir=Dir.open("RubyTest/ruby")
=begin
while name=dir.read	#遍历最先打开的目录的内容
	p(name)
end
=end
dir.each do |name|
	p(name)
end
dir.close()	#目录打开后要关闭

Dir.open("RubyTest/ruby") do |dir|	#使用块后可以省略调用close方法
	dir.each do |name|
		p(name)
	end
end
#Dir#glob() 可以像shell那样使用*或者?等通配符来取得文件名，将匹配到的文件名（目录名）以数组形式返回
p(Dir.glob("*"))	#获取当前目录中所有文件名
p(Dir.glob(".*"))	#获取当前目录中所有隐藏文件名
p(Dir.glob(["*.html","*.htm"]))	#获取当前目录中所有扩展名为.html或.htm文件名
p(Dir.glob(%w(*.html *htm)))	#模式中若没有空白，用%w()生成字符串数组。获取当前目录中所有扩展名为.html或.htm文件名
p(Dir.glob(["*/*.html","*/*.htm"]))	#获取当前目录子目录中所有扩展名为.html或.htm文件名
p(Dir.glob("foo.[cho]"))	#获取当前目录文件名为foo.c foo.h foo.o的文件
p(Dir.glob("**/*"))	#获取当前目录及其子目录中所有文件名，递归查找目录
p(Dir.glob("foo/**/*.html"))	#获取foo目录及其子目录中扩展名为.html的文件名，递归查找目录
#2.2目录的创建与删除 Dir#mkdir(path) Dir#rmdir(path)（要删除的目录必须为空目录）

#3.文件与目录的属性		文件目录都有所有者、最后更新时间等属性
#File#stat(path)（获取文件、目录得属性。返回的是File::Stat类的实例）
p(File.stat("C:/Users/InSight/Desktop/RubyTest/ruby"))
=begin
#mswin32版ruby不能使用etc模块
require "etc"
st=File.stat("C:/Users/InSight/Desktop/RubyTest/ruby")
p(Etc.getpwuid(st.uid).name,Etc.getgrgid(st.gid).name)	#获取对应的用户id和组id
=end
#File#ctime(path)（文件状态最后更改时间）File#mtime(path)（文件最后修改时间）File#atime(path)（文件最后访问时间）
#以上三个方法等同于实例方法File::Stat#ctime、File::Stat#mtime、File::Stat#atime
#File#utime(atime,mtime,path)（改变文件属性中的最后访问时间atime，最后修改时间mtime）
st=File.stat("C:/Users/InSight/Desktop/test.txt")
p(st.ctime,st.mtime,st.atime)
File.utime(Time.now-100,Time.now-100,"C:/Users/InSight/Desktop/test.txt")
st=File.stat("C:/Users/InSight/Desktop/test.txt")
p(st.ctime,st.mtime,st.atime)
#File#chmod(mode,path)（修改文件path的访问权限，mode为整数值）
#File#chown(owner,group,path)（修改文件path的所有者，owner表示新的所有者的用户id，group表示新的所属组id）

#FileTest模块 include后使用，也可以直接作为模块函数使用。其中的方法也可以作为File类的类方法使用
#exist?(path)、file?(path)、directory?(path)、owned?(path)、grpowned?(path)、readable?(path)、writable?(path)、executable?(path)、size(path)、size?(path)、zero?(path)

#4.文件名的操作
#File#basename(path[,suffix]) 返回路径path中最后一个/以后的部分，如果指定了扩展名suffix，则去除扩展名部分
p(File.basename("a/ruby/filebasename.c"),File.basename("a/ruby/filebasename.c",".c"))
#File#dirname(path) 返回路径path中最后一个/之前的部分，如果路径path不包含/时返回.
p(File.dirname("a/ruby/filebasename.c"))
#File#extname(path[,suffix]) 返回路径path中basename方法结果中的扩展名，没扩展名或者以.开头的文件名时返回空字符串
p(File.extname("a/ruby/filebasename.c"))
#File#split(path) 将path分割为目录名和文件名2部分，以数组形式返回
dir,base=File.split("a/ruby/filebasename.c")
p(dir,base)
#File#join(name1[,name2]) 用File#SEPARATOR连接参数指定的字符串，默认值为/
p(File.join("a/ruby","filebasename.c"))
#File#expand_path(path[,default_dir]) 根据目录名default_dir将相对路径path转换为绝对路径，不指定default_dir时则根据当前目录转换
p(File.expand_path("a/ruby/filebasename.c"),File.expand_path("a/ruby/filebasename.c","/user"))

#5.与操作文件相关的库
#5.1 find库	 被用于对指定的目录下的目录或文件做递归处理
#Find#find(dir){|path|...}	将目录dir下的所有文件路径逐个传给路径path
#Find#prune 跳过当前查找目录下的所有路径
require "find"
IGNORES=[/^\./,/^CVS$/,/^RCS$/]
def listdir(top)
	Find.find(top) do |path|
		if FileTest.directory?(path)
			dir,base=path.split(path)
			IGNORES.each do |reg|
				if reg =~ base
					Find.prune
				end
			end
			p(path)
		end
	end
end
#5.2 tempfile库	被用于管理临时文件
#处理大量数据时，程序会把一部分正在处理的数据写入临时文件，这些文件一般在执行完成后不再需要，需要删除，需要记住每个临时文件的名称（名称不能相同）
#Tempfile#new(basename[,tempdir]) 创建临时文件，格式为basename+进程id+流水号
#Tempfile#close(real) 关闭临时文件，real为true马上删除临时文件。默认值为false
#Tempfile#open() 再次打开close方法关闭的临时文件
#Tempfile#path() 返回临时文件的路径

#5.3 fileutils库
#FileUtils#cy(from,to)	文件拷贝
#FileUtils#cy_r(from,to)	from为目录时，递归拷贝
#FileUtils#mv(from,to)	文件移动并且可以跨文件系统和驱动器
#FileUtils#rm(path)		
#FileUtils#rm_f(path)	删除path，path只能是文件，可将path作为数组删除多个文件，rm_f发生异常时继续执行
#FileUtils#rm_r(path)	
#FileUtils#rm_rf(path)	删除path，path为目录时递归删除，可将path作为数组删除多个文件或目录，rm_rf发生异常时继续执行
#FileUtils#compare(from,to)	比较from和to的内容，相同true不同false
#FileUtils#install(from,to[,option])把文件从from拷贝到to，如果to存在且与from内容一致则不拷贝，option参数用于指定目标文件的访问权限
#FileUtils#mkdir_p(path)	一次性自动创建各层的目录，可将path作为数组一次性创建多个目录

#练习题
#1
require "rbconfig"

def print_libraries
  $:.each do |path|
    next unless FileTest.directory?(path)
    dlext = RbConfig::CONFIG["DLEXT"]
    Dir.open(path) do |dir|
      dir.each do |name|
        if name =~ /\.rb$/i || name =~ /\.#{dlext}$/i
          puts name
        end
      end
    end
  end
end

print_libraries

#2
require "find"

def du(path)
  result = 0
  Find.find(path){|f|
    if File.file?(f)
      result += File.size(f)
    end
  }
  printf("%d %s\n", result, path)
  return result
end

du(ARGV[0] || ".")