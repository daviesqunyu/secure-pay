# Secure M-Pesa System Development Setup Script
# Run this script to set up the development environment

Write-Host "🔧 Setting up Secure M-Pesa System Development Environment..." -ForegroundColor Green

# Check if Node.js is installed
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js version: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js is not installed. Please install Node.js from https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Check if npm is installed
try {
    $npmVersion = npm --version
    Write-Host "✅ npm version: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm is not installed. Please reinstall Node.js." -ForegroundColor Red
    exit 1
}

# Install dependencies
Write-Host "📦 Installing dependencies..." -ForegroundColor Yellow
npm install

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to install dependencies" -ForegroundColor Red
    exit 1
}

# Copy environment file if it doesn't exist
if (!(Test-Path ".env.local")) {
    Write-Host "📋 Setting up environment variables..." -ForegroundColor Yellow
    Copy-Item "env.example" ".env.local" -ErrorAction SilentlyContinue
    Write-Host "✅ Created .env.local file" -ForegroundColor Green
}

# Start development server
Write-Host "🚀 Starting development server..." -ForegroundColor Yellow
Write-Host "The application will be available at http://localhost:3000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Gray

npm start
