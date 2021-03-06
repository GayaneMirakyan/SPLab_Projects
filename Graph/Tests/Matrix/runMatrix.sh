#!/bin/bash
./buildMatrix.sh

for i in {1..100..1}
do
	./randomNum > num
	cat num | ./TestForTest2 > finalTestForTest2
	sort -n finalTestForTest2 > temp
	cat num | ./test2 > maintest2
	cat maintest2 | ./main > finalTest
	sort -n finalTest > finaltesttemp
        diff -s temp finaltesttemp > answer
        if [ "$echo $(cat answer)" == "$echo Files temp and finaltesttemp are identical" ]
	then
		echo $i" iteration for test 2 success"
	else
		echo "fail test 2"
	fi
	echo "for numbers"
	echo $(cat num)
	echo

        rm num
	rm finalTestForTest2
	rm temp
	rm maintest2
	rm finalTest
	rm finaltesttemp
	rm answer
done
./cleanMatrix.sh
