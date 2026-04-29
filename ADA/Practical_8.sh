echo "Enter the size of fibonacci series :"
read num
x=1
y=1
echo "Fibonacci series is :"
for ((i=1;i<=num;i++))
do
    echo -n "$x "
    next=$((x+y))
    x=$y
    y=$next
done
echo
