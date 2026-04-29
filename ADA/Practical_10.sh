if [ $# -eq 0 ]
then
 echo "Usage: $0 number1 number2 ... numberN"
      exit
fi
arr=("$@")
n=$#

for ((i=0; i<n; i++))
do
  for ((j=0; j<n-i-1; j++))
  do
  if [ ${arr[j]} -lt ${arr[j+1]} ]
  then
  
  temp=${arr[j]}
  arr[j]=${arr[j+1]}
  arr[j+1]=$temp
  fi
  done
  done
  
  echo "number in descending order :"
  echo "${arr[@]}"
