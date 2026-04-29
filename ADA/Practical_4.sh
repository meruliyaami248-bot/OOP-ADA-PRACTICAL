echo " Enter Number for Table : "
read n

 for i in {1..10}
 do
 	result=$((i * n))
 	echo " $n x $i = $result "
done
