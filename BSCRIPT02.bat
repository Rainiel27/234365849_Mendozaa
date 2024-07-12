@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" goto circle
if "%choice%"=="2" goto triangle
if "%choice%"=="3" goto quadrilateral
echo Invalid choice. Please try again.
goto menu

:circle
set /p radius="Enter the radius of the circle: "
set /a area=31416*%radius%*%radius%/10000
echo The area of the circle is: %area%
goto end

:triangle
set /p a="Enter the length of side a: "
set /p b="Enter the length of side b: "
set /p c="Enter the length of side c: "
set /a s=(%a%+%b%+%c%)/2
set /a area=!s! * (!s!-%a%) * (!s!-%b%) * (!s!-%c%)
set /a area=%area:~-0,4%
echo The area of the triangle is: %area%

if "%a%"=="%b%" if "%b%"=="%c%" (
    echo The triangle is equilateral.
) else if "%a%"=="%b%" if not "%b%"=="%c%" (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)
goto end

:quadrilateral
set /p length="Enter the length: "
set /p width="Enter the width: "
set /a area=%length%*%width%
echo The area of the quadrilateral is: %area%

if "%length%"=="%width%" (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
goto end

:end
pause
exit