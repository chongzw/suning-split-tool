# 使用Windows Server Core作为基础镜像
FROM python:3.9-windowsservercore

# 设置工作目录
WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 安装Python依赖
RUN pip install -r requirements.txt
RUN pip install pyinstaller

# 复制源代码
COPY suning_split_gui.py .

# 打包成Windows exe
RUN pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" suning_split_gui.py

# 设置默认命令
CMD ["cmd"]
