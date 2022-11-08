clear:
	docker-compose down -v
	sudo rm -rf ./drupal/d_modules
	sudo rm -rf ./drupal/d_profiles
	sudo rm -rf ./drupal/d_sites
	sudo rm -rf ./drupal/d_themes

autoinstall:
	docker-compose up -d
	docker exec drupal composer require drush/drush
	docker exec drupal bash -c 'chmod a+x /opt/drupal/scripts/autoinstall.sh'
	docker exec drupal bash -c 'chmod -R 777 /opt/drupal/web'
	docker exec drupal bash -c '/opt/drupal/scripts/autoinstall.sh'