# Class project for CSE 132A
## Database System Principles

---

## AYOTEE 公司官网预览说明

本仓库新增了一个静态官网页面：
- `index.html`
- `styles.css`
- `script.js`

如果你在预览时看到 `Not Found` 或页面空白，通常是因为**没有在仓库根目录启动静态服务器**。

### 正确预览方式

在仓库根目录执行：

```bash
cd /workspace/CSE132A-JDBC
python3 -m http.server 8000
```

然后在浏览器打开：

- `http://127.0.0.1:8000/`
- 或 `http://127.0.0.1:8000/index.html`

### 常见问题

1. **打开后显示 Not Found**
   - 检查是否在 `CSE132A-JDBC` 目录启动了服务。
   - 检查 URL 是否带端口 `:8000`。

2. **页面样式丢失**
   - 确认 `styles.css` 和 `script.js` 与 `index.html` 位于同一目录。

3. **端口被占用**
   - 可改用其他端口：

```bash
python3 -m http.server 8080
```

并访问 `http://127.0.0.1:8080/`。
