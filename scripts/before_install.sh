#!/usr/bin/env bash
set -euo pipefail

echo "[BeforeInstall] 시작"

# Nginx 설치 여부 확인 및 설치 (Amazon Linux 2)
if ! rpm -q nginx >/dev/null 2>&1; then
  echo "[BeforeInstall] nginx 설치"
  sudo yum -y install nginx
fi

# 웹 루트 준비
sudo mkdir -p /var/www/myapp
sudo chown -R nginx:nginx /var/www/myapp || sudo chown -R ec2-user:ec2-user /var/www/myapp

# 기존 배포물 백업(Optional)
if [ -d "/var/www/myapp" ]; then
  sudo mkdir -p /var/www/backup
  timestamp=$(date +"%Y%m%d%H%M%S")
  sudo tar czf /var/www/backup/myapp_${timestamp}.tar.gz -C /var/www myapp || true
  echo "[BeforeInstall] 기존 배포물 백업 완료: /var/www/backup/myapp_${timestamp}.tar.gz"
fi

# Nginx 중지(파일 교체 중 충돌 방지)
sudo systemctl stop nginx || true

echo "[BeforeInstall] 완료"

