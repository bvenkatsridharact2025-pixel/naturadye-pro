param(
    [switch]$InstallDependencies
)

# Root of the repository (this script's directory)
$root = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $root

Write-Host "Repository root: $root"

if ($InstallDependencies) {
    Write-Host "Creating venv (if missing) and installing backend deps..."
    if (-not (Test-Path "$root\.venv")) {
        python -m venv .venv
    }
    # Activate and install backend deps
    & .venv\Scripts\Activate.ps1
    python -m pip install --upgrade pip
    python -m pip install -r naturadye-pro/requirements.txt

    Write-Host "Installing frontend deps..."
    Push-Location frontend
    npm install
    Pop-Location
}

# Start backend in a new PowerShell window
Write-Host "Starting backend in a new PowerShell window..."
Start-Process powershell -ArgumentList @(
    '-NoExit',
    '-Command',
    "Set-Location '$root\naturadye-pro'; if (Test-Path '.venv\\Scripts\\Activate.ps1') { . '.\.venv\\Scripts\\Activate.ps1' }; python -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000"
) -WindowStyle Normal

# Start frontend in a new PowerShell window
Write-Host "Starting frontend in a new PowerShell window..."
Start-Process powershell -ArgumentList @(
    '-NoExit',
    '-Command',
    "Set-Location '$root\frontend'; npm run dev"
) -WindowStyle Normal

Write-Host "Launched backend and frontend."
