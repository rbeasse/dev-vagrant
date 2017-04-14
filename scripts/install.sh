 #!/usr/bin/env bash

# Add our repos to ensure we get the correct versions of node and nginx
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo add-apt-repository ppa:nginx/stable -y
sudo apt-get update

# Install git, node and nginx
sudo apt-get -y install nodejs git nginx

# Grab RVM and install ruby 2.3
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash
source $HOME/.rvm/scripts/rvm 
rvm install 2.3

# Get rails and jekyll ready to use
gem install jekyll rails

# Set up our nginx sites
sudo cp /vagrant/config/nginx-default /etc/nginx/sites-available/default
sudo service nginx restart