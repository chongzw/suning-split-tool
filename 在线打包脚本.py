#!/usr/bin/env python3
"""
在线打包脚本 - 可以在任何支持Python的在线环境中运行
支持：Replit, Google Colab, GitHub Codespaces等
"""

import subprocess
import sys
import os

def install_dependencies():
    """安装必要的依赖包"""
    packages = [
        'pandas',
        'openpyxl', 
        'pyinstaller'
    ]
    
    print("📦 正在安装依赖包...")
    for package in packages:
        try:
            subprocess.check_call([sys.executable, '-m', 'pip', 'install', package])
            print(f"✅ {package} 安装成功")
        except subprocess.CalledProcessError:
            print(f"❌ {package} 安装失败")
            return False
    return True

def build_executable():
    """构建Windows可执行文件"""
    print("🔨 开始构建Windows可执行文件...")
    
    # PyInstaller命令
    cmd = [
        'pyinstaller',
        '--onefile',
        '--windowed', 
        '--name=苏宁对账单拆分工具',
        'suning_split_gui.py'
    ]
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode == 0:
            print("✅ 构建成功！")
            print("📁 可执行文件位置：dist/苏宁对账单拆分工具.exe")
            return True
        else:
            print("❌ 构建失败")
            print("错误信息：", result.stderr)
            return False
    except Exception as e:
        print(f"❌ 构建过程中出现错误：{e}")
        return False

def check_files():
    """检查必要文件是否存在"""
    required_files = ['suning_split_gui.py']
    missing_files = []
    
    for file in required_files:
        if not os.path.exists(file):
            missing_files.append(file)
    
    if missing_files:
        print(f"❌ 缺少必要文件：{', '.join(missing_files)}")
        return False
    
    print("✅ 所有必要文件都存在")
    return True

def main():
    """主函数"""
    print("🚀 苏宁对账单拆分工具 - 在线打包脚本")
    print("=" * 50)
    
    # 检查文件
    if not check_files():
        return
    
    # 安装依赖
    if not install_dependencies():
        return
    
    # 构建可执行文件
    if build_executable():
        print("\n🎉 打包完成！")
        print("📋 使用说明：")
        print("1. 在 dist/ 目录下找到 '苏宁对账单拆分工具.exe'")
        print("2. 下载到Windows电脑")
        print("3. 双击运行即可使用")
        
        # 显示文件信息
        exe_path = "dist/苏宁对账单拆分工具.exe"
        if os.path.exists(exe_path):
            size = os.path.getsize(exe_path)
            size_mb = size / (1024 * 1024)
            print(f"📊 文件大小：{size_mb:.1f} MB")
    else:
        print("\n❌ 打包失败，请检查错误信息")

if __name__ == "__main__":
    main()
