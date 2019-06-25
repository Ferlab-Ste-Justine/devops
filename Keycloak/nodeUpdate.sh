#!/usr/bin/env bash
docker node update --label-add db_role=postgresql workflow
docker node update --label-add node_role=devops workflow