clear:
	docker-compose down -v
	sudo rm -rf ./drupal/d_modules
	sudo rm -rf ./drupal/d_profiles
	sudo rm -rf ./drupal/d_sites
	sudo rm -rf ./drupal/d_themes

prepare:
	docker-compose up -d
	docker exec drupal composer require drush/drush	
	docker exec drupal bash -c 'apt-get update'
	docker exec drupal bash -c 'chmod a+x /opt/drupal/scripts/autoinstall.sh'
	docker exec drupal bash -c 'chmod -R 777 /opt/drupal/web'
	docker exec drupal bash -c 'mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini'
	docker exec drupal bash -c 'sed -i "s/memory_limit = 128M/memory_limit = 512M/" /usr/local/etc/php/php.ini'


autoinstall:
	docker exec drupal bash -c '/opt/drupal/scripts/autoinstall.sh'