for file in *.txt;
do
  sed -i -r 's/[0-9]*([[:alpha:]–])[0-9]*/\1/g' $file;
  sed -i -z 's/[\xC2\xAD-]\n//g' $file;
  sed -i -e 's/\xC2\xAD//g' $file;
  sed -i -z 's/\n/ /g' $file;
  sed -i -r 's/([:!?]) /\1\n/g' $file;
  sed -i -r 's/([[:alpha:]][[:alpha:]][[:alpha:]]\.) /\1\n/g' $file;
  sort $file | uniq > $file+2
  cat $file+2 | awk '{ print length, $0 }' | sort -n -s | cut -d" " -f2- > $file
  rm $file+2
  ## here is more work needed.
  split -l 500 -d $file ${file/.txt//}
done
