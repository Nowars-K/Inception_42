if [ ! -d "/var/www/app" ];then
	sh wordpress_setup.sh
fi
exec $@