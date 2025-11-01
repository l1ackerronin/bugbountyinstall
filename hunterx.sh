#!/bin/bash

#script info
author="@l1ackerronin"
version="v3"

#colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
SPACE_PURPLE='\033[1;35m'
info="${WHITE}[-${YELLOW}Info${WHITE}-]"

#path
path=("~/websec")

mkdir -p ~/websec ~/websec/tools ~/.config

# --- Golang Tools list (Global) ---
declare -A GOLANG_TOOLS=(
    ["notify"]="github.com/projectdiscovery/notify/cmd/notify"
    ["tok"]="github.com/mrco24/tok"
    ["gau"]="github.com/lc/gau"
    ["anti-burl"]="github.com/tomnomnom/hacks/anti-burl"
    ["unfurl"]="github.com/tomnomnom/unfurl"
    ["anew"]="github.com/tomnomnom/anew"
    ["fff"]="github.com/tomnomnom/fff"
    ["subzy"]="github.com/PentestPad/subzy"
    ["subjack"]="github.com/haccer/subjack"
    ["gron"]="github.com/tomnomnom/gron"
    ["qsreplace"]="github.com/tomnomnom/qsreplace"
    ["cf-check"]="github.com/dwisiswant0/cf-check"
    ["Jeeves"]="github.com/ferreiraklet/Jeeves"
    ["time-sql"]="github.com/mrco24/time-sql"
    ["mrco24-error-sql"]="github.com/mrco24/mrco24-error-sql"
    ["nuclei"]="github.com/projectdiscovery/nuclei/v3/cmd/nuclei"
    ["cent"]="github.com/xm1k3/cent"
    ["afrog"]="github.com/zan8in/afrog/v2/cmd/afrog"
    ["getJS"]="github.com/003random/getJS"
    ["mantra"]="github.com/Brosck/mantra"
    ["bxss"]="github.com/ethicalhackingplayground/bxss/v2/cmd/bxss"
    ["Gxss"]="github.com/KathanP19/Gxss"
    ["kxss"]="github.com/Emoe/kxss"
    ["dalfox"]="github.com/hahwul/dalfox/v2"
    ["interactsh-client"]="github.com/projectdiscovery/interactsh/cmd/interactsh-client"
    ["open-redirect"]="github.com/mrco24/open-redirect"
    ["mrco24-lfi"]="github.com/mrco24/mrco24-lfi"
    ["naabu"]="github.com/projectdiscovery/naabu/v2/cmd/naabu"
    ["gowitness"]="github.com/sensepost/gowitness"
    ["httpx"]="github.com/projectdiscovery/httpx/cmd/httpx"
    ["httprobe"]="github.com/tomnomnom/httprobe"
    ["gospider"]="github.com/jaeles-project/gospider"
    ["hakrawler"]="github.com/hakluke/hakrawler"
    ["waybackurls"]="github.com/tomnomnom/waybackurls"
    ["katana"]="github.com/projectdiscovery/katana/cmd/katana"
    ["parameters"]="github.com/mrco24/parameters"
    ["gf"]="github.com/tomnomnom/gf"
    ["web-archive"]="github.com/mrco24/web-archive"
    ["otx-url"]="github.com/mrco24/otx-url"
    ["dnsx"]="github.com/projectdiscovery/dnsx/cmd/dnsx"
    ["puredns"]="github.com/d3mondev/puredns/v2"
    ["shuffledns"]="github.com/projectdiscovery/shuffledns/cmd/shuffledns"
    ["subfinder"]="github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
    ["assetfinder"]="github.com/tomnomnom/assetfinder"
    ["github-subdomains"]="github.com/gwen001/github-subdomains"
    ["amass"]="github.com/owasp-amass/amass/v4/..."
    ["crobat"]="github.com/cgboal/sonarsearch/cmd/crobat"
    ["mapcidr"]="github.com/projectdiscovery/mapcidr/cmd/mapcidr"
    ["chaos"]="github.com/projectdiscovery/chaos-client/cmd/chaos"
    ["gotator"]="github.com/Josue87/gotator"
    ["cero"]="github.com/glebarez/cero"
    ["galer"]="github.com/dwisiswant0/galer"
    ["haktrails"]="github.com/hakluke/haktrails"
    ["quickcert"]="github.com/c3l3si4n/quickcert@HEAD"
    ["alterx"]="github.com/projectdiscovery/alterx/cmd/alterx"
    ["ffuf"]="github.com/ffuf/ffuf/v2"
    ["socialhunter"]="github.com/utkusen/socialhunter"
    ["asnmap"]="github.com/projectdiscovery/asnmap/cmd/asnmap"
    ["oam_subs"]="github.com/owasp-amass/oam-tools/cmd/oam_subs"
    ["subjs"]="github.com/lc/subjs"
    ["certinfo"]="github.com/rix4uni/certinfo"
    ["cspfinder"]="github.com/rix4uni/cspfinder"
    ["waybackurlsx"]="github.com/rix4uni/waybackurlsx@latest"
)


