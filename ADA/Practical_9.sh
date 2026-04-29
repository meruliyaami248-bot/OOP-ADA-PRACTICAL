echo "Enter date (dd-mm-yyyy):"
read date

dd=$(echo $date | cut -d'-' -f1)
mm=$(echo $date | cut -d'-' -f2)
yyyy=$(echo $date | cut -d'-' -f3)

# validate month
if [ $mm -le 0 ] || [ $mm -gt 12 ]
then
    echo "invalid month"
    exit
fi

# validate year
if [ $yyyy -le 0 ]
then
    echo "invalid year"
    exit
fi

# find max days in month
case $mm in
1|3|5|7|8|10|12)
    Day=31
    ;;
4|6|9|11)
    Day=30
    ;;
2)
    if [ $((yyyy % 4)) -eq 0 ]
    then
        Day=29
    else
        Day=28
    fi
    ;;
esac

# validate day
if [ $dd -le $Day ] && [ $dd -gt 0 ]
then
    echo "valid date"
else
    echo "invalid date"
fi
