echo "test"


files=($"ls -1 raw/**/*")
for file in $files
do
	echo ">>>"$file
done
