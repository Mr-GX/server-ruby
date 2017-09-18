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

#####################################################################################
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

#####################################################################################
echo 'test echo'
echo test echo

echo "\"test transferred meaning character\""

echo -e 'ok! google \n test success'	# -e开启转义

echo -e 'ok! google \c'	# \c不换行
echo 'test success'

echo 'output result to file' > output.txt

echo '$str1\"' # 单引号不转义/不引用变量

echo `date`

printf "ok! google " # 不像echo默认换行
printf "ok! google\n"

printf "%-8s %-8s %-8s\n" 姓名 成绩 体重kg	# %-8s表示一个宽度8个字符，有-左对齐，否则右对齐
printf "%-8s %-8d %-8.2f\n" 果果 65 52.8953	# %-8.2f格式化保留2位小数

#####################################################################################
if test [$str1 = $str2] #test命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试
then
	echo '俩字符相等'
else
	echo '俩字符不相等'
fi

#####################################################################################
#流程控制
if [[ $str1 != $str2 ]]; then echo "俩字符不相等"; fi
for i in java ruby php; do echo $i; done

int=1
while (( $int <= 5 ))
do 
	echo $int 
	let int++	# bash中用于计算的工具,执行一个或多个表达式,不需要加上$来表示变量
done

# while :或true; do command; done 无限循环
until [ $int -ge 10 ]
do 
	echo $int
	let int++
done

case 2 in
	1) echo 'case 1' ;;
	2) echo 'case 2' ;;
	3) echo 'case 3' ;;
	*) echo 'oops' ;;
esac

# 跳出循环 break／continue
while :
do
    echo -n "输入 1 到 5 之间的数字:"
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的!"
            break
			# continue
			# echo 'continue'
        ;;
    esac
done

#####################################################################################
# 函数
testFun(){
	echo '这是一个shell函数'
	echo '输入一个测试数字'
	read aNum
	return $aNum #参数返回，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值(0-255)
}
echo '----函数start----'
testFun
echo '----函数end-----'
# 函数参数
# $#/*/$/!/@/-/? 参数个数／显示所有参数／进程id号／后台运行的最后一个进程id号
#／与$*相同，但是使用时加引号，并在引号中返回每个参数／显示shell当前使用选项，与set命令功能相同／显示最后命令退出状态，0无错误，其他有错误
funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !" #$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73

#####################################################################################
# 文件包含
# 当前脚本文件必须有可执行权限， chmod +x shell.sh
. file_include.sh # 或source file_include.sh
echo "shell文件引用：$test_file_include"