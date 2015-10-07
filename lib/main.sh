# Upgrade

function upgrade() {
  sudo apt-get -y update
  sudo apt-get -y --force-yes upgrade
}

# Install

function install_nginx() {
  sudo apt-get -y install nginx
}

function install_php() {
  sudo apt-get -y install php5-fpm
}

function install_php_drivers {
  sudo apt-get -y install php5-mysql php5-curl
}

# Configure

function configure_php() {
  sudo sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" "/etc/php5/fpm/php.ini"
  sudo service php5-fpm restart
}

function configure_nginx() {
  mkdir $HOME/www
  mkdir $HOME/www/public
  sudo rsync "configs/virtualhost.txt" "/etc/nginx/sites-available/site"
  sudo sed -i "s/INSERT_ROOT/$HOME\/www\/public/g" "/etc/nginx/sites-available/site"
  sudo ln -s "/etc/nginx/sites-available/site" "/etc/nginx/sites-enabled/site"
  sudo rm "/etc/nginx/sites-enabled/default"
  sudo service nginx restart
}
