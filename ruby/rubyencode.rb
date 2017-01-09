#Ruby Encoding类
#1.Ruby的编码与字符串
=begin
	脚本编码：决定字面量字符串对象编码的信息，与脚本的字符串编码一致
	内部/外部编码：内部编码是指从外部获取数据在程序中如何处理的信息，外部编码是指程序向外部输出时与编码相关的信息。
=end

#2.脚本编码与魔法注释
=begin
	脚本编码：脚本本身的编码。脚本中的字符串、正则表达式的字面量会依据脚本编码进行解释
	魔法注释：指定脚本编码的注释。必须写在脚本的首行（第一行以#！~开头时则写在第二行）
	# encoding: utf-8
	# -*- coding:utf-8 -*-	#编辑器为Emacs时
	# vim:set fileencoding=utf-8:  #编辑器为VIM时
	Ruby1.9默认脚本编码为US-ASCII Ruby2.0默认脚本编码为UTF-8
	使用特殊字符\u创建的字符串，即使脚本编码不是UTF-8，生成的字符串也是UTF-8。必须使用encode!(编码)明确进行编码转换
=end

#3.Encoding类
# String#encoding查询字符串的编码
p("郭新".encoding)
# String#encode转换字符串的编码
p("郭新".encode("GBK").encoding)
#操作字符串时Ruby会自动检查编码，连接不同编码的字符串会报错。需要提前转换

#Encoding类的方法
# Encoding#compatible?(str1,str2) 检查2个字符串的兼容性(是否可连接)，兼容时返回字符串连接后的编码，否则返回nil
p(Encoding.compatible?("AB","郭新".encode("UTF-8")))
p(Encoding.compatible?("郭新","郭新".encode("GBK")))
# Encoding#default_external	返回默认的外部编码，这个值会影响IO类的外部编码
# Encoding#default_internal 返回默认的内部编码，这个值会影响IO类的内部编码
# Encoding#find(name) 返回编码名name(不区分大小写)对应的Encoding对象	预定义的编码名由不包含空格的英文字母、数字与符号构成。
p(Encoding.find("locale"),Encoding.find("external"),Encoding.find("internal"),Encoding.find("filesystem"))	#特殊的编码名
# Encoding#list（返回Encoding对象一览表）  Encoding#name_list（返回表示编码名的字符串一览表） Ruby支持的编码一览表,数组形式返回
p(Encoding.list,Encoding.name_list)
# enc#name enc#names 返回Encoding对象enc的编码名
p(Encoding.find("UTF-8").name,Encoding.find("UTF-8").names)

#4.正则表达式与编码
#Regexp.new("模式".encode("编码名"))	指定正则表达式模式的编码

#5.IO类与编码
#5.1外部/内部编码
=begin
	每个IO对象都有内部编码和外部编码2种编码信息
	外部编码：作为输入/输出对象的文件、控制台等的编码
	内部编码：Ruby脚本中的编码
	IO#external_encoding	返回IO的外部编码
	IO#internal_encoding    返回IO的内部编码
	IO#set_encoding() 		设定IO的编码
	没有明确指定编码时，IO对象外部/内部编码各自使用起默认值Encoding#default_external/Encoding#default_internal
=end
#5.2编码的设定
# IO#set_encoding("外部编码名:内部编码名")
# File#oepn(file,"mode:外部编码名:内部编码名（可省略）") File.oepn("test.txt","w:UTF-8")
#5.3编码的作用
