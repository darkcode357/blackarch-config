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
   function metasploit() {}
   function aggroargs() {}
   function angrop() {}
   function armitage() {}
   function cobalt() {}
   function beef() {}
}

  function database() {
   # Database
   function sqlmap() {}
   function sqlninja() {}
   function oscanner() {}
   function mdb-tool() {}
 }

   function scan-net() {
   # Escaner de rede
   function nmap() {}
   function zenmap() {}
   function netdiscover() {}
   function angryip() {}

 }
   function scan-web() {
   # Escaners WEB
   function nikto() {}
   function uniscan() {}
   function wpscan() {}
   function joomscan() {}
   function burpsuite() {}
   function websploit() {}
   function lynis() {}
   function golismero() {}
   function openvas() {}
 }

 function sniffer() {
   # Sniffers
   function wireshark() {}
   function urlsnarf() {}
   function dnsspof() {}
   function sslsniff() {}
   function tcpdump() {}
   function ettercap() {}
 }

 if [ `whoami` == "root" ];then
   reset
   menu
 else
   echo -e "${verm}Insira sua senha root:${nml}"
   sudo su
 fi
