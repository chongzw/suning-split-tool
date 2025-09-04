#!/bin/bash

echo "🐳 使用Docker构建Windows版本..."

# 检查Docker是否安装
if ! command -v docker &> /dev/null; then
    echo "❌ 错误：未找到Docker，请先安装Docker Desktop"
    exit 1
fi

# 创建输出目录
mkdir -p dist

echo "📦 构建Docker镜像..."
docker build -t wms-tool-windows .

if [ $? -eq 0 ]; then
    echo "✅ Docker镜像构建成功"
    
    echo "🚀 运行容器并提取exe文件..."
    docker run --name wms-temp -v "$(pwd)/dist:/output" wms-tool-windows cmd /c "copy dist\\苏宁对账单拆分工具.exe /output\\"
    
    if [ $? -eq 0 ]; then
        echo "✅ Windows版本构建成功！"
        echo "📁 文件位置：$(pwd)/dist/苏宁对账单拆分工具.exe"
        
        # 显示文件信息
        if [ -f "dist/苏宁对账单拆分工具.exe" ]; then
            echo "📊 文件大小：$(ls -lh dist/苏宁对账单拆分工具.exe | awk '{print $5}')"
        fi
    else
        echo "❌ 文件提取失败"
    fi
    
    # 清理临时容器
    docker rm wms-temp
else
    echo "❌ Docker镜像构建失败"
    exit 1
fi

echo "🎉 完成！"
