.DEFAULT_GOAL := help

help:  ## Print this help message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


bootstrap-db:  ##Bootstrap Database.
	docker-compose exec db psql -Upostgres -e "\
		CREATE USER medialog superuser login password 'medialog';\
		CREATE database medialog_dev owner medialog;\
		CREATE database medialog_test owner medialog;"

