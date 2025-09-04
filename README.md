# 苏宁对账单拆分工具

一个用于拆分苏宁对账单的Python工具，支持按司机名称自动拆分Excel文件。

## 功能特点

- 🖱️ 支持拖拽Excel文件
- 👥 按司机名称自动拆分
- 📊 自动计算每个司机的总金额
- 🎨 美化Excel输出格式
- 💻 支持Windows和macOS

## 快速开始

### 方法一：直接运行Python脚本
```bash
python suning_split_gui.py
```

### 方法二：打包成可执行文件

#### Windows版本
```bash
# 安装依赖
pip install pandas openpyxl tkinterdnd2 pyinstaller

# 打包
pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" suning_split_gui.py
```

#### macOS版本
```bash
# 安装依赖
pip install pandas openpyxl tkinterdnd2 pyinstaller

# 打包
pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" suning_split_gui.py
```

## 在线打包方案

### 使用Replit
1. 访问 [Replit](https://replit.com)
2. 创建新的Python项目
3. 上传所有文件
4. 运行 `在线打包脚本.py`

### 使用Google Colab
1. 访问 [Google Colab](https://colab.research.google.com)
2. 上传文件到Google Drive
3. 在Colab中运行打包脚本

### 使用GitHub Codespaces
1. 将代码推送到GitHub
2. 创建Codespace
3. 运行打包命令

## 文件说明

- `suning_split_gui.py` - 主程序文件
- `requirements.txt` - Python依赖列表
- `在线打包脚本.py` - 在线环境打包脚本
- `build_windows.bat` - Windows批处理打包脚本
- `build_windows_docker.sh` - Docker打包脚本（需要Docker）
- `简单Windows打包指南.md` - 详细打包说明

## 使用方法

1. 运行程序
2. 拖拽或选择苏宁对账单Excel文件
3. 点击"核对金额"查看总金额
4. 点击"拆分文件"按司机拆分
5. 在"拆分结果"文件夹中查看输出文件

## 系统要求

- Python 3.7+
- pandas
- openpyxl
- tkinterdnd2 (可选，用于拖拽功能)

## 注意事项

- 确保Excel文件包含"司机名称"和"总金额"列
- 支持.xlsx和.xls格式
- 拆分结果会保存在原文件同目录下的"拆分结果"文件夹中

## 故障排除

### 拖拽功能不工作
```bash
pip install tkinterdnd2
```

### 打包后文件过大
```bash
pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" --exclude-module matplotlib --exclude-module numpy suning_split_gui.py
```

### 杀毒软件误报
将exe文件添加到杀毒软件白名单

## 许可证

MIT License
