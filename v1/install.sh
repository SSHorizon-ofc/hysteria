#!/bin/bash
set -euo pipefail

arch=$(uname -m)
echo "🔍 Arquitetura detectada: $arch"

case "$arch" in
  x86_64|amd64)
    goarch="amd64"
    ;;
  i386|i686)
    goarch="386"
    ;;
  armv7l|armv6l)
    goarch="arm"
    ;;
  aarch64|arm64)
    goarch="arm64"
    ;;
  riscv64)
    goarch="riscv64"
    ;;
  *)
    echo "❌ Arquitetura '$arch' não suportada."
    exit 1
    ;;
esac

base_url="https://github.com/SSHorizon-ofc/hysteria/raw/refs/heads/main/v1"

dest_hysteria="./hysteria"
echo "⬇️ Baixando Hysteria para $goarch..."
curl -L -o "$dest_hysteria" "$base_url/hysteria-$goarch"
chmod +x "$dest_hysteria"
echo "✅ Hysteria baixado em $(pwd)/hysteria"

mkdir -p /etc/hysteria
dest_auth="/etc/hysteria/auth"
echo "⬇️ Baixando Auth para $goarch..."
curl -L -o "$dest_auth" "$base_url/auth-$goarch"
chmod +x "$dest_auth"
echo "✅ Auth instalado em $dest_auth"

echo "👉 Executando Hysteria..."
"$dest_hysteria" instalar