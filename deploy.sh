#!/bin/bash
clear
starttime=`date +%s`
for x in `cat hosts | egrep  -o '^\s*[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+'`; do ssh-keygen -R $x -f $HOME/.ssh/known_hosts; ssh -o "StrictHostKeyChecking no" -o "PasswordAuthentication no" $x; done
ansible-playbook -i hosts mariadb.yml
finishtime=`date +%s`
printf 'Seconds:'
echo $finishtime-$starttime | bc
