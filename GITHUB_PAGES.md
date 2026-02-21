# 部署到 GitHub 并让用户在线玩

按下面 3 步完成部署后，用户可通过 **https://zhanghongqian2026.github.io/mach/** 直接玩游戏。

## 1. 在 GitHub 上新建仓库

1. 打开 [https://github.com/new](https://github.com/new)
2. **Repository name** 填：`mach`
3. 选择 **Public**
4. **不要**勾选 “Add a README file” 或 “Add .gitignore”
5. 点击 **Create repository**

## 2. 推送代码

在项目目录执行（本机已配置 SSH，直接执行即可）：

```bash
cd /Users/zhanghongqian/Desktop/mach
git push -u origin main
```

## 3. 开启 GitHub Pages

1. 打开仓库页面：**https://github.com/zhanghongqian2026/mach**
2. 点击 **Settings** → 左侧 **Pages**
3. **Source** 选 **Deploy from a branch**
4. **Branch** 选 `main`，文件夹选 **/ (root)**，点 **Save**
5. 等待 1～2 分钟，页面会显示绿色提示：*Your site is live at https://zhanghongqian2026.github.io/mach/*

完成后，把 **https://zhanghongqian2026.github.io/mach/** 发给用户即可在线玩。
