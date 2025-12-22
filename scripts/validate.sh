#!/usr/bin/env bash
set -e
sleep 10
curl -fsS http://localhost:8080/health || exit 1
