#!/bin/bash
find . -type f -name "* *" -print |
while read name;
do
   na=$(echo $name | tr -d ' ')
   if [[ $name != $na ]]; then
      mv "$name" $na;
   fi
done