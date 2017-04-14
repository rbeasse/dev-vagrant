curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo add-apt-repository ppa:nginx/stable -y
sudo apt-get update

sudo apt-get -y install nodejs git nginx

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash
source /etc/profile.d/rvm.sh
rvm install 2.3