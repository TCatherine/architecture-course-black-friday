#! /bin/bash
set -e

echo "Testing router service..."
docker compose exec -T mongos_router mongosh --port 27020 --quiet <<EOF
use somedb
db.helloDoc.countDocuments() 
sh.status()
exit();
EOF

echo ""
echo "-----------------------------------------------------------"
echo "Testing shard1-1 service..."
docker compose exec -T shard1-1 mongosh --port 17018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments() 
rs.status()
exit();
EOF

echo ""
echo "-----------------------------------------------------------"
echo "Testing shard1-2 service..."
docker compose exec -T shard1-2 mongosh --port 27018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments() 
exit();
EOF

echo ""
echo "-----------------------------------------------------------"
echo "Testing shard1-3 service..."
docker compose exec -T shard1-3 mongosh --port 37018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments() 
exit();
EOF

echo ""
echo "-----------------------------------------------------------"
echo "Testing shard2-1 service..."
docker compose exec -T shard2-1 mongosh --port 17019 --quiet <<EOF
use somedb
db.helloDoc.countDocuments() 
rs.status()
exit();
EOF

echo ""
echo "-----------------------------------------------------------"
echo "Testing shard2-2 service..."
docker compose exec -T shard2-2 mongosh --port 27019 --quiet <<EOF
use somedb
db.helloDoc.countDocuments() 
exit();
EOF

echo ""
echo "-----------------------------------------------------------"
echo "Testing shard2-3 service..."
docker compose exec -T shard2-3 mongosh --port 37019 --quiet <<EOF
use somedb
db.helloDoc.countDocuments() 
exit();
EOF

echo ""
echo "-----------------------------------------------------------"
echo "Testing endpoint 1..."
time curl 127.0.0.1:8080/helloDoc/users >/dev/null

echo ""
echo "-----------------------------------------------------------"
echo "Testing endpoint 2..."
time curl 127.0.0.1:8080/helloDoc/users >/dev/null

echo ""
echo "-----------------------------------------------------------"
echo "Testing endpoint 3..."
time curl 127.0.0.1:8080/helloDoc/users >/dev/null
