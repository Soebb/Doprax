#!/bin/bash
export CPPFLAGS=-I/usr/include/python3.10
git clone $REPO_URL ok && cd ok && pip3 install -U -r requirements.txt
$START_CMD
