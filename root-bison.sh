#!/bin/bash

sudo apt install figlet -y
sudo cp "DOS Rebel.flf" /usr/share/figlet/
clear
figlet -f "DOS Rebel" LEIA..
read -p "Antes de começar a fazer os procedimentos ,certifique-se de que sabe o que está fazendo.Certifique-se de ter ativado a opçao OEM nas configurações de desenvolvedor e ter ativado a depuraçao usb para desbloquear o bootloader. se compreende press enter ou ctrl+c para sair."
clear
figlet -f "DOS Rebel" B.D.S 
sleep 5
figlet -f Digital ROOT-BISON/REDMI.9A_BDSTECNOSYSTEM
sleep 5
x="root-bison"
menu ()
{
while true $x != "root-bison"
do
clear
echo "================================================"
echo "BDS-ROOT-BISON/REDMI.9A"
echo "Criado por: BDSTECNOSYSTEM"
echo ""
echo "1)Instalar adb/fastboot"
echo ""
echo "2)Desbloquear bootloader do BISON"
echo ""
echo "3)Fazer root no BISON/REDMI.9A"
echo ""
echo "================================================"

echo "Digite a opção desejada:"
read x
echo "Opção informada ($x)"
echo "================================================"

case "$x" in


    1)
      echo "Instalando..."
      sleep 2
      sudo apt install adb -y && sudo apt install fastboot -y
      sleep 5

echo "================================================"
;;
    2)
      read -p "Certifique de ter ativado o desbloqueio oem nas configurações de desenvolvedor e ter ativado a depuração usb. Se ja fez press enter ou ctrl+c para sair"
      echo "permita a depuração"
      sleep 5

# Verifica se o daemon ADB está sendo executado
if ! pgrep -x "adb" > /dev/null; then
    echo "Erro: daemon ADB não está sendo executado." >&2
    exit 1
fi

# Verifica se há dispositivos ADB conectados
devices=$(adb devices | grep -v "List of devices attached")
if [ -z "$devices" ]; then
    echo "Nenhum dispositivo ADB conectado."
sleep 5
exit
else
    echo "Dispositivos ADB conectados:"
    echo "$devices"
 echo "iniciando no modo bootloader/fastboot AGUARDE...."
adb reboot bootloader
fi
      sleep 15
if fastboot devices | grep -q "fastboot"; then
    echo "Dispositivo Fastboot conectado"
else
    echo "Nenhum dispositivo Fastboot conectado"
fi
#       fastboot flashing unlock
       echo "presione volume para cima para confirmar o desbloqueio"
      sleep 10
     fastboot reboot
echo "================================================"
;;
   3)
      read -p "Certifique-se de ter feito todo o processo de modificar a imagem boot pelo magisk ,ter renomeado a imagem para boot-root.img ,ter movido ela para pasta raiz da ferramenta ,e ainda ter movido também o vbmeta para a pasta raiz da ferramenta ,se ja fez press enter ou ctrl+c para sair "

# Verifica se o daemon ADB está sendo executado
if ! pgrep -x "adb" > /dev/null; then
    echo "Erro: daemon ADB não está sendo executado." >&2
    exit 1
fi

# Verifica se há dispositivos ADB conectados
devices=$(adb devices | grep -v "List of devices attached")
if [ -z "$devices" ]; then
    echo "Nenhum dispositivo ADB conectado."
sleep 5
exit
else
    echo "Dispositivos ADB conectados:"
    echo "$devices"
 echo "iniciando no modo bootloader/fastboot AGUARDE...."
adb reboot bootloader
fi
      sleep 15
if fastboot devices | grep -q "fastboot"; then
    echo "Dispositivo Fastboot conectado"
else
    echo "Nenhum dispositivo Fastboot conectado"
exit
fi

      fastboot --disable-verity --disable-verification flash boot boot-root.img
      fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
      fastboot reboot
      clear
        echo "iniciando dispositivo.... AGUARDE....."
sleep 10
 exit
echo "================================================"
;;

*)
        echo "Opção inválida!"
esac
done

}
menu
