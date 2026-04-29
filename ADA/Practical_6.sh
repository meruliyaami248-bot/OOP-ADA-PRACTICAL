echo "Enter String OR number:"
read n
reverse=$(echo "$n" | rev)
echo "Reverse of $n is $reverse"
echo ""
if [ "$n" = "$reverse" ];
then 
echo "$n is Palindrom"
else
echo "$n is Not Palindrom"
fi
