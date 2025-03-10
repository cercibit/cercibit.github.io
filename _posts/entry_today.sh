#!/bin/bash

DATE=$(date +%Y-%m-%d)
echo $DATE
echo "please enter the title of the blog post:"
read TITLE
FILE_NAME="$DATE-$TITLE.md"
#touch $FILE_NAME
echo $FILE_NAME
if [ -f $FILE_NAME ]; then
	echo "file exist"
	echo "do you want to start with empty file: type "Y" or "N""
	read FLAG
	if [ $FLAG == "Y" ] || [ $FLAG == "y" ];then 
		rm $FILE_NAME
		touch $FILE_NAME
		echo "file recreated"
	elif [ $FLAG == "N" ] || [ $FLAG == "n" ];then
		echo "file is not touched"
	else
		echo "please enter Y or N"
	fi

else
	echo "error"
fi

echo "---" >> $FILE_NAME
echo "title: $TITLE" >> $FILE_NAME
echo "date: $DATE" >> $FILE_NAME
echo "---" >>$FILE_NAME

#normal o needed to start a newline and go into insert mode"
vim + -c "normal o" $FILE_NAME

