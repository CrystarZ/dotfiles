#!/bin/bash
set -e
set -u

# -----------------------------
# 配置区域
# -----------------------------
# 要部署的模块列表
PACKAGES=(
  zsh
  shell
)
PREFIX="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}"
STOW_CMD=$(command -v stow || echo "")

# 检查 stow 是否安装
if [ -z "$STOW_CMD" ]; then
  echo "Error: GNU Stow 未安装，请先安装 stow。"
  exit 1
fi

# -----------------------------
# 函数定义
# -----------------------------
deploy_package() {
  local package="$1"
  echo "正在部署 $package..."
  stow --dir="$PREFIX" --target="$TARGET" "$package"
}

# -----------------------------
# 执行部署
# -----------------------------
echo "开始部署 dotfiles..."
cd "$PREFIX"

for pkg in "${PACKAGES[@]}"; do
  deploy_package "$pkg"
done

echo "dotfiles 部署完成 ✅"
