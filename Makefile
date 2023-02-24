.PHONY: verse
verse:
	docker network create aranoverse

.PHONY: downverse
downverse:
	docker compose -p aranoverse down

.PHONY: updb
updb:
	docker compose  -f docker-compose.yml -f mysql/docker-compose.yml -f redis/docker-compose.yaml -p aranoverse up -d

.PHONY: upmq
upmq:
	docker compose  -f docker-compose.yml -f kafka/docker-compose.yml -p aranoverse up -d

.PHONY: upgw
upgw:
	docker compose -f nginx/docker-compose.yml up -d

.PHONY: downgw
downgw:
	docker compose -f nginx/docker-compose.yml down