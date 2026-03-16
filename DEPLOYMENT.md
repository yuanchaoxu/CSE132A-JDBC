# AYOTEE 网站部署指南（简单可落地）

本项目是纯静态网站（`index.html + styles.css + script.js`），部署非常简单。

## 方案 1（最简单，推荐新手）：Cloudflare Pages

### 步骤
1. 把当前仓库推送到 GitHub。
2. 登录 Cloudflare Dashboard → **Pages** → **Create a project**。
3. 连接 GitHub 仓库并选择本项目。
4. Build 配置：
   - Framework preset: **None**
   - Build command: （留空）
   - Build output directory: **/**（根目录）
5. 点击 Deploy，得到 `*.pages.dev` 域名。

### 优点
- 完全免费（基础版）
- 自动 HTTPS
- 每次 git push 自动部署

---

## 方案 2（同样简单）：Vercel

### 步骤
1. 登录 Vercel 并导入此 GitHub 仓库。
2. 框架选 `Other` / `No Framework`。
3. Build Command 留空，Output Directory 设为 `.`。
4. 部署完成后得到 `*.vercel.app`。

### 优点
- 操作简单
- 速度快
- 自带 HTTPS 与回滚

---

## 方案 3（你自己的服务器）：Nginx（生产可控）

适合你有云服务器（Ubuntu）并绑定自己域名。

### 1) 安装 Nginx
```bash
sudo apt update
sudo apt install -y nginx
```

### 2) 上传网站文件到服务器
把这 3 个文件上传到服务器目录（例如 `/var/www/ayotee`）：
- `index.html`
- `styles.css`
- `script.js`

### 3) Nginx 配置示例
创建 `/etc/nginx/sites-available/ayotee.conf`：

```nginx
server {
    listen 80;
    server_name your-domain.com www.your-domain.com;

    root /var/www/ayotee;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

启用并重载：

```bash
sudo ln -s /etc/nginx/sites-available/ayotee.conf /etc/nginx/sites-enabled/ayotee.conf
sudo nginx -t
sudo systemctl reload nginx
```

### 4) 配置 HTTPS（Let’s Encrypt）
```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com -d www.your-domain.com
```

---

## 一句话建议
- **如果你想最快上线：Cloudflare Pages。**
- **如果你要自定义服务器策略：Nginx + 域名 + HTTPS。**
