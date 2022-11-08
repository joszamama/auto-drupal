clear:
	docker-compose down -v

autoinstall:
	docker-compose up -d
	docker exec drupal composer require drush/drush
	docker exec drupal bash -c 'chmod a+x /opt/drupal/scripts/autoinstall.sh'
	docker exec drupal bash -c 'chmod -R 777 ./'
	docker exec drupal bash -c '/opt/drupal/scripts/autoinstall.sh'