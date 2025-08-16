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

url="https://github.com/SSHorizon-ofc/hysteria/raw/refs/heads/main/v1/hysteria-$goarch"
dest="./hysteria"

echo "⬇️ Baixando binário para $goarch..."
curl -L -o "$dest" "$url"

chmod +x "$dest"

echo "✅ Hysteria baixado em $(pwd)/hysteria"
echo "👉 Executando agora..."
./hysteria instalar