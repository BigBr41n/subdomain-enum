#!/bin/bash

export PATH=/usr/local/go/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Function to install a Go tool
install_go_tool() {
  local tool=$1
  if ! command -v $tool &> /dev/null; then
    echo "Installing $tool..."
    go install -v $2
    if command -v $tool &> /dev/null; then
      echo "$tool installed successfully."
    else
      echo "Failed to install $tool."
      exit 1
    fi
  else
    echo "$tool is already installed."
  fi
}

# check if go is installed
if ! command -v go &> /dev/null; then
  echo "Go is not installed. Please install Go first."
  exit 1
fi

# Export GOPATH and add Go binaries to PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Install the necessary tools
install_go_tool subfinder github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
install_go_tool assetfinder github.com/tomnomnom/assetfinder@latest
install_go_tool amass github.com/owasp-amass/amass/v4/...@master
install_go_tool httpx github.com/projectdiscovery/httpx/cmd/httpx@latest

echo "All tools installed successfully."
