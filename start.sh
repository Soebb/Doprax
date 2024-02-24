#!/bin/bash
find / -iname 'Python.h'
git clone $REPO_URL ok && cd ok && pip3 install -U -r requirements.txt
$START_CMD
