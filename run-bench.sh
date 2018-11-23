#!/bin/bash
docker run --rm -v /mnt/testdb:/testdb merapar/sqlite-bench --raw=0 --num=1000000 --db=/testdb/  --value_size=1000