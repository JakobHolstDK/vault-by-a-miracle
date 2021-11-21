#!/usr/bin/env bash
DEBUG=1
source /tmp/venv/bin/activate

logme() {
  if [[ $DEBUG == 1 ]];
  then
    local loginfo="$1"
    echo "`date`, $loginfo"
  fi
}

git fetch
git status
if [[ $? == 0 ]]
then
  logme "Git it clean ready to go"
else
  git stash
  git pull
  exit
fi
logme "Up the virtual environment"
vl up 


logme "Setup ansible.cfg"

#Set some values in ansible conf
echo "[defaults]" > ansible.cfg
echo "deprecation_warnings=False" >> ansible.cfg
echo "stdout_callback=yaml" >> ansible.cfg


#Prepare an ssh config to use  
logme "Update ssh config file"
echo "#SSH config autocreated" > sshconfig
echo "StrictHostKeyChecking no" >> sshconfig
echo "UserKnownHostsFile /dev/null" >> sshconfig
echo "LogLevel QUIET" >> sshconfig
vl ssh_config |grep -v Ident >> sshconfig 


echo > inventory
# Inventory creater 
echo "[memcached]" >> inventory
vl ansible_inventory  |grep test >> inventory
echo "" >> inventory

ansible-galaxy install -f -r roles/requirements.yml
ansible-playbook -i inventory testplaybook.yaml
exit 0

