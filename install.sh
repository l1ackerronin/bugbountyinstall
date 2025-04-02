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
notify="[\033[32m██\033[0m]"
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
SPACE_PURPLE='\033[1;35m'


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
            echo -e "$notify ${RED}*${GREEN}[${YELLOW}$tool ${GREEN}is not installed${GREEN}]${RED}*"
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
        echo -e "$notify ${RED}*${GREEN}[${YELLOW}$tool ${GREEN}is not installed${GREEN}]${RED}*"
        sudo apt install -y -qq "$tool"
    done


    path=("~/Desktop/websec")
    mkdir -p $path $path/tools

    echo 'export PATH="$PATH:~/go/bin"' >> ~/.bashrc
    echo 'export PATH="$PATH:~/go/bin"' >> ~/.zshrc

}








#golang tools
golang_tools() {
    TOOLS=(
        "github.com/projectdiscovery/notify/cmd/notify@latest"
        "github.com/mrco24/tok@latest"
        "github.com/lc/gau@latest"
        "github.com/tomnomnom/hacks/anti-burl@latest"
        "github.com/tomnomnom/unfurl@latest"
        "github.com/tomnomnom/anew@latest"
        "github.com/tomnomnom/fff@latest"
        "github.com/LukaSikic/subzy@latest"
        "github.com/tomnomnom/gron@latest"
        "github.com/tomnomnom/qsreplace@latest"
        "github.com/dwisiswant0/cf-check@latest"
        "github.com/ferreiraklet/Jeeves@latest"
        "github.com/mrco24/time-sql@latest"
        "github.com/mrco24/mrco24-error-sql@latest"
        "github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
        "github.com/xm1k3/cent@latest"
        "github.com/zan8in/afrog/v2/cmd/afrog@latest"
        "github.com/003random/getJS@latest"
        "github.com/MrEmpy/mantra@latest"
        "github.com/ethicalhackingplayground/bxss@latest"
        "github.com/KathanP19/Gxss@latest"
        "github.com/Emoe/kxss@latest"
        "github.com/hahwul/dalfox/v2@latest"
        "github.com/projectdiscovery/interactsh/cmd/interactsh-client"
        "github.com/mrco24/open-redirect@latest"
        "github.com/mrco24/mrco24-lfi@latest"
        "github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
        "github.com/sensepost/gowitness@latest"
        "github.com/projectdiscovery/httpx/cmd/httpx@latest"
        "github.com/tomnomnom/httprobe@latest"
        "github.com/jaeles-project/gospider@latest"
        "github.com/hakluke/hakrawler@latest"
        "github.com/tomnomnom/waybackurls@latest"
        "github.com/projectdiscovery/katana/cmd/katana@latest"
        "github.com/mrco24/parameters@latest"
        "github.com/tomnomnom/gf@latest"
        "github.com/mrco24/web-archive@latest"
        "github.com/mrco24/otx-url@latest"
        "github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
        "github.com/d3mondev/puredns/v2@latest"
        "github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest"
        "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
        "github.com/tomnomnom/assetfinder@latest"
        "github.com/gwen001/github-subdomains@latest"
        "github.com/owasp-amass/amass/v4/...@master"
        "github.com/cgboal/sonarsearch/cmd/crobat@latest"
        "github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest"
        "github.com/projectdiscovery/chaos-client/cmd/chaos@latest"
        "github.com/Josue87/gotator@latest"
        "github.com/glebarez/cero@latest"
        "github.com/dwisiswant0/galer@latest"
        "github.com/hakluke/haktrails@latest"
        "github.com/c3l3si4n/quickcert@HEAD"
        "github.com/projectdiscovery/alterx/cmd/alterx@latest"
        "github.com/ffuf/ffuf/v2@latest"
        "github.com/utkusen/socialhunter@latest"
        "github.com/projectdiscovery/asnmap/cmd/asnmap@latest"
        "github.com/lc/gau/v2/cmd/gau@latest"
        "github.com/owasp-amass/oam-tools/cmd/oam_subs@master"
        "github.com/lc/subjs@latest"
    )

    BIN_PATH="$HOME/go/bin"

    for TOOL in "${TOOLS[@]}"; do
        BINARY_NAME=$(basename "$(echo "$TOOL" | cut -d'@' -f1)")
        if [[ ! -f "$BIN_PATH/$BINARY_NAME" ]]; then
            echo -e "$notify ${RED}*${GREEN}[${YELLOW}$BINARY_NAME ${GREEN}is not installed${GREEN}]${RED}*"
            go install -v "$TOOL"
        else
            echo -e "${WHITE}[-${YELLOW}Info${WHITE}-] ${RED}*${GREEN}[${YELLOW}$BINARY_NAME ${GREEN}is already installed${GREEN}]${RED}*"
        fi
    done
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
