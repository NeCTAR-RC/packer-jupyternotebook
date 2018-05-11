IFS=$'\n';
for LINE in cat $(cat /tmp/test); do 
    KEY=$(echo $LINE | awk -F' = ' '{print $1}' | sed 's/^#//g')
    NEWKEY=$(echo $LINE | awk -F' = ' '{print tolower($1)}' | sed -e 's/^#c\./jupyter_notebook_/g' -e 's/\./_/g')
    VAL=$(echo $LINE | awk -F' = ' '{print $2}')
    echo "#$NEWKEY = $VAL"
done
