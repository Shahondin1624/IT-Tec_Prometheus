#!/bin/bash
if [ -d "github-exporter-arm64-rs" ]; then
    cd github-exporter-arm64-rs/
    git pull
else
    git clone https://github.com/Shahondin1624/github-exporter-arm64-rs.git &&
    cd github-exporter-arm64-rs/
fi
docker build -t github-exporter-arm64-rs . &&
cd ../ &&
cd IT-Tec_Prometheus/docker &&
sudo TOKEN="${1}" docker compose up -d #enter your github api-token here
