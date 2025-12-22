#!/usr/bin/env bash
set -e

# systemd 유닛 갱신 및 서비스 재시작
systemctl daemon-reload
systemctl enable myapp.service
systemctl restart myapp.service
