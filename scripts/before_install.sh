#!/usr/bin/env bash
set -e

# 예: 이전 배포 디렉터리 정리
rm -rf /var/www/myapp_tmp || true
mkdir -p /var/www/myapp_tmp

# 필요 시 의존성/도구 설치 (예: Node, Java, nginx 등)
# yum update -y
# yum install -y nginx

# 서비스 정리
systemctl stop myapp.service || true
