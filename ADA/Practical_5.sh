echo " Enter Number for Factorial : "
read n
fact=1
if [ $n -eq 0 ]
then
echo "Factorial of $n! = $fact "
else
for((i=1;i<=n;i++))
do
 	fact=$((fact * i))
done
echo "The factorial of $n is: $fact"
fi
