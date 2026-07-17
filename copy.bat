@echo off
chcp 65001 >nul
set "source=C:\Users\suzhi\Desktop\xjr\MC\数据包\牌牌大作战\Cacardwar\cacardwar datapack"
set "dest=C:\Users\suzhi\Desktop\game\.minecraft\versions\1.21.11-Fabric 0.18.4\saves\CacardWarWolrd\datapacks"

echo 正在复制数据包，请稍候...
xcopy "%source%" "%dest%\cacardwar datapack\" /E /I /Y

if %errorlevel% equ 0 (
    echo 复制成功！
) else (
    echo 复制失败，请检查路径是否正确。
)
pause