# 部署说明

本游戏是**纯静态前端**（仅 HTML/CSS/JS），无需数据库或后端，部署方式任选其一即可。

---

## 方式一：放到自己的服务器（Nginx / Apache）

### 1. 上传文件

将整个项目目录上传到服务器，例如：

```bash
scp -r index.html README.md 用户@你的服务器:/var/www/count100/
```

若使用本地奖励图片，一并上传 `reward.jpg` 等，并在 `index.html` 里把 `REWARD_IMAGE_URL` 改为 `'reward.jpg'`。

### 2. Nginx 配置示例

在 `/etc/nginx/sites-available/` 下新建站点配置（或修改已有配置）：

```nginx
server {
    listen 80;
    server_name 你的域名或IP;
    root /var/www/count100;
    index index.html;
    location / {
        try_files $uri $uri/ /index.html;
    }
    location ~* \.(html|css|js|jpg|png|gif|ico)$ {
        expires 7d;
        add_header Cache-Control "public, immutable";
    }
}
```

然后启用并重载 Nginx：

```bash
sudo ln -s /etc/nginx/sites-available/count100.conf /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

### 3. Apache 配置示例

将项目放到站点目录（如 `/var/www/html/count100/`），确保目录下有 `index.html`。若需支持直接访问根路径，可添加：

```apache
<Directory /var/www/html/count100>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
    DirectoryIndex index.html
</Directory>
```

---

## 方式二：GitHub Pages（免费）

1. 在 GitHub 新建仓库，将 `index.html`、`README.md` 等推送到仓库。
2. 仓库 **Settings → Pages**：
   - Source 选 **Deploy from a branch**
   - Branch 选 `main`（或你用的分支），目录选 **/ (root)**
3. 保存后等待一两分钟，访问 `https://你的用户名.github.io/仓库名/` 即可。

注意：若仓库名为 `用户名.github.io`，则访问 `https://用户名.github.io/`。

---

## 方式三：Vercel（免费）

1. 打开 [vercel.com](https://vercel.com)，用 GitHub 登录。
2. **Add New → Project**，导入存放本游戏的仓库（或本机用 Vercel CLI 上传）。
3. 保持默认（框架选 Other，构建命令留空），直接 **Deploy**。
4. 部署完成后会得到一个 `xxx.vercel.app` 的地址。

---

## 方式四：Netlify（免费）

1. 打开 [netlify.com](https://netlify.com)，注册/登录。
2. **Add new site → Deploy manually**：把包含 `index.html` 的文件夹拖拽上传。
3. 或 **Import from Git** 连接仓库后自动部署。
4. 部署完成后会得到 `xxx.netlify.app` 的地址。

---

## 方式五：Docker

项目根目录已包含 `Dockerfile`，可在任意支持 Docker 的服务器上运行：

```bash
cd 项目目录
docker build -t count100 .
docker run -d -p 80:80 --name count100 count100
```

访问 `http://服务器IP` 即可。若改用其他端口（如 8080）：`docker run -d -p 8080:80 ...`，访问 `http://服务器IP:8080`。

---

## 部署后建议

- **HTTPS**：若用自己域名，建议在 Nginx/Apache 配置 SSL（如 Let’s Encrypt），或使用 Vercel/Netlify 自带的 HTTPS。
- **奖励图片**：默认使用 Unsplash 外链。若希望不依赖外网或加载更快，可在项目目录放一张 `reward.jpg`，并把 `index.html` 里的 `REWARD_IMAGE_URL` 改为 `'reward.jpg'`（或相对路径）。
- **成绩记录**：当前成绩存在浏览器本地（localStorage），换设备或清缓存会清空，无需服务器存储。
