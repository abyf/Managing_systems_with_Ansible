#!/bin/bash
ansible proxy -m user -a "name=automation state=present"
ansible database -m user -a "name=automation state=present"
ansible webservers -m user -a "name=automation state=present"

ansible proxy -m copy -a "src=/home/automation/.ssh/id_rsa.pub dest=/home/automation/.ssh/authorized_keys/"
ansible database -m copy -a "src=/home/automation/.ssh/id_rsa.pub dest=/home/automation/.ssh/authorized_keys/"
ansible webservers -m copy -a "src=/home/automation/.ssh/id_rsa.pub dest=/home/automation/.ssh/authorized_keys/"

ansible proxy -m file -a "name=ansible state=touch"
ansible proxy -m copy -a "content='ansible ALL=(ALL) NOPASSWD:ALL' dest=/etc/sudoers.d/ansible"
ansible database -m file -a "name=ansible state=touch"
ansible database -m copy -a "content='ansible ALL=(ALL) NOPASSWD:ALL' dest=/etc/sudoers.d/ansible"
ansible webservers -m file -a "name=ansible state=touch"
ansible webservers -m copy -a "content='ansible ALL=(ALL) NOPASSWD:ALL' dest=/etc/sudoers.d/ansible"

