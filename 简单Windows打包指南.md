# 简单Windows打包指南

## 🎯 最推荐方案：在Windows电脑上直接打包

### 步骤1：准备Windows电脑
- 任何Windows 10/11电脑
- 安装Python 3.7+（从python.org下载）

### 步骤2：传输文件到Windows电脑
将以下文件复制到Windows电脑：
- `suning_split_gui.py`
- `requirements.txt`

### 步骤3：在Windows上安装依赖
打开命令提示符（cmd），运行：
```cmd
pip install pandas openpyxl tkinterdnd2 pyinstaller
```

### 步骤4：打包成exe
```cmd
pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" suning_split_gui.py
```

### 步骤5：找到生成的exe文件
exe文件位置：`dist\苏宁对账单拆分工具.exe`

## 🌐 方案二：使用在线Python环境

### 使用Replit在线打包
1. 访问 https://replit.com
2. 创建新项目，选择Python
3. 上传您的Python文件
4. 在终端运行打包命令
5. 下载生成的exe文件

### 使用Google Colab
1. 访问 https://colab.research.google.com
2. 上传文件到Google Drive
3. 在Colab中运行打包代码
4. 下载生成的exe文件

## 📱 方案三：使用GitHub Codespaces

1. 将代码推送到GitHub仓库
2. 在GitHub上创建Codespace
3. 选择Windows环境
4. 运行打包命令
5. 下载生成的exe文件

## 🔧 方案四：使用虚拟机

### 在macOS上安装Windows虚拟机
1. 安装Parallels Desktop或VMware Fusion
2. 安装Windows 10/11
3. 在虚拟机中安装Python
4. 运行打包命令

## ⚡ 快速命令（复制粘贴即可）

```cmd
# 安装依赖
pip install pandas openpyxl tkinterdnd2 pyinstaller

# 打包命令
pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" suning_split_gui.py

# 查看结果
dir dist
```

## 🎁 打包参数说明

- `--onefile`: 生成单个exe文件
- `--windowed`: 不显示命令行窗口
- `--name`: 指定exe文件名
- `--icon=icon.ico`: 添加图标（可选）

## 📦 分发说明

生成的exe文件可以：
- 直接分发给其他Windows用户
- 无需安装Python环境
- 支持拖拽Excel文件
- 自动创建拆分结果文件夹

## 🐛 常见问题

### Q: 杀毒软件报毒怎么办？
A: 这是正常现象，将exe文件添加到白名单即可

### Q: exe文件太大怎么办？
A: 使用以下命令减小文件大小：
```cmd
pyinstaller --onefile --windowed --name="苏宁对账单拆分工具" --exclude-module matplotlib --exclude-module numpy suning_split_gui.py
```

### Q: 拖拽功能不工作？
A: 确保安装了tkinterdnd2库：
```cmd
pip install tkinterdnd2
```
