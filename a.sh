!#/bin/bash

diff_files=`git diff --name-only $GIT_PREVIOUS_COMMIT $GIT_COMMIT`
echo "prosto hujnia22" ${diff_files} > hujnia22.txt
for x in ${diff_files}
do
  echo "prosto hujnedsfsdfsdfia!!!!!" ${x} > hujnia.txt
  if [ "${x}" = "a.txt" ] 
  then
     echo "a.txt changed" > log1.txt
  else
     echo "nihuja ne changed" > log2.txt
  fi
done

