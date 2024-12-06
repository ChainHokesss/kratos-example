#!/bin/sh

set -e

echo "Start service"
exec kratos serve -c /etc/config/kratos/kratos.yml --dev --watch-courier
