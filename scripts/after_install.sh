#!/usr/bin/env bash
set -e

# 배포 경로 준비
mkdir -p /var/www/myapp
chown -R ec2-user:ec2-user /var/www/myapp

# 환경 변수/설정 파일 배치
# cp /opt/configs/myapp.env /var/www/myapp/.env

# 권한 설정
chmod -R 755 /var/www/myapp
