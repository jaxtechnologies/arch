if [ "$(id -u)" = 0 ]; then
    echo "##################################################################"
    echo "This script MUST NOT be run as root user since it makes changes"
    echo "to the \$HOME directory of the \$USER executing this script."
    echo "The \$HOME directory of the root user is, of course, '/root'."
    echo "We don't want to mess around in there. So run this script as a"
    echo "normal user. You will be asked for a sudo password when necessary."
    echo "##################################################################"
    exit 1
fi

error() { \
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}



install_path=$(pwd)
echo ""
echo ""
echo ""
echo $install_path
[ ! -d ~/.config/xmonad ] && sudo mkdir -p ~/.config/xmonad
pwd
sleep 10
cp -f $install_path/xmonad.hs ~/.config/xmonad/
sleep 10
