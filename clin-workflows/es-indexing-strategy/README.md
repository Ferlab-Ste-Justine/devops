# About

These scripts are to apply templates to provide good default settings to our elasticsearch indexes.

# List of templates

## base_template

### Overview

This template is applied by default. Is only specifies that an index should have 3 shards with each shard having 2 replicas.

### Usage

To apply the template to your ES cluster, type:

```
ES_URL=<url to your ES cluster> ./apply_base_template.sh
```

This should be done before any indexes are created.

### Rationale

On a a 3 nodes cluster, this should theoretically provides maximal writing performance (across all 3 nodes) and also provide optimum resiliency (each shard is replicated across all 3 nodes, which means up to 2 nodes can fail before you start losing data... though availability will still be impacted if 2 nodes are down)

If data resiliency becomes a less important concern later on (ie: once we have a robust backup strategy in place) and if disk write performance (or RAM) becomes a bottleneck, it may be worthwhile to just worry about high availability and keep a single replica for each shard.