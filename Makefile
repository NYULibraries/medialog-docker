.DEFAULT_GOAL := help

help:  ## Print this help message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create-db:  ## Bootstrap Database.
	docker-compose exec db psql -Upostgres -c "CREATE USER medialog superuser login password 'medialog';"
	docker-compose exec db psql -Upostgres -c "CREATE DATABASE medialog_dev owner 'medialog';"
	docker-compose exec db psql -Upostgres -c "CREATE DATABASE medialog_test owner 'medialog';"

start-db:  ## Start postgresql service.
	docker-compose up -d db

migrate-db:	## run database migrations
	docker-compose exec medialog /opt/medialog/scripts/migrate_db.sh

start-medialog:  ## Start postgresql service.
	docker-compose up medialog

shell:  ## start the medialog shell
	docker-compose exec medialog /bin/bash

restart-medialog:  ## start the medialog shell
	docker-compose stop medialog
	docker-compose up medialog
