
@echo off
REM Run both backend and frontend in separate PowerShell windows
SET ROOT=%~dp0

REM Prefer the repository venv python if it exists
IF EXIST "%ROOT%\.venv\Scripts\python.exe" (
	SET "PYTHON=%ROOT%\.venv\Scripts\python.exe"
) ELSE (
	SET "PYTHON=python"
)

echo Using Python: %PYTHON%

echo Starting Backend...
start "Backend" powershell -NoExit -Command "Set-Location '%ROOT%\naturadye-pro'; & '%PYTHON%' -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000"

echo Starting Frontend...
start "Frontend" powershell -NoExit -Command "Set-Location '%ROOT%\frontend'; npm run dev"

echo Launched backend and frontend.
