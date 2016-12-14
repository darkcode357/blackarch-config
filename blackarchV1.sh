#!/bin/bash
#informações==================================================#
# arquivo: blackarch.sh           (primeira versao:13:12:2016)#
###############################################################
# repositório do criadores https://github.com/darkcode357     #
#                          https://github.com/anony000        #
###############################################################
#-system------------------------------------------------------#
# versao 1.0 blackarchV1.sh                                   #
###############################################################
#-DOC---------------------------------------------------------#
# Acesse:
###############################################################

verm="\033[1;31m"
verde="\033[1;32m"
amarelo=`echo "\033[1;33m"`
azul=`echo "\033[1;34m"`
branco=`echo "\033[0;37m"`
nml=`echo "\033[m"`
ciano=`echo "\033[01;36m"`

function menu() {
echo -e "${verde}1)${amarelo} Exploração${nml}"
echo -e "${verde}2)${amarelo} Database${nml}"
echo -e "${verde}3)${amarelo} Escaners de rede${nml}"
echo -e "${verde}4)${amarelo} Escaners WEB${nml}"
echo -e "${verde}5)${amarelo} Sniffer${nml}"
echo -e "${verde}6)${amarelo} Anti forense${nml}"
echo
echo -e "${branco}Pression [Q] para sair${nml}"
read -n1 resp

 case $resp in
  1)reset;
    exploit;
    ;;

    2)reset;
    database;
    ;;

    3)reset;
    scan-net;
    ;;

    4)reset;
      scan-web;
      ;;

      5)reset;
        sniffer;
        ;;

        6) reset;
           anti-forense;
           ;;


    q | Q)echo -e "${ciano}Até mais o/${nml}";
          reset;
          exit 0
          ;;

    *) reset;
 esac
 }

 function exploit() {
   # Ferramentas exploit
   function metasploit() {
    echo -e "${verde} instalando o metasploit ${nml}"
    sudo apt-get -y install autoconf bison build-essential curl git-core libapr1 libaprutil1 libcurl4-openssl-dev libgmp3-dev libpcap-dev libpq-dev libreadline6-dev libsqlite3-dev libssl-devlibsvn1 libtool  libxml2 libxml2-dev libxslt-dev libyaml-dev locate ncurses-dev openssl postgresql postgresql-contrib wget  xsel zlib1g zlib1g-dev  
    cd /opt
    git clone https://github.com/rapid7/metasploit-framework
    cd metasploit-framework
    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    curl -L https://get.rvm.io | bash -s stable
    curl -o rvm.sh -L https://get.rvm.io
    less rvm.sh # Read it and see it's all good
    cat rvm.sh | bash -s stable
    source ~/.rvm/scripts/rvm
    cd /opt/metasploit-framework
    rvm --install ruby-version
    gem install bundler
    gconftool-2 --set --type boolean /apps/gnome-terminal/profiles/Default/login_shell true
    bundle install
    systemctl start postgresql
    systemctl enable postgresql
    msfdb init 
}
   function aggroargs() {
    clone git https://github.com/tintinweb/aggroArgs
}
   function angrop() {git clone https://github.com/salls/angrop}
   function armitage() {
    cd /opt
    wget http://www.fastandeasyhacking.com/download/armitage150813.tgz
    tar -xf *.tgz
    update-java-alternatives --jre -s java-1.7.0-openjdk-amd64
    update-java-alternatives --jre -s java-1.7.0-openjdk-i386
}
   function cobalt() {firefox https://mega.nz/#!pUBUVRrC!-i41SDkceUAarTKdo1kHH7V6jM3LqBPrHZtO8NOCMFg}
   function beef() {
    wget https://raw.githubusercontent.com/beefproject/beef/master/install-beef 
    mv install-beef  installbee.sh
    chmod 777 installbee.sh 
    ./installbee.sh

  }
}

  function database() {
   # Database
   function sqlmap() {cd /opt; git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev}
   function sqlninja() {cd /opt; svn checkout http://svn.code.sf.net/p/sqlninja/code/ sqlninja-code
}
   function oscanner() {cd /opt; git clone git://git.kali.org/packages/oscanner.git}
   function mdb-tool() {cd /opt; git clone https://github.com/brianb/mdbtools}
 }

   function scan-net() {
   # Escaner de rede
   function nmap() {cd /opt; wget https://nmap.org/dist/nmap-7.31.tar.bz2 
  bzip2 -cd nmap-7.31.tar.bz2 | tar xvf -
  cd nmap-7.31
  ./configure
  make
  su root
  make install
 }
   function zenmap() {apt install zenmap}
   function netdiscover() {apt install netdiscover}
   function angryip() {apt install }

 }
   function scan-web() {
   # Escaners WEB
   function nikto() {apt-get install nikto}
   function uniscan() {apt-get install uniscan}
   function wpscan() {apt-get install wpscan}
   function joomscan() {apt-get install joomscan}
   function burpsuite() {apt-get install burpsuite}
   function websploit() {apt-get install websploit}
   function lynis() {apt-get install lynis}
   function golismero() {apt-get install golismero}
   function openvas() {wget -q -O - http://www.atomicorp.com/installers/atomic |sh}
 }

 function sniffer() {
   # Sniffers
   function wireshark() {apt-get install wireshark}
   function urlsnarf() {apt-get install urlsnarf}
   function dnsspof() {apt-get install dnsspof}
   function sslsniff() {apt-get install sslsniff}
   function tcpdump() {apt-get install tcpdump}
   function ettercap() {apt-get install ettercap}
 }

 if [ `whoami` == "root" ];then
   reset
   menu
 else
   echo -e "${verm}Insira sua senha root:${nml}"
   sudo su
 fi
