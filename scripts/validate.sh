#!/usr/bin/env bash
set -e

# 포트/엔드포인트 헬스체크
curl -fsS http://localhost:8080/actuator/health || {
  echo "Health check failed"
  exit 1
}
echo "Health check passed"
``

