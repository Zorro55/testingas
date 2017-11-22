#!/bin/bash
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

# fiansding files that differ from this commit and master
check_rc $? 'echo git fetch'
git fetch
check_rc $? 'git fetch'
check_rc $? 'echo git diff'
diff_files=`git diff --name-only origin/master | xargs`
check_rc $? 'git diff'
for x in ${diff_files}
do
   if [ "$x" == "a.txt" ]; then
        echo "a.txt was changed"
	    exit	
   elif [ "$x" -ne "a.txt" ]; then
   echo "skip because no changes"
   exit
   fi
done
