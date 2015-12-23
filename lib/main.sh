# Upgrade

function upgrade() {
  sudo apt-get -y update
  sudo apt-get -y --force-yes upgrade
  sudo apt-get -y install unzip python-software-properties
}

# Install

function install_nginx() {
  sudo apt-get -y install nginx
}

function install_php() {
  sudo touch /etc/apt/sources.list.d/ondrej-php5-5.6.list
  sudo echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" >> /etc/apt/sources.list.d/ondrej-php5-5.6.list
  sudo echo "deb-src http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" >> /etc/apt/sources.list.d/ondrej-php5-5.6.list
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
  sudo apt-get --force-yes update
  sudo apt-get --force-yes upgrade
  sudo apt-get --force-yes --force install php5-fpm
}

function install_php_drivers {
  sudo apt-get --force-yes install php5-mysql php5-curl php5-mcrypt php5-cli
  # Install Composer
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
}

# Configure

function configure_php() {
  sudo sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
  sudo service php5-fpm restart
  sudo php5enmod mcrypt
  sudo service php5-fpm restart
}

function configure_nginx() {
  mkdir $HOME/www
  mkdir $HOME/www/public
  sudo cp config/virtualhost.txt /etc/nginx/sites-available/site
  sudo sed -i -e "s@INSERT_ROOT@$HOME/www/public@g" /etc/nginx/sites-available/site
  sudo ln -s "/etc/nginx/sites-available/site" "/etc/nginx/sites-enabled/site"
  sudo rm "/etc/nginx/sites-enabled/default"
  sudo service nginx restart
}
