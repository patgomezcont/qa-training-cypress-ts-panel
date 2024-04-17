@echo off

set min_version=16

for /f "tokens=1* delims= " %%a in ('node -v') do (
    set version=%%a
)

if not defined version (
    echo Install node.js before continue
    exit /b 1
)

echo VERSION %version%
for /f "tokens=1* delims=v." %%a in ("%version%") do (
    set major=%%a
)

if %major% LSS %min_version% (
    echo ERROR: Node.js version '%version%' is not valid. Minimum Required version %min_version%.
    exit /b 1
)

echo Installing npm packages
call npm install

echo Testing cypress
npm run test:run

echo Testing jest
npm run unit

echo Everything works correctly. Happy coding! :)