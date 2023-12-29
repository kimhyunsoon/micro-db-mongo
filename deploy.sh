#!/bin/bash
eval $(< .env) docker stack deploy --with-registry-auth --compose-file docker-compose.yml blitz_db
