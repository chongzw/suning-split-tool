# Windows版本打包说明

## 方法一：在Windows系统上直接打包（推荐）

### 1. 环境准备
- 安装Python 3.7或更高版本
- 确保Python已添加到系统PATH

### 2. 安装依赖
```bash
pip install pandas openpyxl tkinterdnd2 pyinstaller
```

### 3. 打包命令
```bash
pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" suning_split_gui.py
```

### 4. 使用批处理脚本（最简单）
直接双击运行 `build_windows.bat` 文件，脚本会自动完成所有步骤。

## 方法二：使用Docker跨平台打包

### 1. 创建Dockerfile
```dockerfile
FROM python:3.9-windowsservercore

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install pyinstaller

COPY suning_split_gui.py .

RUN pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" suning_split_gui.py

CMD ["cmd"]
```

### 2. 构建和运行
```bash
docker build -t wms-tool .
docker run -v ${PWD}/dist:/app/dist wms-tool
```

## 方法三：使用GitHub Actions自动打包

### 1. 创建 .github/workflows/build-windows.yml
```yaml
name: Build Windows Executable

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build:
    runs-on: windows-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: 3.9
    
    - name: Install dependencies
      run: |
        pip install -r requirements.txt
        pip install pyinstaller
    
    - name: Build executable
      run: |
        pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" suning_split_gui.py
    
    - name: Upload artifact
      uses: actions/upload-artifact@v2
      with:
        name: windows-executable
        path: dist/苏宁对账单拆分工具.exe
```

## 打包参数说明

- `--onefile`: 打包成单个exe文件
- `--windowed`: 不显示控制台窗口（GUI应用）
- `--name`: 指定输出文件名
- `--icon`: 指定图标文件（可选）
- `--add-data`: 添加额外文件（可选）

## 常见问题解决

### 1. 缺少tkinterdnd2
```bash
pip install tkinterdnd2
```

### 2. 打包后文件过大
使用以下参数减小文件大小：
```bash
pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" --exclude-module matplotlib --exclude-module numpy suning_split_gui.py
```

### 3. 杀毒软件误报
- 将exe文件添加到杀毒软件白名单
- 使用代码签名证书签名exe文件

## 分发说明

1. **单文件分发**：直接分发 `苏宁对账单拆分工具.exe`
2. **安装包制作**：使用NSIS或Inno Setup制作安装程序
3. **数字签名**：建议对exe文件进行数字签名以提高信任度

## 测试建议

1. 在干净的Windows系统上测试
2. 测试拖拽功能是否正常
3. 测试Excel文件读取和拆分功能
4. 测试不同版本的Windows系统兼容性
