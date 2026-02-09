# 构建阶段
FROM node:18-alpine AS builder

WORKDIR /app

# 安装依赖
COPY package.json package-lock.json* yarn.lock* ./
RUN npm install

# 复制源码并构建
COPY . .
RUN npm run build

# 将 static 目录合并到 dist/static（构建产物只有 webpack 输出，需补充静态资源）
RUN cp -r static/* dist/static/ 2>/dev/null || true

# 运行阶段：使用 nginx 提供静态文件
FROM nginx:alpine

# 复制构建产物到 nginx 根目录
COPY --from=builder /app/dist /usr/share/nginx/html

# 使用默认配置即可（hash 路由无需 try_files）
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
