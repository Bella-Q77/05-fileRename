@echo off
chcp 65001 >nul
setlocal

cd /d "%~dp0"

where node >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误：未检测到 Node.js，请先安装 Node.js
    echo 下载地址：https://nodejs.org/
    pause
    exit /b 1
)

where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误：未检测到 npm，请先安装 Node.js
    echo 下载地址：https://nodejs.org/
    pause
    exit /b 1
)

if not exist node_modules (
    echo 正在安装依赖...
    npm install
    if %errorlevel% neq 0 (
        echo 依赖安装失败，请检查网络连接
        pause
        exit /b 1
    )
)

echo 正在启动文件重命名工具...
echo 启动后请在浏览器中访问：http://localhost:3000
echo.

npm start

pause