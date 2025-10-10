mv $1 $1.tmp
cat $1.tmp | jq 'del(.text)' > $1
rm $1.tmp


