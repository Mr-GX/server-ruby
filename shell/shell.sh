#! /bin/bash
echo 'hello world!'

test_var='i am a var'
echo $test_var

for i in java ruby php; do
	echo "iterator===>hello, $i" '!'
done

length_var='hello,shell'
echo ${#length_var}

cut_var='hello,shell'
echo ${cut_var:1:3}

arr_var=(1 2333 3)
echo ${arr_var[1]}
echo ${arr_var[@]}

echo ${#arr_var[@]}
echo ${#arr_var[*]}

echo ${#arr_var[1]}