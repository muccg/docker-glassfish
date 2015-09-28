#!/bin/bash

function defaults {
    : ${GLASSFISH_BIN:="/usr/local/glassfish4/bin"}
}

function glassfish {
    # run in the background and deploy apps
    ${GLASSFISH_BIN}/asadmin start-domain
    for f in /data/*.war; do
        echo "Deploying $f ..."
        ${GLASSFISH_BIN}/asadmin -u admin deploy $f
    done
    ${GLASSFISH_BIN}/asadmin --host localhost --port 4848 enable-secure-admin
    ${GLASSFISH_BIN}/asadmin stop-domain

    # hack to run in the foreground
    ${GLASSFISH_BIN}/asadmin start-domain --verbose
}

defaults

# glassfish entrypoint
if [ "$1" = 'glassfish' ]; then
    echo "[Run] Starting glassfish"
    glassfish
    exit $?
fi

echo "[RUN]: Builtin command not provided [glassfish]"
echo "[RUN]: $@"

exec "$@"

