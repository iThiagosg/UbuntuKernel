#!/bin/bash

#Remoção de Kernel Antigo
#Thiago Guedes

echo "Kernel Atual"
uname -r
echo
echo "Kernel Antigos encontrado no sistema"
dpkg-query -l | awk '/linux-image-*/ {prin $2}'
echo
echo
sleep 5
echo "Deseja Excluir os Kernel Antigos? s/n"
read -n1 escolha

case $escolha in 
	S|s) echo
		echo Removendo Kernel Antigo
		dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")&q­uot;'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
		sudo update-grup;;
	N|n) echo
		echo Operação Cancelada
			sleep 5;;
	*) echo
		echo Opção inválida. Digite apenas s ou n;;
esac
