.PHONY: verse
verse:
	docker-compose network create aranoverse

#.PHONY: updb
updb:
	docker-compose  -f mysql/docker-compose.yml -f redis/docker-compose.yaml -p aranoverse up -d


#.PHONY: downdb
downdb:
	docker-compose  -f mysql/docker-compose.yml -f redis/docker-compose.yaml -p aranoverse down