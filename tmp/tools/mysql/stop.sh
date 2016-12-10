#!/usr/bin/env bash
PID=$(pgrep mysqld)

kill -s TERM "${PID}"

while kill -0 "${PID}" 2> /dev/null;
do
    sleep 1;
done;