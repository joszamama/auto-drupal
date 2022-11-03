uninstall:
	docker-compose down -v

autoinstall:
	docker-compose up -d
	docker exec drupal composer require drush/drush
	docker exec drupal drush sql:create --db-su=drupal --db-su-pw=drupal --db-url="mysql://drupal:drupal@drupal_db:3306/drupal"
	# docker exec --env-file drupal-install.env drupal drush site-install ${DRUPAL_PROFILE} \
	# --locale=${LOCALE} \
	# --db-url=${DB_URL} \
	# --site-name=${SITE_NAME} \
	# --site-mail=${SITE_MAIL} \
	# --account-name=${ACCOUNT_NAME} \
	# --account-mail=${ACCOUNT_MAIL} \
	# --account-pass=${ACCOUNT_PASS} \
	# --yes
