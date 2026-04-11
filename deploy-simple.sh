#!/bin/bash

# TaxMatch Pro 快速部署脚本
# 使用方法: ./deploy-simple.sh

echo "🚀 TaxMatch Pro 部署脚本"
echo "=========================="

# 检查是否安装了 git
if ! command -v git &> /dev/null; then
    echo "❌ 请先安装 Git: https://git-scm.com/download"
    exit 1
fi

# 检查是否安装了 node
if ! command -v node &> /dev/null; then
    echo "❌ 请先安装 Node.js: https://nodejs.org/"
    exit 1
fi

# 询问 GitHub 用户名
echo ""
read -p "请输入你的 GitHub 用户名: " USERNAME

# 询问仓库名（默认 taxmatch-pro）
echo ""
read -p "请输入仓库名 (默认: taxmatch-pro): " REPO_NAME
REPO_NAME=${REPO_NAME:-taxmatch-pro}

echo ""
echo "📦 步骤 1/5: 构建项目..."
npm run build

echo ""
echo "📁 步骤 2/5: 初始化 Git 仓库..."
git init
git add .
git commit -m "Initial commit"

echo ""
echo "🔗 步骤 3/5: 连接远程仓库..."
git branch -M main
git remote add origin "https://github.com/$USERNAME/$REPO_NAME.git"

echo ""
echo "📤 步骤 4/5: 推送代码到 GitHub..."
echo "⚠️  如果提示输入密码，请使用 Personal Access Token"
git push -u origin main

echo ""
echo "✅ 步骤 5/5: 完成！"
echo ""
echo "🎉 代码已推送到 GitHub！"
echo ""
echo "下一步："
echo "1. 访问 https://github.com/$USERNAME/$REPO_NAME/settings/pages"
echo "2. 在 'Source' 部分选择 'GitHub Actions'"
echo "3. 等待几分钟，然后访问:"
echo "   https://$USERNAME.github.io/$REPO_NAME/"
echo ""
