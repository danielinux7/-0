shuf 5.ab.txt -o 5.ab.txt 

split -l 500 -d 3.ab.txt 3.

for file in *; do mv $file $file+ab.txt; done

for file in *; do sort $file -o $file; done

for file in *; do cat $file | awk '{ print length, $0 }' | sort -n -s | cut -d" " -f2- > $file+2; done

rm *.txt

for file in *; do mv $file ${file/txt+2/txt}; done
