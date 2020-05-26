if [ -z "$ES_URL" ]; then
    echo "ES_URL environment variable is required, but not defined.";
    exit 1;
fi

curl -f -XPUT -H "Content-Type: application/json" "$ES_URL/_template/base_template" -d '
{
  "index_patterns": ["*"],
  "settings": {
    "number_of_shards": 3,
    "number_of_replicas": 2
  }
}
'