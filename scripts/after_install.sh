#!/usr/bin/env bash
set -euo pipefail

echo "[AfterInstall] 시작"

# Nginx 서버 블록 구성
NGINX_CONF_PATH="/etc/nginx/conf.d/myapp.conf"
WEB_ROOT="/var/www/myapp"

sudo bash -c "cat > ${NGINX_CONF_PATH}" <<'EOF'
server {
    listen       80;
    server_name  _;

    root   /var/www/myapp;
    index  index.html;

    # Angular SPA: 존재하지 않는 경로는 index.html로 fallback
    location / {
        try_files $uri $uri/ /index.html;
    }

    # 정적 파일 캐시 (필요 시 조절)
    location ~* \.(?:css|js|jpg|jpeg|gif|png|svg|ico|woff|woff2)$ {
        expires 7d;
        add_header Cache-Control "public, max-age=604800";
        try_files $uri =404;
    }

    # 에러 페이지 기본
    error_page 404 /index.html;
}
EOF

# 권한 정리
if id nginx >/dev/null 2>&1; then
  sudo chown -R nginx:nginx "${WEB_ROOT}"
else
  sudo chown -R ec2-user:ec2-user "${WEB_ROOT}"
fi
sudo chmod -R 755 "${WEB_ROOT}"

# Nginx 설정 검증
sudo nginx -t

echo "[AfterInstall] 완료"
``
