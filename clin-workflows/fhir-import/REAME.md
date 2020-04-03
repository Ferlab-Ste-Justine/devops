# About

This workflow is used to populate our aidbox system with our dummy data and our elasticsearch database with our aidbox data.

# Dependencies

You need to have the following stacks running:

1. Aidbox: https://github.com/cr-ste-justine/devops/tree/dev/aidbox
2. Elasticsearch: https://github.com/cr-ste-justine/devops/tree/dev/ES

# Usage

## Config

The **config.sh** contain variables used by the other scripts. Edit it for your environment.

## Update Aidbox

To populate aidbox with the dummy data, run:

```
./update_aidbox.sh;
```

## Update Elasticsearch

To populate elasticsearch with the aidbox data, run:

```
./update_elasticsearch.sh;
```