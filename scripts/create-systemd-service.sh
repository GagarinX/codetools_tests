#!/bin/bash

SERVICE_FILE="/etc/systemd/system/bottles.service"

cat <<EOF > $SERVICE_FILE
[Unit]
Description=Bottles Service
After=network.target

[Service]
ExecStart=/opt/bottles
WorkingDirectory=/opt
Restart=always
RestartSec=10
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable bottles.service
