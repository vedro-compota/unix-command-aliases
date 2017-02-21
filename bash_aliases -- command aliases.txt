
#---------------------PHP terminal command aliases---------------------------------

alias usephp7='sudo a2dismod php5.6  && sudo a2enmod php7.0 && sudo service apache2 restart &&  sudo update-alternatives  --set php /usr/bin/php7.0'
alias usephp56='sudo a2dismod php7.0 && sudo a2enmod php5.6 && sudo service apache2 restart && sudo update-alternatives  --set php /usr/bin/php5.6'