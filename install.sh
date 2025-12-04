#!/bin/bash
set -e
set -u

# -----------------------------
# 配置区域
# -----------------------------
PACKAGES=(
  zsh
  shell
)

PREFIX="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}"
STOW_CMD=$(command -v stow || echo "")

if [ -z "$STOW_CMD" ]; then
  echo "Error: GNU Stow 未安装，请先安装 stow。"
  exit 1
fi

# -----------------------------
# 自动清理 stow 冲突文件的函数
# -----------------------------
clean_conflicts() {
  local package="$1"
  echo "检查 $package 的冲突文件..."

  # 使用 stow dry-run 检查冲突
  local conflicts=$(
    stow -n -v --dir="$PREFIX" --target="$TARGET" "$package" 2>&1 |
      grep "existing target" |
      awk -F': ' '{print $2}'
  )

  if [ -z "$conflicts" ]; then
    echo "  无冲突文件。"
    return
  fi

  echo "  发现冲突文件："
  for f in $conflicts; do
    local fullpath="$TARGET/$f"
    echo "    删除: $fullpath"
    rm -f "$fullpath"
  done
}

# -----------------------------
# 部署函数
# -----------------------------
deploy_package() {
  local package="$1"
  echo "正在部署 $package..."
  clean_conflicts "$package"
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
