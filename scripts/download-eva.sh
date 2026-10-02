#!/usr/bin/env bash
set -euo pipefail

rm -rf "eva/"

status=$(curl -s -o "eva-package.tar.gz" -w "%{http_code}" -X POST https://eva.despegar.design/ui/v1/cdn/packager -d @eva.manifest.json --header "Content-Type: application/json")

if [[ $status -ne 200 ]] ; then
    echo "-------------------------------"
    echo "An error occurred while downloading EVA UI CSS (HTTP $status). Response body from eva-package.tar.gz:"
    cat eva-package.tar.gz
    echo "--------------------------------"
else
    echo "--------"
    echo "Success!"
    echo "--------"
    tar -xvzf eva-package.tar.gz
fi

rm -rf eva-package.tar.gz
