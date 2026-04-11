# TaxMatch Pro 快速部署脚本 (PowerShell)
# 使用方法: .\deploy-simple.ps1

Write-Host "🚀 TaxMatch Pro 部署脚本" -ForegroundColor Cyan
Write-Host "==========================" -ForegroundColor Cyan

# 检查是否安装了 git
try {
    $gitVersion = git --version 2>$null
    Write-Host "✅ Git 已安装: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ 请先安装 Git: https://git-scm.com/download" -ForegroundColor Red
    exit 1
}

# 检查是否安装了 node
try {
    $nodeVersion = node --version 2>$null
    Write-Host "✅ Node.js 已安装: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ 请先安装 Node.js: https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# 询问 GitHub 用户名
Write-Host ""
$USERNAME = Read-Host "请输入你的 GitHub 用户名"

# 询问仓库名（默认 taxmatch-pro）
Write-Host ""
$REPO_NAME = Read-Host "请输入仓库名 (默认: taxmatch-pro)"
if ([string]::IsNullOrWhiteSpace($REPO_NAME)) {
    $REPO_NAME = "taxmatch-pro"
}

Write-Host ""
Write-Host "📦 步骤 1/5: 构建项目..." -ForegroundColor Yellow
npm run build

Write-Host ""
Write-Host "📁 步骤 2/5: 初始化 Git 仓库..." -ForegroundColor Yellow
git init
git add .
git commit -m "Initial commit"

Write-Host ""
Write-Host "🔗 步骤 3/5: 连接远程仓库..." -ForegroundColor Yellow
git branch -M main
git remote add origin "https://github.com/$USERNAME/$REPO_NAME.git"

Write-Host ""
Write-Host "📤 步骤 4/5: 推送代码到 GitHub..." -ForegroundColor Yellow
Write-Host "⚠️  如果提示输入密码，请使用 Personal Access Token" -ForegroundColor Magenta
git push -u origin main

Write-Host ""
Write-Host "✅ 步骤 5/5: 完成！" -ForegroundColor Green
Write-Host ""
Write-Host "🎉 代码已推送到 GitHub！" -ForegroundColor Green
Write-Host ""
Write-Host "下一步：" -ForegroundColor Cyan
Write-Host "1. 访问 https://github.com/$USERNAME/$REPO_NAME/settings/pages" -ForegroundColor White
Write-Host "2. 在 'Source' 部分选择 'GitHub Actions'" -ForegroundColor White
Write-Host "3. 等待几分钟，然后访问:" -ForegroundColor White
Write-Host "   https://$USERNAME.github.io/$REPO_NAME/" -ForegroundColor Yellow
Write-Host ""
