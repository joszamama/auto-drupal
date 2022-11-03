#!/bin/bash
# drush sql-create --db-su=${USER} --db-su-pw=${PASS} --db-url=${DB_URL}

drush site-install ${DRUPAL_PROFILE} \
	--locale=${LOCALE} \
	--db-url=${DB_URL} \
	--site-name=${SITE_NAME} \
	--site-mail=${SITE_MAIL} \
	--account-name=${ACCOUNT_NAME} \
	--account-mail=${ACCOUNT_MAIL} \
	--account-pass=${ACCOUNT_PASS} \
	--yes