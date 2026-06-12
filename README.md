# DockerAutoBaomiGuan - 保密观自动刷课 Docker 版

[![Docker Pulls](https://img.shields.io/docker/pulls/guifengxiaoyan/autobaomiguan.svg)](https://hub.docker.com/r/guifengxiaoyan/autobaomiguan)
[![Docker Image Size](https://img.shields.io/docker/image-size/guifengxiaoyan/autobaomiguan/latest)](https://hub.docker.com/r/guifengxiaoyan/autobaomiguan)

## 项目介绍

本项目是 [AutoBaomiGuan](https://github.com/vay1314/AutoBaomiGuan) 的 Docker 容器化版本，提供 Web 界面，支持多账号管理和自动刷课考试。

## 快速开始

### 1. 使用 Docker Hub 镜像（推荐）

```bash
docker run -d \
  -p 3000:3000 \
  -v $(pwd)/credentials.json:/app/credentials.json \
  --name autobaomiguan \
  --restart unless-stopped \
  guifengxiaoyan/autobaomiguan:latest
```

### 2. 使用 docker-compose

创建 `docker-compose.yml` 文件：

```yaml
version: '3.8'

services:
  autobaomiguan:
    image: guifengxiaoyan/autobaomiguan:latest
    container_name: autobaomiguan
    ports:
      - "3000:3000"
    volumes:
      - ./credentials.json:/app/credentials.json
    restart: unless-stopped
    environment:
      - TZ=Asia/Shanghai
```

运行：
```bash
docker-compose up -d
```

### 3. 自行构建镜像

```bash
git clone https://github.com/guifengxiaoyan/DockerAutoBaomiGuan.git
cd DockerAutoBaomiGuan

docker build -t autobaomiguan .
docker run -d -p 3000:3000 --name autobaomiguan autobaomiguan
```

## 使用方法

1. **访问 Web 界面**
   - 打开浏览器访问 http://localhost:3000
   - 输入保密观账号密码登录

2. **开始学习**
   - 点击"开始学习和考试"按钮
   - 系统自动完成所有课程和考试

3. **查看日志**
   ```bash
   docker logs -f autobaomiguan
   ```

4. **持久化凭证**
   - 凭证文件会保存在挂载的 `credentials.json` 中
   - 下次启动无需重新登录

## 常用命令

```bash
# 启动容器
docker-compose up -d

# 查看日志
docker logs -f autobaomiguan

# 停止容器
docker-compose down

# 重启容器
docker-compose restart

# 更新镜像
docker pull guifengxiaoyan/autobaomiguan:latest
docker-compose down
docker-compose up -d
```

## 环境变量

| 变量 | 说明 | 默认值 |
|------|------|--------|
| TZ | 时区设置 | Asia/Shanghai |

## 端口说明

- **3000**: Web 界面访问端口

## 数据持久化

建议挂载以下文件/目录：

- `credentials.json` - 账号凭证（可选，建议挂载以保存登录状态）

## 安全建议

1. 不要在公共网络暴露 3000 端口
2. 使用反向代理（如 Nginx）并配置 HTTPS
3. 定期更新镜像获取最新的安全补丁

## 故障排查

### 容器无法启动

```bash
# 查看容器日志
docker logs autobaomiguan

# 检查容器状态
docker ps -a | grep autobaomiguan
```

### 无法访问 Web 界面

1. 确认容器正在运行：`docker ps`
2. 确认端口映射正确：`docker port autobaomiguan`
3. 检查防火墙是否阻止 3000 端口

### 凭证丢失

确保挂载了 credentials.json 文件：
```bash
docker run -v $(pwd)/credentials.json:/app/credentials.json ...
```

## 技术栈

- Python 3.11
- Flask (Web 框架)
- Docker (容器化)

## 相关项目

- 源代码仓库：https://github.com/guifengxiaoyan/WEBAutoBaomiGuan
- 原始项目：https://github.com/vay1314/AutoBaomiGuan

## 注意事项

- 本工具仅供学习交流使用
- 请使用合法合规的账号
- 请勿滥用工具影响平台正常运营

## License

MIT License
