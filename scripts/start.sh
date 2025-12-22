#!/usr/bin/env bash
set -euo pipefail

echo "[ApplicationStart] 시작"

# Nginx 시작/재시작
sudo systemctl enable nginx
sudo systemctl restart nginx

# 방화벽/보안 그룹에서 80 포트 오픈되어 있어야 외부 접근 가능
# 내부 헬스체크는 validate.sh에서 수행

echo "[ApplicationStart] 완료"
