#!/usr/bin/env bash
set -euo pipefail

echo "[ValidateService] 시작"

# 서비스가 뜨는 시간 확보 (필요시 조절)
sleep 5

# 로컬 헬스 체크: Angular SPA는 별도 /health가 없을 수 있으니 index.html 체크
if curl -fsS http://localhost/ | grep -qi "<html"; then
  echo "[ValidateService] index 응답 OK"
else
  echo "[ValidateService] index 응답 실패"
  exit 1
fi

# 정적 자산도 간단히 확인 (옵션)
# curl -fsS http://localhost/assets/ | head -n 1 >/dev/null 2>&1 || true

echo "[ValidateService] 완료"

