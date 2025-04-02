#!/bin/bash


: ' Tools
notify, tok, gau, anti-burl, unfurl, anew, fff, subzy, gron, qsreplace, cf-check, Jeeves, time-sql, mrco24-error-sql, nuclei, cent, afrog, getJS, 
mantra, bxss, Gxss, kxss, dalfox, interactsh-client, open-redirect, mrco24-lfi, naabu, gowitness, httpx, httprobe, gospider, hakrawler, waybackurls, 
katana, parameters, gf, web-archive, otx-url, dnsx, puredns, shuffledns, subfinder, assetfinder, github-subdomains, amass, crobat, mapcidr, chaos, 
gotator, cero, galer, haktrails, quickcert, alterx, ffuf, socialhunter, asnmap, oam_subs, subjs, python3, pip3, golang, subfinder, assetfinder, 
findomain, amass, chaos, gf, snap, knockpy, sublist3r, gau, uro, nuclei, nmap, waybackurls, photon, arjun, dirbuster, dirb, secretfinder, 
Mantra, katana, paramspider, cewl
'

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


#requirement for mac
requirement_mac(){

    brew update 
    brew upgrade
    brew install golang
    brew install python3

    requirement_tools=(
        nmap
        jq
        npm
        chromium
        fish
        parallel
        tmux
        unzip
    )

    # Check tools
    for tool in "${required_tools[@]}"; do
        if ! command -v $tool &>/dev/null; then
            echo -e "${info} ${RED}*${GREEN}[${RED}$tool ${GREEN}is not installed. Installing...${GREEN}]${RED}*"
            brew install $tool
        else
            echo -e "${WHITE}[-${YELLOW}Info${WHITE}-] ${RED}*${GREEN}[${YELLOW}$tool ${GREEN}is already installed${GREEN}]${RED}*"
        fi
    done


    path=("~/Desktop/websec")
    mkdir -p $path $path/tools

    echo 'export PATH="$PATH:~/go/bin"' >> ~/.bashrc
    echo 'export PATH="$PATH:~/go/bin"' >> ~/.zshrc

}

#requirement for linux
requirement_linux(){

    apt update 
    apt upgrade -y
    apt remove --purge golang -y

    requirement_tools=(
        python3
        golang
        snap
        knockpy
        sublist3r
        nmap
        photon
        arjun
        dirbuster
        dirb
        cewl
        feroxbuster
        jq
        npm
        chromium
        fish
        parallel
        tmux
        unzip
    )

    for tool in "${requirement_tools[@]}"; do
        echo -e "${info} ${RED}*${GREEN}[${RED}$tool ${GREEN}is not installed. Installing...${GREEN}]${RED}*"
        sudo apt install -y -qq "$tool"
    done


    path=("~/Desktop/websec")
    mkdir -p $path $path/tools

    echo 'export PATH="$PATH:~/go/bin"' >> ~/.bashrc
    echo 'export PATH="$PATH:~/go/bin"' >> ~/.zshrc

}








