@echo off
echo 正在为Windows系统打包苏宁对账单拆分工具...
echo.

REM 检查Python是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo 错误：未找到Python，请先安装Python 3.7+
    pause
    exit /b 1
)

REM 检查PyInstaller是否安装
python -c "import PyInstaller" >nul 2>&1
if errorlevel 1 (
    echo 正在安装PyInstaller...
    pip install pyinstaller
)

REM 安装其他依赖
echo 正在安装依赖包...
pip install pandas openpyxl tkinterdnd2

REM 创建Windows版本的spec文件
echo 正在创建Windows打包配置...
python -c "
import os
spec_content = '''# -*- mode: python ; coding: utf-8 -*-

block_cipher = None

a = Analysis(
    ['suning_split_gui.py'],
    pathex=[],
    binaries=[],
    datas=[],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='苏宁对账单拆分工具',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=None,
)
'''
with open('suning_split_windows.spec', 'w', encoding='utf-8') as f:
    f.write(spec_content)
print('Windows spec文件创建完成')
"

REM 使用PyInstaller打包
echo 正在打包Windows版本...
pyinstaller suning_split_windows.spec

if exist "dist\苏宁对账单拆分工具.exe" (
    echo.
    echo ✅ Windows版本打包成功！
    echo 可执行文件位置：dist\苏宁对账单拆分工具.exe
    echo.
    echo 文件信息：
    dir "dist\苏宁对账单拆分工具.exe"
) else (
    echo ❌ 打包失败，请检查错误信息
)

echo.
echo 按任意键退出...
pause >nul
