#!/bin/bash
USER_ID=${LOCAL_USER_ID:-$CONTAINERMANN_USER_ID}
GROUP_ID=${LOCAL_GROUP_ID:-$CONTAINERMANN_GROUP_ID}
echo "Currently running with as "$(id)". Creating user "${CONTAINERMANN_USER}" with UID: ${USER_ID}, GID ${GROUP_ID}";
useradd --create-home --shell /bin/bash --uid ${USER_ID} --gid ${GROUP_ID} "${CONTAINERMANN_USER}" --non-unique --groups users;

chown ${USER_ID}:${GROUP_ID} /data;

if [ $# -gt 0 ]; then
    exec /usr/local/bin/gosu ${CONTAINERMANN_USER} "$@"
else
    exec /usr/local/bin/gosu ${CONTAINERMANN_USER} /bin/bash -i
fi
