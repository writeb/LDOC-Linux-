#!/bin/bash
echo "Running smoke test"
java -vesrion
mvn -v
docker ps
curl -I http://localhost:8080 || echo "Backend not responding"
echo "Backend VM smoke test finished"