#requirement for mac
requirement_mac(){
    brew update 
    brew upgrade
    brew install golang
    brew install python3

    requirement_tools=(
        nmap jq npm chromium fish make parallel tmux unzip gcc
    )

    # Check tools
    for tool in "${requirement_tools[@]}"; do
        if ! command -v $tool &>/dev/null; then
            echo -e "${info} ${RED}*${GREEN}[${RED}$tool ${GREEN}is not installed. Installing...${GREEN}]${RED}*"
            brew install $tool
        else
            echo -e "${WHITE}[-${YELLOW}Info${WHITE}-] ${RED}*${GREEN}[${YELLOW}$tool ${GREEN}is already installed${GREEN}]${RED}*"
        fi
    done

    echo 'export PATH="$PATH:~/go/bin"' >> ~/.bashrc
    echo 'export PATH="$PATH:~/go/bin"' >> ~/.zshrc
}

# Linux requirements function with live status for APT packages
requirement_linux(){
    echo -e "${info} ${CYAN}Updating package lists...${WHITE}"
    sudo apt update
    echo -e "${info} ${CYAN}Upgrading installed packages...${WHITE}"
    sudo apt upgrade -y
    
    # Essential build tools and libraries
    sudo apt install -y libldns-dev build-essential

    requirement_tools=(
        python3 python3-pip git golang massdns snapd knockpy host nmap
        photon arjun dnsutils dnsutils dirb cewl feroxbuster jq npm
        chromium-browser fish parallel tmux unzip make gcc
    )
    # Note: 'host' and 'dig' are often in the 'dnsutils' or 'bind9-utils' package. 'snap' command is in 'snapd'.

    installed_count=0
    failed_tools=()
    total_count=${#requirement_tools[@]}

    echo -e "${info} ${CYAN}Starting installation of APT packages...${WHITE}"
    echo -e "${PURPLE}--------------------------------------------------${WHITE}"

    for tool in "${requirement_tools[@]}"; do
        # Check if the package is already installed using dpkg
        if dpkg -s "$tool" &> /dev/null; then
            echo -e "${info} ${YELLOW}${tool} is already installed. ${GREEN}[SKIPPED]${WHITE}"
        else
            echo -en "${info} ${CYAN}Installing ${tool}... ${WHITE}"
            
            # Install the package, redirecting output to keep the console clean
            sudo apt install -y "$tool" > /dev/null 2>&1
            
            # Check the exit code of the last command to determine success or failure
            if [[ $? -eq 0 ]]; then
                echo -e "${GREEN}[INSTALLED]${WHITE}"
                ((installed_count++))
            else
                echo -e "${RED}[FAILED]${WHITE}"
                failed_tools+=("$tool")
            fi
        fi
    done
    
    echo -e "${PURPLE}--------------------------------------------------${WHITE}"
    echo -e "${WHITE}[-${YELLOW}Summary${WHITE}-] ${GREEN}APT package installation finished.${WHITE}"
    echo -e "${WHITE}[-${YELLOW}Summary${WHITE}-] ${YELLOW}Total packages checked: $total_count, Newly installed: $installed_count${WHITE}"
    if [[ ${#failed_tools[@]} -gt 0 ]]; then
        echo -e "${WHITE}[-${YELLOW}Failed Packages${WHITE}-] ${RED}The following could not be installed: ${failed_tools[@]}${WHITE}"
    fi

    echo 'export PATH="$PATH:~/go/bin"' >> ~/.bashrc
    echo 'export PATH="$PATH:~/go/bin"' >> ~/.zshrc
    echo -e "${info} ${GREEN}Go binary path added to .bashrc and .zshrc. Please restart your terminal or run 'source ~/.bashrc'/'source ~/.zshrc'.${WHITE}"
}


# golang tools installation with live status
golang_tools() {
    BIN_PATH="$HOME/go/bin"
    total_tools=0
    installed_tools=0
    not_installed_tools=()

    echo -e "${info} ${CYAN}Starting installation of Go tools...${WHITE}"
    echo -e "${PURPLE}--------------------------------------------------${WHITE}"

    for TOOL in "${!GOLANG_TOOLS[@]}"; do
        TOOL_PATH="$BIN_PATH/$TOOL"
        TOOL_URL="${GOLANG_TOOLS[$TOOL]}"
        total_tools=$((total_tools + 1))

        if [[ -f "$TOOL_PATH" ]]; then
            echo -e "${info} ${YELLOW}${TOOL} is already present. ${GREEN}[SKIPPED]${WHITE}"
        else
            echo -en "${info} ${CYAN}Installing ${TOOL}... ${WHITE}"
            
            go install -v ${TOOL_URL}@latest > /dev/null 2>&1
            
            if [[ ! -f "$TOOL_PATH" ]]; then GO111MODULE=on go install -v ${TOOL_URL}@latest > /dev/null 2>&1; fi
            if [[ ! -f "$TOOL_PATH" ]]; then go get ${TOOL_URL} > /dev/null 2>&1; fi
            if [[ ! -f "$TOOL_PATH" ]]; then GO111MODULE=on go get ${TOOL_URL} > /dev/null 2>&1; fi

            if [[ -f "$TOOL_PATH" ]]; then
                echo -e "${GREEN}[INSTALLED]${WHITE}"
                installed_tools=$((installed_tools + 1))
            else
                echo -e "${RED}[FAILED]${WHITE}"
                not_installed_tools+=("$TOOL")
            fi
        fi
    done

    echo -e "${PURPLE}--------------------------------------------------${WHITE}"
    echo -e "${WHITE}[-${YELLOW}Summary${WHITE}-] ${GREEN}Go tools installation process finished.${WHITE}"
    echo -e "${WHITE}[-${YELLOW}Summary${WHITE}-] ${YELLOW}Total tools checked: $total_tools, Newly installed: $installed_tools${WHITE}"
    if [[ ${#not_installed_tools[@]} -gt 0 ]]; then
        echo -e "${WHITE}[-${YELLOW}Failed Tools${WHITE}-] ${RED}The following tools could not be installed: ${not_installed_tools[@]}${WHITE}"
    fi
}


# Update multiple Go Tools from a comma-separated list
update_golang_tools() {
    local tool_list_string="$1"
    local OLD_IFS=$IFS
    IFS=','
    
    for tool_to_update in $tool_list_string; do
        if [[ -v "GOLANG_TOOLS[$tool_to_update]" ]]; then
            local tool_url="${GOLANG_TOOLS[$tool_to_update]}"
            echo -e "${info} ${CYAN}Attempting to update '${tool_to_update}'...${WHITE}"
            
            go install -v "${tool_url}@latest"
            
            if [[ $? -eq 0 ]]; then
                echo -e "${info} ${GREEN}'${tool_to_update}' has been successfully updated/re-installed.${WHITE}"
            else
                echo -e "${info} ${RED}Failed to update '${tool_to_update}'.${WHITE}"
            fi
        else
            echo -e "${info} ${RED}Error: Tool '${tool_to_update}' not found in the list.${WHITE}"
        fi
        echo -e "${PURPLE}--------------------------------------------------${WHITE}"
    done
    IFS=$OLD_IFS
}

#python pip3
python_tools(){
    pip3 install uro subcat

    rm -rf  ~/.gf ~/Gf ~/Gf-Patterns
    echo -e "${info} Setting up GF patterns..."
    git clone https://github.com/1ndianl33t/Gf-Patterns.git ~/Gf-Patterns > /dev/null 2>&1
    git clone https://github.com/tomnomnom/Gf.git ~/Gf > /dev/null 2>&1
    mkdir -p ~/.gf && cp ~/Gf/examples/* ~/.gf && cp ~/Gf-Patterns/* ~/.gf
    echo -e "${info} GF patterns setup completed."

    echo -e "${info} Installing findomain..."
    mkdir -p "$path/tools/findomain" && cd "$path/tools"
    curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
    unzip -o findomain-linux.zip && chmod +x findomain && sudo mv findomain /usr/local/bin/

    echo -e "${info} Installing SecretFinder..."
    git clone https://github.com/m4ll0k/SecretFinder.git "$path/tools/secretfinder" 
    pip3 install -r "$path/tools/secretfinder/requirements.txt"

    echo -e "${info} Installing xnLinkFinder..."
    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git "$path/tools/xnLinkFinder" 
    cd "$path/tools/xnLinkFinder" && sudo python3 setup.py install 

    echo -e "${info} Installing paramspider..."
    git clone https://github.com/devanshbatham/paramspider "$path/tools/paramspider" 
    pip3 install "$path/tools/paramspider/."

    echo -e "${info} Installing Sudomy..."
    git clone --recursive https://github.com/screetsec/Sudomy.git "$path/tools/Sudomy"
    pip3 install -r "$path/tools/Sudomy/requirements.txt"
}

#python pip3 alternate
python_alternate(){
    pip3 install uro subcat --break-system-packages

    rm -rf  ~/.gf ~/Gf ~/Gf-Patterns
    echo -e "${info} Setting up GF patterns..."
    git clone https://github.com/1ndianl33t/Gf-Patterns.git ~/Gf-Patterns > /dev/null 2>&1
    git clone https://github.com/tomnomnom/Gf.git ~/Gf > /dev/null 2>&1
    mkdir -p ~/.gf && cp ~/Gf/examples/* ~/.gf && cp ~/Gf-Patterns/* ~/.gf
    echo -e "${info} GF patterns setup completed."

    echo -e "${info} Installing findomain..."
    mkdir -p "$path/tools/findomain" && cd "$path/tools"
    curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
    unzip -o findomain-linux.zip && chmod +x findomain && sudo mv findomain /usr/local/bin/

    echo -e "${info} Installing SecretFinder..."
    git clone https://github.com/m4ll0k/SecretFinder.git "$path/tools/secretfinder"
    pip3 install -r "$path/tools/secretfinder/requirements.txt" --break-system-packages

    echo -e "${info} Installing xnLinkFinder..."
    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git "$path/tools/xnLinkFinder"
    cd "$path/tools/xnLinkFinder" && sudo python3 setup.py install

    echo -e "${info} Installing paramspider..."
    git clone https://github.com/devanshbatham/paramspider "$path/tools/paramspider"
    pip3 install "$path/tools/paramspider/." --break-system-packages

    echo -e "${info} Installing Sudomy..."
    git clone --recursive https://github.com/screetsec/Sudomy.git "$path/tools/Sudomy"
    pip3 install -r "$path/tools/Sudomy/requirements.txt" --break-system-packages
}

#help screen
show_help() {
    name=$(basename "$0")

    echo -e "${RED}__________               __________                     __          "
    echo -e "${RED}\______   \__ __  ____   \______   \ ____  __ __  _____/  |_ ___.__."
    echo -e "${RED} |    |  _/  |  \/ ___\   |    |  _//  _ \|  |  \/    \   __<   |  |"
    echo -e "${RED} |    |   \  |  / /_/  >  |    |   (  <_> )  |  /   |  \  |  \___  |"
    echo -e "${RED} |______  /____/\___  /   |______  /\____/|____/|___|  /__|  / ____| [${version}] ${GREEN}[${author}]"
    echo -e "${RED}        \/     /_____/           \/                  \/      \/     "
    echo -e "${WHITE}"
    echo -e "\nUsage: $name [OPTIONS]"
    echo "Options:"
    echo "  --mac                     Install tools for macOS"
    echo "  --linux                   Install Linux prerequisites with live status"
    echo "  --golang                  Install all Go tools with live status"
    echo "  --python                  Install Python tools"
    echo "  --python-alter            Install Python tools (alternate method if error)"
    echo "  --update [tool1,tool2,...]  Update specific Go tools from a comma-separated list."
    echo "                              Example: $name --update nuclei,subfinder,httpx"
    echo "  --help                    Show this help screen"
    exit 1
}

# If no arguments are given, show help screen
if [[ $# -eq 0 ]]; then
    show_help
fi

# main argument parsing loop
while [[ $# -gt 0 ]]; do
    case "$1" in
        --mac) requirement_mac ;;
        --linux) requirement_linux ;;
        --golang) golang_tools ;;
        --python) python_tools ;;
        --python-alter) python_alternate ;;
        -i)
            if [[ -z "$2" || "$2" == --* ]]; then
                echo -e "${RED}Error: --update flag requires a comma-separated list of tool names.${WHITE}" >&2
                show_help
                exit 1
            fi
            update_golang_tools "$2"
            shift # Consume tool_list argument
            ;;
        --help) show_help ;;
        *) echo "Unknown option: $1"; show_help ;;
    esac
    shift # Consume the current argument
done
