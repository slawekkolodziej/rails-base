#!/bin/bash
set -e

# Store env variables for simple use with cron
env > /etc/environment

exec "$@"
