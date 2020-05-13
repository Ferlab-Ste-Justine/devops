#!/usr/bin/env bash
docker node update --label-add db_role=postgresql $(docker node ls -q)
docker node update --label-add node_role=devops $(docker node ls -q)
docker node update --label-add schedulable=true $(docker node ls -q)