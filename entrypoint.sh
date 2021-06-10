#!/bin/bash
set -e

# Remove pre-existing server.pid for Rails
rm -f /myapp/tmp/pids/server.pid 

# exec the container's main process (what is set as CMD in the Dockerfile)
exec "$@"