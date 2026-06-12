FROM python:3.11-slim

WORKDIR /app

# 设置环境变量
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# 安装依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt flask flask-cors

# 复制所有应用文件
COPY app.py main.py config.py login.py course.py api_handlers.py ./
COPY index.html ./

# 暴露端口
EXPOSE 3000

# 启动命令
CMD ["python3", "app.py"]
