# BugBountyInstall

This script provides an easy setup for web security tools on both macOS and Linux systems. It installs essential tools for bug hunting, penetration testing, and web security research. Additionally, it installs Golang and Python-based tools for advanced users.

<img width="1475" alt="picture" src="https://github.com/user-attachments/assets/85164089-85cf-4a07-8e77-4215dbac9580" />


## Features

- Installs tools for both macOS and Linux.
- Includes a comprehensive list of security tools such as `nmap`, `gau`, `httpx`, `subfinder`, `nuclei`, `amass`, and more.
- Supports the installation of both Golang and Python-based tools.
- Sets up essential directories and environment variables for a streamlined setup.

## Tested On
- Apple Silicon M2 Chip
- ARMx64
- ARMx32
- AMDx64

## Installation

### Prerequisites

Make sure you have the following dependencies installed:
- **macOS**: Homebrew is required to install necessary dependencies.
- **Linux**: A package manager (`apt` for Debian-based distros) is required.

### Usage

1. **Clone the repository**:

```bash
git clone https://github.com/nahid0x1/bugbounty.git
cd bugbounty
```

2. **To view the help screen:**:
```bash
bash install.sh --help
```

3. **For OSX**:
```bash
bash install.sh --mac
```

4. **For Linux**:
```bash
bash install.sh --linux
```

5. **install Golang tools**:
```bash
bash install.sh --golang
```

6. **install Python tools**:
```bash
bash install.sh --python
```

7. **If you encounter any errors while installing Python tools, use the alternate method**:
```bash
bash install.sh --python-alter
```

7. **Install Tools at once**:
```bash
bash install.sh --linux or mac --golang --python or python-alter
```

# Author
- **GitHub**: [@nahid0x1](https://github.com/nahid0x1)
- **Twitter**: [@nahid0x1](https://x.com/nahid0x1)
- **Linkedin**: [@nahid0x1](https://www.linkedin.com/in/nahid0x1)
- **Email**: [nahid0x1.official@gmail.com](mailto:nahid0x1.official@gmail.com)
