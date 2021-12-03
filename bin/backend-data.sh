#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}/.."

curl -d '{"name":"Cereal"}' -H "Content-Type: application/json" -X POST http://localhost:10001/items
curl -d '{"name":"Milk"}' -H "Content-Type: application/json" -X POST http://localhost:10001/items
curl -d '{"name":"Canned Tuna"}' -H "Content-Type: application/json" -X POST http://localhost:10001/items
curl -d '{"name":"Soup"}' -H "Content-Type: application/json" -X POST http://localhost:10001/items

curl -d '{"email":"xramirez@college.edu", "preferences":"Cherios", "restrictions":"Soy", "items":[{"_id":"61aa5a298153980008823b54", "name":"Cereal"}]}' -H "Content-Type: application/json" -X POST http://localhost:10001/orders
curl -d '{"email":"tbecker@college.edu", "preferences":"Blueberries", "restrictions":"Peanuts", "items":[{"_id":"61aa5a298153980008823b54", "name":"Cereal"},{"_id":"61aa5a298153980008823b52", "name":"Milk"}, {"_id":"61aa73a98153980008823b71", "name":"Fruit"} ]}' -H "Content-Type: application/json" -X POST http://localhost:10001/orders
curl -d '{"email":"pnguyen@college.edu", "preferences":"a", "restrictions":"a", "items":[{"_id":"61aa5a298153980008823d23", "name":"Shrimp"},{"_id":"61aa5a298153980008823ef1", "name":"Noodles"}]}' -H "Content-Type: application/json" -X POST http://localhost:10001/orders
