echo "Enter a number:"
read n
count=0     
num=2        
while [ $count -lt $n ]
do
    i=2
    flag=1   
    while [ $i -lt $num ]
    do
        if [ $((num % i)) -eq 0 ]
        then
            flag=0   
            break
        fi
        i=$((i+1))
    done
    if [ $flag -eq 1 ]
    then
        echo -n "$num "
        count=$((count+1))
    fi
    num=$((num+1))
done
echo
