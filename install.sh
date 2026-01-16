#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------
# 默认配置
# -----------------------------------------
DEFAULT_PREFIX="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_TARGET="$HOME"

DEFAULT_PACKAGES=(bash shell)

PREFIX="$DEFAULT_PREFIX"
TARGET="$DEFAULT_TARGET"
PACKAGES=()

# -----------------------------------------
# 帮助信息
# -----------------------------------------
usage() {
  cat <<EOF
用法: $(basename "$0") [选项] [packages...]

选项:
  --prefix PATH      dotfiles 根目录 (默认: 脚本目录)
  --target PATH      部署目标目录    (默认: \$HOME)
  -h, --help         显示帮助

示例:
  ./install.sh zsh shell
  ./install.sh --prefix ~/.dotfiles zsh
  ./install.sh --target /tmp/test
  ./install.sh   # 使用默认包: ${DEFAULT_PACKAGES[*]}
EOF
}

# -----------------------------------------
# 参数解析
# -----------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
  --prefix)
    PREFIX="$2"
    shift 2
    ;;
  --target)
    TARGET="$2"
    shift 2
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  -*)
    echo "未知选项: $1"
    usage
    exit 1
    ;;
  *)
    PACKAGES+=("$1")
    shift
    ;;
  esac
done

# -----------------------------------------
# 检查 stow
# -----------------------------------------
if ! command -v stow >/dev/null; then
  echo "❌ 未找到 stow，请安装后再运行"
  exit 1
fi

# -----------------------------------------
# 确定最终 packages
# -----------------------------------------
if [ ${#PACKAGES[@]} -gt 0 ]; then
  echo "📦 使用用户指定包: ${PACKAGES[*]}"
else
  if [ ${#DEFAULT_PACKAGES[@]} -gt 0 ]; then
    PACKAGES=("${DEFAULT_PACKAGES[@]}")
    echo "📦 未指定包，使用默认包: ${PACKAGES[*]}"
  else
    echo "📦 未指定包，且无默认包，自动扫描 $PREFIX ..."
    PACKAGES=($(find "$PREFIX" -mindepth 1 -maxdepth 1 -type d -printf "%f\n"))
  fi
fi

echo "📁 prefix = $PREFIX"
echo "📁 target = $TARGET"
echo

# -----------------------------------------
# 清理冲突
# -----------------------------------------
clean_conflicts() {
  local pkg="$1"
  echo "🔍 检查 $pkg 的冲突..."

  local conflicts=$(
    stow -n -v --dir="$PREFIX" --target="$TARGET" "$pkg" 2>&1 |
      grep -oP 'existing target \K\S+' || true
  )

  if [ -z "$conflicts" ]; then
    echo "  ✔ 无冲突文件"
    return
  fi

  echo "  ⚠ 将清理冲突:"
  for f in $conflicts; do
    local fullpath="$TARGET/$f"
    echo "    删除: $fullpath"
    if [[ -f "$fullpath" || -L "$fullpath" ]]; then
      rm -f "$fullpath"
    else
      echo "    ⚠ 跳过非普通文件: $fullpath"
    fi
  done
}

# -----------------------------------------
# 部署函数
# -----------------------------------------
deploy_package() {
  local pkg="$1"

  if [ ! -d "$PREFIX/$pkg" ]; then
    echo "❌ 包不存在: $pkg"
    return
  fi

  echo "🚀 部署: $pkg"
  clean_conflicts "$pkg"
  stow --dir="$PREFIX" --target="$TARGET" "$pkg"
  echo "  ✔ 完成: $pkg"
}

# -----------------------------------------
# 开始部署
# -----------------------------------------
echo "=============================="
echo "开始部署 dotfiles"
echo "=============================="

for pkg in "${PACKAGES[@]}"; do
  deploy_package "$pkg"
  echo
done

echo "✨ dotfiles 部署完成"
