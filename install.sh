#!/bin/bash

cat <<EOF >fast_deilabs.service
[Unit]
Description=Fast DEILabs automatic login service

[Service]
ExecStart=/usr/local/bin/fast_deilabsd
Restart=on-failure
User=$USER
KillMode=process
KillSignal=SIGKILL

[Install]
WantedBy=multi-user.target
EOF

sudo ./.installAsSu.sh "$@"
