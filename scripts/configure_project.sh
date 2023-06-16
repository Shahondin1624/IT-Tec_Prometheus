#!/bin/bash
git clone https://github.com/Shahondin1624/github-exporter-arm64-rs.git &&
cd github-exporter-arm64-rs/ &&
docker build -t github-exporter-arm64 . && 
cd .. &&
cd ../docker &&
sudo TOKEN="${1}" docker compose up -d #enter your github api-token here
