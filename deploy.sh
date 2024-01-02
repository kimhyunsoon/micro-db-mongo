#!/bin/bash
eval $(< .env) docker stack deploy --with-registry-auth --compose-file docker-compose.yml micro_db
