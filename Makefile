clear:
	docker-compose down -v

autoinstall:
	docker-compose up -d
	docker exec drupal composer require drush/drush
	docker exec drupal bash -c 'chmod a+x /opt/drupal/scripts/autoinstall.sh'
	sudo chmod -R ugo+rwx '${CURDIR}/drupal'
	sudo chmod ugo+rwx '${CURDIR}/drupal/d_sites/default/files'
	sudo chmod ugo+rwx '${CURDIR}/drupal/d_sites/default/files/translations'
	docker exec drupal bash -c '/opt/drupal/scripts/autoinstall.sh'