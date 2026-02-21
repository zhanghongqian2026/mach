# 数数字 1-100 游戏

在 20 分钟内按顺序从 1 点到 100。格子为长方形递归划分的 100 份，正确点击会逐步揭开一张奖励图片。

## 规则

- **左键**：按 1→100 顺序点击；点错计错误，错误超过 3 次游戏结束。
- **右键**：记录当前格子（最多 5 个），轮到该数字时自动视为已点击。
- **颜色**：已记录=橙色；已点击的格子会显示奖励图片对应区域。

## 本地运行

```bash
# 直接打开
open index.html

# 或本地起一个静态服务
python3 -m http.server 8000
# 访问 http://localhost:8000
```

## 部署到服务器

详见 **[DEPLOY.md](DEPLOY.md)**，支持：

- 自建服务器（Nginx / Apache）
- GitHub Pages / Vercel / Netlify
- Docker：`docker build -t count100 . && docker run -p 8080:80 count100`，访问 http://localhost:8080
