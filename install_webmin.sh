sudo apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python -y
sudo echo "deb http://download.webmin.com/download/repository sarge contrib" >>/etc/apt/sources.list
cd /root
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install webmin
