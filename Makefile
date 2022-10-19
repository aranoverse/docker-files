.PHONY: verse
verse:
	docker network create aranoverse

.PHONY: downverse
	docker-compose -p aranoverse down

.PHONY: updb
updb:
	docker-compose  -f docker-compose.yml -f mysql/docker-compose.yml -f redis/docker-compose.yaml -p aranoverse up -d


.PHONY: downdb
downdb:
	docker-compose  -f mysql/docker-compose.yml -f redis/docker-compose.yaml -p aranoverse down

.PHONY: upmq
upmq:
	docker-compose  -f docker-compose.yml -f kafka/docker-compose.yml -p aranoverse up -d

.PHONY: downmq
downmq:
	docker-compose - -f kafka/docker-compose.yml -p aranoverse down
