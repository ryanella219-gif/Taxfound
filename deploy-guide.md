# TaxMatch Pro 网站部署指南

## 方案一：GitHub Pages（推荐，免费且稳定）

### 步骤：

1. **创建 GitHub 仓库**
   - 访问 https://github.com/new
   - 输入仓库名：`taxmatch-pro`
   - 选择 "Public"（公开）
   - 点击 "Create repository"

2. **上传代码**
   ```bash
   # 在项目根目录执行
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/你的用户名/taxmatch-pro.git
   git push -u origin main
   ```

3. **启用 GitHub Pages**
   - 进入仓库 → Settings → Pages
   - Source 选择 "Deploy from a branch"
   - Branch 选择 "main"，文件夹选择 "/ (root)"
   - 点击 Save
   - 等待几分钟，访问 `https://你的用户名.github.io/taxmatch-pro/`

---

## 方案二：Vercel（推荐，自动部署）

### 步骤：

1. **注册/登录 Vercel**
   - 访问 https://vercel.com
   - 用 GitHub 账号登录

2. **导入项目**
   - 点击 "Add New Project"
   - 选择你的 GitHub 仓库
   - Framework Preset 选择 "Vite"
   - 点击 Deploy

3. **自动部署**
   - 每次推送到 GitHub 会自动重新部署
   - 获得自定义域名如 `https://taxmatch-pro.vercel.app`

---

## 方案三：Netlify（拖拽部署，最简单）

### 步骤：

1. **准备构建文件**
   - 确保 `dist` 文件夹已生成（运行 `npm run build`）

2. **拖拽部署**
   - 访问 https://app.netlify.com/drop
   - 将 `dist` 文件夹拖拽到页面上
   - 立即获得随机域名，如 `https://abc123.netlify.app`

---

## 方案四：Cloudflare Pages

### 步骤：

1. **注册 Cloudflare**
   - 访问 https://dash.cloudflare.com

2. **创建 Pages 项目**
   - 点击 "Pages" → "Create a project"
   - 连接 GitHub 仓库或上传构建文件
   - 构建命令：`npm run build`
   - 输出目录：`dist`

---

## 当前构建状态

✅ 项目已成功构建
- 构建输出：`dist/` 文件夹
- 入口文件：`dist/index.html`
- 静态资源：`dist/assets/`

你可以直接将 `dist` 文件夹上传到任何静态托管服务。

---

## 推荐的托管平台对比

| 平台 | 免费额度 | 自定义域名 | 自动部署 | 难度 |
|------|---------|-----------|---------|------|
| GitHub Pages | 无限 | ✅ | 需配置 | ⭐⭐ |
| Vercel | 无限 | ✅ | ✅ | ⭐⭐ |
| Netlify | 100GB/月 | ✅ | ✅ | ⭐ |
| Cloudflare Pages | 无限 | ✅ | ✅ | ⭐⭐⭐ |

---

## 需要帮助？

如果你需要我帮你完成具体的部署步骤，请告诉我：
1. 你想使用哪个平台？
2. 你是否有该平台的账号？
