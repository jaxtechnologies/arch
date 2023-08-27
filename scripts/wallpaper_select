clear

if [ -d "/usr/share/backgrounds/" ]; then
    PS3='Would you like to set a wallpaper? (enter number): '
    wallpapers=("xmonad.png" "qtile.png" "generic.png")
    select choice in "${wallpapers[@]}"; do
        case $choice in
             xmonad.png)
              	sudo xwallpaper --center /usr/share/backgrounds/xmonad.png
                break
                ;;
             qtile.png)
                sudo xwallpaper --center /usr/share/backgrounds/qtile.png
                break
                ;;
             generic.png)
                sudo xwallpaper --center /usr/share/backgrounds/generic.png
                break
                ;;
             *)
                echo "Invalid option $REPLY. You must choose a valid option."
                ;;
        esac
    done
fi
