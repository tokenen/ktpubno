# 使用最小的基础镜像
FROM alpine:latest

# 安装 CA 证书（如果你的程序需要访问 HTTPS 外部 API）
RUN apk add --no-cache ca-certificates

# 设置工作目录
WORKDIR /app

# 复制二进制文件和配置文件
COPY kt .
# COPY config.yaml .

# 给二进制文件添加执行权限
RUN chmod +x kt

# 暴露端口（Render 要求，虽然实际端口是动态的）
EXPOSE 8080

# 运行程序
CMD ["./kt"]
