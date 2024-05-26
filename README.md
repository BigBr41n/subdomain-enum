# Subdomain Enumeration Tool

## Overview

This tool automates the process of subdomain enumeration by leveraging popular subdomain discovery tools such as Subfinder, Assetfinder, and Amass.

## Features

- Integrates with Subfinder, Assetfinder, and Amass for comprehensive subdomain enumeration.
- Removes duplicates and sorts the list of discovered subdomains.
- Utilizes HTTPx for probing discovered subdomains for active HTTP and HTTPS services.

## Prerequisites

Before using this tool, ensure you have the following dependencies installed:

- Go Programming Language (for compiling and running Go-based tools)
- Subfinder: Subdomain discovery tool (https://github.com/projectdiscovery/subfinder)
- Assetfinder: Subdomain discovery tool (https://github.com/tomnomnom/assetfinder)
- Amass: Subdomain enumeration tool (https://github.com/OWASP/Amass)
- HTTPx: Fast and multi-purpose HTTP toolkit (https://github.com/projectdiscovery/httpx)

## Installation

1. Clone this repository to your local machine:

   ```
   git clone https://github.com/BigBr41n/subdomain-enum.git
   ```

2. Navigate to the project directory:
   ```bash
   cd subdomain-enum
   ```
3. Ensure all necessary dependencies are installed. You can use the provided install_tools.sh script to install the required tools automatically:
   ```
   sudo -E ./install_tools.sh
   ```

## Usage

Run the subdomain_enum.sh script with the target domain as an argument:

```
./subdomain_enum.sh example.com
```

Replace example.com with your target domain. The script will enumerate subdomains using Subfinder, Assetfinder, and Amass, remove duplicates, and probe discovered subdomains for active HTTP and HTTPS services using HTTPx.

The results will be saved in subdomains.txt and httpx_output.txt files in the project directory.
