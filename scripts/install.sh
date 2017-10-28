 #!/usr/bin/env bash

# Add our repos to ensure we get the correct versions of node and nginx
curl -s https://getcaddy.com | bash

# Create our caddy folders
sudo mkdir /etc/caddy
sudo chown -R root:www-data /etc/caddy
sudo mkdir /etc/ssl/caddy
sudo chown -R www-data:root /etc/ssl/caddy
sudo chmod 0770 /etc/ssl/caddy

# Create caddy as a service
sudo cp /vagrant/config/caddy.service /etc/systemd/system/caddy.service
sudo systemctl daemon-reload
sudo systemctl enable caddy.service

# Install git, node and nginx
sudo apt-get -y install nodejs git

# Grab RVM and install ruby 2.3
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash
source $HOME/.rvm/scripts/rvm
rvm install 2.4

# Get rails and jekyll ready to use
gem install jekyll rails
