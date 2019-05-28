#!/usr/bin/env bash
docker node update --label-rm app_role dev-server-2
docker node update --label-rm app_role dev-server
docker node update --label-rm app_role dev-server-3
docker node update --label-rm app_role workflow

docker node update --label-add app_role=elasticsearch dev-server-2
docker node update --label-add app_role=elasticsearch dev-server-3
docker node update --label-add app_role=elasticsearch workflow
docker node update --label-add app_role=elasticsearch dev-server