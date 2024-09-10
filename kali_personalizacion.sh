#!/bin/bash
sudo apt-get update
gzip -d /usr/share/wordlists/rockyou.txt.gz

#-----------------TOOLS-----------------

#install terminator
sudo apt-get install terminator

#install AWS
cd /home/kali
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install -y

#install trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy

#install docker
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo groupadd docker
sudo usermod -aG docker kali
sudo chmod 666 /var/run/docker.sock

#install arjun
sudo pip3 install arjun

#install dalfox
go install github.com/hahwul/dalfox/v2@latest

#install prowler
cd /home/kali
sudo apt install python3-poetry -y
git clone https://github.com/prowler-cloud/prowler
cd prowler
poetry shell
poetry install
python prowler.py -v
pip install --upgrade sagemaker
sudo pip install alive_progress
sudo pip install boto3
sudo pip install schema
sudo pip install detect_secrets
sudo pip install py_ocsf_models
sudo pip install slack_sdk
sudo pip install tzlocal
sudo pip install dash
sudo pip install dash_bootstrap_components

#install ScoutSuite
cd /home/kali
git clone https://github.com/nccgroup/ScoutSuite
cd ScoutSuite
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt
python scout.py --help
sudo pip install asyncio_throttle
sudo pip install coloredlogs
sudo pip install sqlitedict
sudo pip install policyuniverse

#security headers
pip3 install shcheck

#install apktool
sudo apt install apktool

#install gobuster
sudo apt install gobuster

#update nuclei
nuclei -update
nuclei -update-templates

#-----------------DIRECTORIES-----------------
su kali
cd /home/kali
mkdir Pentest
mkdir THM
mkdir HtB
