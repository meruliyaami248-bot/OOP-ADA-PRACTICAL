echo "Enter student1 name :"
read x
echo "Enter student2 name :"
read y
echo "Enter student3 name :"
read z
echo "Enter marks of $x in OS,OOP & DM"
read OS1
read OOP1
read DM1
echo "Enter marks of $y in OS,OOP & DM"
read OS2
read OOP2
read DM2
echo "Enter marks of $z in OS,OOP & DM"
read OS3
read OOP3
read DM3
t1=$(( OS1 + OOP1 + DM1 ))
t2=$(( OS2 + OOP2 + DM2 ))
t3=$(( OS3 + OOP3 + DM3 ))
echo "Total of $x : $t1"
echo "Total of $y : $t2"
echo "Total of $z : $t3"
p1=$(( t1 / 3 ))
p2=$(( t2 / 3 ))
p3=$(( t3 / 3 ))
echo "Percentage of $x : $p1"
echo "Percentage of $y : $p2"
echo "Petcentage of $z : $p3"

echo "---------------------------"
echo "          MARKSHEET        "
echo "---------------------------"
echo " student name: $x    "  
echo " OS          : $OS1  "    
echo " OOP         : $OOP1 " 
echo " DM          : $DM1  " 
echo " percentage  : $p1 % " 
echo " Status      : Pass  " 

echo "---------------------------"
echo "          MARKSHEET        "
echo "---------------------------"
echo " student name: $y    "  
echo " OS          : $OS2  "    
echo " OOP         : $OOP2 " 
echo " DM          : $DM2  " 
echo " percentage  : $p2 % " 
echo " Status      : Pass  " 

echo "---------------------------"
echo "          MARKSHEET        "
echo "---------------------------"
echo " student name: $z    "  
echo " OS          : $OS3  "    
echo " OOP         : $OOP3 " 
echo " DM          : $DM3  " 
echo " percentage  : $p3 % " 
echo " Status      : Pass  " 














