Setup Ansible
Install ansibe on Ubuntu 22.04

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
Add Jenkins master and slave as hosts Add jenkins master and slave private IPs in the inventory file in this case, we are using /opt is our working directory for Ansible.

1. lay file key da dowload o tu aws ve xong tha vao server ansible
1.1 cd/home/ubuntu de lay key.pem sau do di chuyen file nay vao /opt bang lenh mv key.pem /opt. Dat quyen cho file cho dung la chmod 44 /opt/congthanh-devops
1.2 vao ls kiem tra xem co file key.pem chua sau do viet file hosts de lien ket cac server

------------noi dung file hosts------------------
[jenkins-master]
10.1.1.192

[jenkins-master:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/congthanh-devops.pem

[jenkins-slave]
10.1.1.160

[jenkins-slave:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/congthanh-devops.pem
-----------------------------------------------------

Test the connection:
ansible -i hosts all -m ping
neu thay nhu nay la da thanh cong
10.1.1.192 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}

1.3 viet file vi jenkins-master-setup.yaml
chay bang lenh ansible-playbook -i /opt/hosts  jenkins-master-setup.yaml de cai dat

1.4 chay cau lenh nay de lay mk cho jenkins /var/lib/jenkins/secrets/initialAdminPassword

1.5 viet file jenkins-salve-setup.yaml de chay du an java bang maven
kiem tra thu bang cau lenh ansible-playbook -i /opt/hosts  jenkins-salve-setup.yaml --check