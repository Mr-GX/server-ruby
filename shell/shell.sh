#! /bin/bash
echo 'hello world!'

test_var='i am a var' # 变量名和等号之间不能有空格
echo $test_var
echo "${test_var}abc"

for i in java ruby php; do
   echo "iterator===>hello, $i" '!'
done

length_var='hello,shell'
echo ${#length_var} # 获取string长度

cut_var='hello,shell'
echo ${cut_var:0:3} # 从位置0截取3个字符

arr_var=(1 2333 '3')
echo ${arr_var[1]}
echo ${arr_var[@]} # @/*获取所有数组参数

echo ${#arr_var[@]} # 获取数组大小
echo ${#arr_var[*]}

echo ${#arr_var[1]} # 获取位置1值的长度

# ./shell.sh test demo
echo $1 $2
echo "传递参数的个数是：$#"
echo "显示所有传递参数：$*,$@"
for i in "$*"; do  # $* 所有传递参数合并
   echo $i
done
for i in "$@"; do 
   echo $i
done

a=10
b=20
c='30'
echo `expr $a + $b` # 反引号，表达式和运算符之间要有空格.fuuuuuuuuuuuuuck!!!
echo `expr $a \* $b` # \*才能实现乘法运算
if [ $a != $b ]; then #	算术运算符
	echo 'a != b'
else
	echo 'a == b'
fi
# -eq/ne/gt/lt/ge/le 相等/不相等/左大于右/左小于右/左大于等于右/左小于等于右，true
if [ $a -ne $c ]; then # 关系运算符（只支持数字，不支持字符串，除非字符串的值是数字）
	echo 'a != c'
else
	echo 'a == c'
fi
# !/-o/-a 非/或/与运算
if [ $a -lt 15 -o $b -gt 100 ]; then # 布尔运算符
	echo 'a<15或b>100'
else
	echo 'neither nor'
fi
# &&/|| 逻辑与/或运算
if [[ $a -lt 15 && $b -gt 100 ]]; then # 逻辑运算符
	echo 'a<15且b>100'
else
	echo 'neither nor'
fi
# =/!=/-z/-n/str 相等/不相等/长度0/长度不为0/不为空，true
str1='abc'
str2=''
if [[ $str1 = $str2 ]] # 字符串运算符
then
	echo "$str1 = $str2"
elif [ -z $str1 ]
then
	echo 'str1长度为0'
elif [ $str2 ]
then
	echo 'str2不为空'
else
	echo 'str1不等于str2，且长度不为0。str2为空'
fi
# -b/-c/-d/-f/-g/-k/-p/-u/-r/-w/-x/-s/-e d是目录/r可读/w可写/x可执行/s文件大小大于0/e存在，true
file='/Users/InSight/RubyOnRails/shell/shell.sh'
if [ -d $file ]	# 文件测试运算符
then
	echo '文件是目录'
elif [ -r $file ]
then
	echo '文件可写'
fi

echo 'test echo'
echo test echo

echo "\"test transferred meaning character\""

echo -e 'ok! google \n test success'	# -e开启转义

echo -e 'ok! google \c'	# \c不换行
echo 'test success'

echo 'output result to file' > output.txt

echo '$str1\"' # 单引号不转义不引用变量

echo `date`