# golang tools
golang_tools() {

    declare -A tools=(
        ["notify"]=" github.com/projectdiscovery/notify/cmd/notify"
        ["tok"]=" github.com/mrco24/tok"
        ["gau"]=" github.com/lc/gau"
        ["anti-burl"]=" github.com/tomnomnom/hacks/anti-burl"
        ["unfurl"]=" github.com/tomnomnom/unfurl"
        ["anew"]=" github.com/tomnomnom/anew"
        ["fff"]=" github.com/tomnomnom/fff"
        ["subzy"]=" github.com/PentestPad/subzy"
        ["gron"]=" github.com/tomnomnom/gron"
        ["qsreplace"]=" github.com/tomnomnom/qsreplace"
        ["cf-check"]=" github.com/dwisiswant0/cf-check"
        ["Jeeves"]=" github.com/ferreiraklet/Jeeves"
        ["time-sql"]=" github.com/mrco24/time-sql"
        ["mrco24-error-sql"]=" github.com/mrco24/mrco24-error-sql"
        ["nuclei"]=" github.com/projectdiscovery/nuclei/v3/cmd/nuclei"
        ["cent"]=" github.com/xm1k3/cent"
        ["afrog"]=" github.com/zan8in/afrog/v2/cmd/afrog"
        ["getJS"]=" github.com/003random/getJS"
        ["mantra"]=" github.com/Brosck/mantra"
        ["bxss"]=" github.com/ethicalhackingplayground/bxss/v2/cmd/bxss"
        ["Gxss"]=" github.com/KathanP19/Gxss"
        ["kxss"]=" github.com/Emoe/kxss"
        ["dalfox"]=" github.com/hahwul/dalfox/v2"
        ["interactsh-client"]=" github.com/projectdiscovery/interactsh/cmd/interactsh-client"
        ["open-redirect"]=" github.com/mrco24/open-redirect"
        ["mrco24-lfi"]=" github.com/mrco24/mrco24-lfi"
        ["naabu"]=" github.com/projectdiscovery/naabu/v2/cmd/naabu"
        ["gowitness"]=" github.com/sensepost/gowitness"
        ["httpx"]=" github.com/projectdiscovery/httpx/cmd/httpx"
        ["httprobe"]=" github.com/tomnomnom/httprobe"
        ["gospider"]=" github.com/jaeles-project/gospider"
        ["hakrawler"]=" github.com/hakluke/hakrawler"
        ["waybackurls"]=" github.com/tomnomnom/waybackurls"
        ["katana"]=" github.com/projectdiscovery/katana/cmd/katana"
        ["parameters"]=" github.com/mrco24/parameters"
        ["gf"]=" github.com/tomnomnom/gf"
        ["web-archive"]=" github.com/mrco24/web-archive"
        ["otx-url"]=" github.com/mrco24/otx-url"
        ["dnsx"]=" github.com/projectdiscovery/dnsx/cmd/dnsx"
        ["puredns"]=" github.com/d3mondev/puredns/v2"
        ["shuffledns"]=" github.com/projectdiscovery/shuffledns/cmd/shuffledns"
        ["subfinder"]=" github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
        ["assetfinder"]=" github.com/tomnomnom/assetfinder"
        ["github-subdomains"]=" github.com/gwen001/github-subdomains"
        ["amass"]=" github.com/owasp-amass/amass/v4/..."
        ["crobat"]=" github.com/cgboal/sonarsearch/cmd/crobat"
        ["mapcidr"]=" github.com/projectdiscovery/mapcidr/cmd/mapcidr"
        ["chaos"]=" github.com/projectdiscovery/chaos-client/cmd/chaos"
        ["gotator"]=" github.com/Josue87/gotator"
        ["cero"]=" github.com/glebarez/cero"
        ["galer"]=" github.com/dwisiswant0/galer"
        ["haktrails"]=" github.com/hakluke/haktrails"
        ["quickcert"]=" github.com/c3l3si4n/quickcert@HEAD"
        ["alterx"]=" github.com/projectdiscovery/alterx/cmd/alterx"
        ["ffuf"]=" github.com/ffuf/ffuf/v2"
        ["socialhunter"]=" github.com/utkusen/socialhunter"
        ["asnmap"]=" github.com/projectdiscovery/asnmap/cmd/asnmap"
        ["oam_subs"]=" github.com/owasp-amass/oam-tools/cmd/oam_subs"
        ["subjs"]=" github.com/lc/subjs"
    )


    # Go binaries
    BIN_PATH="$HOME/go/bin"
    total_tools=0
    installed_tools=0
    not_installed_tools=()

    for TOOL in "${!tools[@]}"; do
        TOOL_PATH="$BIN_PATH/$TOOL"
        TOOL_URL="${tools[$TOOL]}"
        total_tools=$((total_tools + 1))

        if [[ ! -f "$TOOL_PATH" ]]; then
            echo -e "${info} ${RED}*${GREEN}[${RED}${TOOL} ${GREEN}is not installed. installing....${GREEN}]${RED}*"
            go install -v ${TOOL_URL}@latest > /dev/null 2>&1

            if [[ $? -ne 0 ]]; then
                echo -e "${info} ${RED}*${GREEN}[${RED}${TOOL} ${GREEN} installation failed, retrying with GO111MODULE=on...${GREEN}]${RED}*"
                GO111MODULE=on go install -v ${TOOL_URL}@latest > /dev/null 2>&1
            fi

            if [[ $? -ne 0 ]]; then
                echo -e "${info} ${RED}*${GREEN}[${RED}${TOOL} ${GREEN} installation failed, retrying with go get...${GREEN}]${RED}*"
                go get ${TOOL_URL} > /dev/null 2>&1
            fi

            if [[ ! -f "$TOOL_PATH" ]]; then
                echo -e "${info} ${RED}*${GREEN}[${RED}${TOOL} ${GREEN}  installation failed again, retrying with GO111MODULE=on go get...${GREEN}]${RED}*"
                GO111MODULE=on go get ${TOOL_URL} > /dev/null 2>&1
            fi

            if [[ -f "$TOOL_PATH" ]]; then
                installed_tools=$((installed_tools + 1))
            else
                not_installed_tools+=("$TOOL")
            fi
        else
            echo -e "${WHITE}[-${YELLOW}Info${WHITE}-] ${RED}*${GREEN}[${YELLOW}${TOOL} ${GREEN}is already installed${GREEN}]${RED}*"
        fi
    done

    echo -e "${WHITE}[-${YELLOW}Summary${WHITE}-] ${RED}*${GREEN}[${YELLOW}Total tools: $total_tools, Installed tools: $installed_tools${GREEN}]${RED}*"
    if [[ ${#not_installed_tools[@]} -gt 0 ]]; then
        echo -e "${WHITE}[-${YELLOW}Not Installed${WHITE}-] ${RED}*${GREEN}[${RED}${not_installed_tools[@]}${GREEN}]${RED}*"
    fi
}










#python pip3
python_tools(){
    pip3 install uro
    pip3 install subcat


    #GF Patterns Setup
    git clone https://github.com/1ndianl33t/Gf-Patterns
    git clone https://github.com/tomnomnom/Gf
    mkdir -p ~/.gf && cd ~/Gf/examples && mv * ~/.gf && cd ~/Gf-Patterns && mv * ~/.gf

    #findomain install
    mkdir -p $path/tools/findomain
    cd $path/tools/findomain
    curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
    unzip findomain-linux.zip
    chmod +x findomain 
    sudo mv findomain /usr/bin/findomain 



    git clone https://github.com/m4ll0k/SecretFinder.git $path/tools/secretfinder 
    cd $path/tools/secretfinder 
    pip3 install -r requirements.txt

    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git $path/tools/xnLinkFinder 
    cd $path/tools/xnLinkFinder 
    sudo python3 setup.py install 

    git clone https://github.com/devanshbatham/paramspider $path/tools/paramspider 
    cd $path/tools/paramspider  
    pip3 install .


    git clone --recursive https://github.com/screetsec/Sudomy.git $path/tools/Sudomy
    cd $path/tools/Sudomy
    pip3 install -r requirements.txt
    
}






#python pip3 alternate
python_alternate(){
    pip3 install uro --break-system-packages
    pip3 install subcat --break-system-packages


    #GF Patterns Setup
    git clone https://github.com/1ndianl33t/Gf-Patterns
    git clone https://github.com/tomnomnom/Gf
    mkdir -p ~/.gf && cd ~/Gf/examples && mv * ~/.gf && cd ~/Gf-Patterns && mv * ~/.gf

    #findomain install
    mkdir -p $path/tools/findomain
    cd $path/tools/findomain
    curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
    unzip findomain-linux.zip
    chmod +x findomain 
    sudo mv findomain /usr/bin/findomain 



    git clone https://github.com/m4ll0k/SecretFinder.git $path/tools/secretfinder 
    cd $path/tools/secretfinder 
    pip3 install -r requirements.txt --break-system-packages

    git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git $path/tools/xnLinkFinder 
    cd $path/tools/xnLinkFinder 
    sudo python3 setup.py install 

    git clone https://github.com/devanshbatham/paramspider $path/tools/paramspider 
    cd $path/tools/paramspider  
    pip3 install . --break-system-packages


    git clone --recursive https://github.com/screetsec/Sudomy.git $path/tools/Sudomy
    cd $path/tools/Sudomy
    pip3 install -r requirements.txt --break-system-packages
}


#help screen
show_help() {
    name=$0

    echo -e "${RED}__________               __________                     __          "
    echo -e "${RED}\______   \__ __  ____   \______   \ ____  __ __  _____/  |_ ___.__."
    echo -e "${RED} |    |  _/  |  \/ ___\   |    |  _//  _ \|  |  \/    \   __<   |  |"
    echo -e "${RED} |    |   \  |  / /_/  >  |    |   (  <_> )  |  /   |  \  |  \___  |"
    echo -e "${RED} |______  /____/\___  /   |______  /\____/|____/|___|  /__|  / ____| [v1] ${GREEN}[@nahid0x1]"
    echo -e "${RED}        \/     /_____/           \/                  \/      \/     "
    echo -e "${WHITE}"
    echo -e "\nUsage: $name [OPTIONS]"
    echo "Options:"
    echo "  --mac           Install tools for macOS"
    echo "  --linux         Install tools for Linux"
    echo "  --golang        Install Go tools"
    echo "  --python        Install Python tools"
    echo "  --python-alter  Install Python tools (alternate method if error)"
    echo "  --help          Show this help screen"
    exit 1
}

# If no arguments are given, show help screen
if [[ $# -eq 0 ]]; then
    show_help
fi

# main
while [[ $# -gt 0 ]]; do
    case "$1" in
        --mac) requirement_mac ;;
        --linux) requirement_linux ;;
        --golang) golang_tools ;;
        --python) python_tools ;;
        --python-alter) python_alternate ;;
        --help) show_help ;;
        *) echo "Unknown option: $1"; show_help ;;
    esac
    shift
done
