uninstall:
	docker-compose down -v

autoinstall:
	docker-compose up -d
	docker exec drupal composer require drush/drush
	docker exec --env-file drupal-install.env drupal /opt/drupal/scripts/autoinstall.sh
	docker exec --env-file drupal-install.env drupal /opt/drupal/scripts/autoinstall.sh