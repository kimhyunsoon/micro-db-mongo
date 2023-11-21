#!/bin/bash
source ./config

mongosh --host 127.0.0.1 --port 27017 <<EOF
var config = {
  "_id": "rs",
  "members": [
    {
      "_id": 0,
      "host": "$OUTER_HOST:$OUTER_PORT",
    },
  ]
};

rs.initiate(config, { force: true });

use admin;

db.createUser({
  user: '$DB_ROOT_NAME',
  pwd: '$DB_ROOT_PASSWORD',
  roles: [
    {
      role: 'root',
      db: 'admin'
    },
  ],
});

db.auth('$DB_ROOT_NAME', '$DB_ROOT_PASSWORD');

db.createUser({
  user: '$DB_MASTER_NAME',
  pwd: '$DB_MASTER_PASSWORD',
  roles: [
    {
      role: 'dbOwner',
      db: '$DB_DATABASE_NAME',
    },
  ],
});
EOF