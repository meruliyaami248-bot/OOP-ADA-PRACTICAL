# Write a shell script to mail a common message to all users 
# who are currently logged in

echo "Enter the message to send:"
read msg

echo "Sending message to all logged in users..."

for user in $(who | cut -d " " -f1)
do
    echo "$msg" | mail -s "Common Message" $user
done

echo "Message sent successfully."
