!#/bin/bash
check_rc() {
  # exit if passed in value is not = 0
  # $1 = return code
  # $2 = command / label
  if [ $1 -ne 0 ]
  then
    echo "$2 command failed"
    exit 1
  fi
}

d="X"
echo ${d}
if [ "$d" = "X" ]; then
  echo hujnedsfsdfsdfi
fi  

# finding files that differ from this commit and master
echo 'git fetch'
check_rc $? 'echo git fetch'
git fetch
check_rc $? 'git fetch'
echo 'git diff --name-only origin/master'
check_rc $? 'echo git diff'
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

