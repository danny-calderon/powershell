#!/bin/bash

cat /etc/passwd | cut -d':' -f1,3 --output-delimiter=';' | sort -t';' -k2 -n > users.txt