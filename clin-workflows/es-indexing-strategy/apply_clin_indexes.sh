if [ -z "$ES_URL" ]; then
    echo "ES_URL environment variable is required, but not defined.";
    exit 1;
fi

curl -f -XPUT -H "Content-Type: application/json" "$ES_URL/patient" -d '
{
  "settings": {
    "number_of_shards": 5,
    "number_of_replicas": 2
  }
}
'

curl -f -XPUT -H "Content-Type: application/json" "$ES_URL/profile" -d '
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 2
  }
}
'

curl -f -XPUT -H "Content-Type: application/json" "$ES_URL/statement" -d '
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 2
  }
}
'

curl -f -XPUT -H "Content-Type: application/json" "$ES_URL/genes" -d '
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 2
  }
}
'

curl -f -XPUT -H "Content-Type: application/json" "$ES_URL/mutations" -d '
{
  "settings": {
    "number_of_shards": 2,
    "number_of_replicas": 2
  }
}
'