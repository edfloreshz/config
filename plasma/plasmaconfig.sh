# KDE Plasma Configuration Script
# Author: Eduardo Flores <edfloreshz@gmail.com>

# Functions
  # Sets shortcuts
    # set_shortcut <group> <key> <value>
    set_shortcut() {
      shortcut=$(kreadconfig5 --file $HOME/.config/kglobalshortcutsrc --group $1 --key $2)
      kwriteconfig5 --file $HOME/.config/kglobalshortcutsrc --group $1 --key $2 "$3\t$shortcut"
    }
    # replace <text to replace> <replacement text> <file>
    replace() {
      sed -i -e "s#$1#$2#" $3
    }


# Plasma workspace configuration
echo "Configuring Plasma Desktop..."
  # Set Thunderbird as the default email reader... yeah, Thunderbird
    kwriteconfig5 --file $HOME/.config/emaildefaults --group "Defaults" --key "Profile" "Default"
    kwriteconfig5 --file $HOME/.config/emaildefaults --group "PROFILE_Default" --key "EmailClient" "/usr/bin/thunderbird %u"
    kwriteconfig5 --file $HOME/.config/emaildefaults --group "PROFILE_Default" --key "TerminalClient" --type "bool" "false"
  echo "Thunderbird set as default email reader."

  # Set "Lock screen automatically after" and "Allow unlocking without password for" to 60 minutes
  echo "Setting lock screen..."
    kwriteconfig5 --file  $HOME/.config/kscreenlockerrc --group 'Daemon' --key 'Timeout' '60'
    kwriteconfig5 --file  $HOME/.config/kscreenlockerrc --group 'Daemon' --key 'LockGrace' '60'
  echo "Lock screen configured."

  # Make the kate editor a little nicer
  echo "Setting up Kate..."
    kwriteconfig5 --file $HOME/.config/katerc --group "TipOfDay" --key "RunOnStart" false
    kwriteconfig5 --file $HOME/.config/katerc --group "General" --key "Show Full Path in Title" true
    kwriteconfig5 --file $HOME/.config/katerc --group "Kate Document Defaults" --key "Encoding" UTF-8
    kwriteconfig5 --file $HOME/.config/katerc --group "Kate Document Defaults" --key "ReplaceTabsDyn" true
    kwriteconfig5 --file $HOME/.config/katerc --group "Kate Document Defaults" --key "Tab Handling" 4
    kwriteconfig5 --file $HOME/.config/katerc --group "Kate Document Defaults" --key "Tab Width" 4
    kwriteconfig5 --file $HOME/.config/katerc --group "Kate Document Defaults" --key "Indentation Width" 4
    kwriteconfig5 --file $HOME/.config/katerc --group "Kate Document Defaults" --key "Word Wrap" false
    kwriteconfig5 --file $HOME/.config/katerc --group "Kate Document Defaults" --key "Newline At EOF" true
    kwriteconfig5 --file $HOME/.config/katerc --group "Kate Part Defaults" --key "Fallback Encoding" UTF-8
  echo "Kate set up."

  # Set titlebar buttons and screen edges as they should be.
  echo "Setting up KWin..."
    kwriteconfig5 --file $HOME/.config/kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft "M"
    kwriteconfig5 --file $HOME/.config/kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight "LIAX"
    kwriteconfig5 --file $HOME/.config/kwinrc --group Windows --key ElectricBorderCooldown "100"
    kwriteconfig5 --file $HOME/.config/kwinrc --group Windows --key ElectricBorderDelay "50"
    kwriteconfig5 --file $HOME/.config/kwinrc --group Windows --key Placement "Centered"
    kwriteconfig5 --file $HOME/.config/kwinrc --group MouseBindings --key CommandAllWheel "Shade/Unshade"
    kwriteconfig5 --file $HOME/.config/kwinrc --group MouseBindings --key CommandActiveTitlebar2 "Operations menu"
    kwriteconfig5 --file $HOME/.config/kwinrc --group MouseBindings --key CommandActiveTitlebar3 "Minimize"
    kwriteconfig5 --file $HOME/.config/kwinrc --group MouseBindings --key CommandInactiveTitlebar2 "Operations menu"
    kwriteconfig5 --file $HOME/.config/kwinrc --group MouseBindings --key CommandInactiveTitlebar3 "Minimize"
    kwriteconfig5 --file $HOME/.config/kwinrc --group TabBox --key LayoutName "big_icons"
    kwriteconfig5 --file $HOME/.config/kwinrc --group TabBox --key BorderActivate "9"
    kwriteconfig5 --file $HOME/.config/kwinrc --group TabBox --key ShowDesktopMode "1"
    kwriteconfig5 --file $HOME/.config/kwinrc --group Plugins --key kwin4_effect_translucencyEnabled "false"
    kwriteconfig5 --file $HOME/.config/kwinrc --group ElectricBorders --key BottomLeft "ApplicationLauncher"
    kwriteconfig5 --file $HOME/.config/kwinrc --group Effect-PresentWindows --key BorderActivateAll "3"
    kwriteconfig5 --file $HOME/.config/kwinrc --group Effect-DesktopGrid --key BorderActivate "7"
    kwriteconfig5 --file $HOME/.config/kwinrc --group Desktops --key Number "2"
    kwriteconfig5 --file $HOME/.config/kwinrc --group Desktops --key Rows "1"
  echo "KWin set."

  # Breeze
  echo "Setting up Breeze"
    kwriteconfig5 --file $HOME/.config/breezerc --group Style --key MenuOpacity "70"
    kwriteconfig5 --file $HOME/.config/breezerc --group Windeco --key DrawBorderOnMaximizedWindows "true"
  echo "Breeze set up."

  # Dolphin
  echo "Setting up Dolphin..."
    kwriteconfig5 --file $HOME/.config/dolphinrc --group MainWindow --key MenuBar "Disabled"
    kwriteconfig5 --file $HOME/.config/dolphinrc --group MainWindow --key ToolBarsMovable "Disabled"
    kwriteconfig5 --file $HOME/.config/dolphinrc --group MainWindow --key ToolBarsMovable "Disabled"
  echo "Dolphin set up."

  # Disable recent files
  echo "Disabling recent files..."
    kwriteconfig5 --file $HOME/.config/kdeglobals --group RecentDocuments --key UseRecent false
  echo "Recent files disabled."

  # Notifications
  echo "Setting up notifications to top right..."
    kwriteconfig5 --file $HOME/.config/plasmanotifyrc --group Notifications --key PopupPosition "TopRight"
    kwriteconfig5 --file $HOME/.config/plasmanotifyrc --group Notifications --key PopupTimeout= "3000"
  echo "Notifications set."

  # Shortcuts
  echo "Setting shortcuts"
    set_shortcut org.kde.spectacle.desktop RectangularRegionScreenShot Meta+Shift+S
    replace '\\\\' '\\' $HOME/.config/kglobalshortcutsrc
    replace 'Alt+Tab' 'Ctrl+Tab' $HOME/.config/kglobalshortcutsrc
    replace 'Alt+Shift+Tab' 'Ctrl+Shift+Tab' $HOME/.config/kglobalshortcutsrc
    replace 'Alt+`' 'Ctrl+`' $HOME/.config/kglobalshortcutsrc
    replace 'Alt+~' 'Ctrl+~' $HOME/.config/kglobalshortcutsrc
    # Refresh shortcuts
    kquitapp5 kglobalaccel && sleep 2s && kglobalaccel5 &
  echo "Shortcuts set."

  # Wallpaper
  echo "Setting wallpapers..."
    # Create wallpapers directory
    mkdir $HOME/Pictures/Wallpapers &>/dev/null
    # Download wallpaper
    if [ ! -f $HOME/Pictures/Wallpapers/wallpaper.jpg ];
    then
      curl -L https://images.unsplash.com/photo-1509462757601-b142a3aa6061 > $HOME/Pictures/Wallpapers/wallpaper.jpg &>/dev/null
    fi
    set wallpaper $HOME/Pictures/Wallpapers/wallpaper.jpg
    # Desktop Wallpapers
    qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops(); print (allDesktops); for (i=0;i<allDesktops.length;i++) {d = allDesktops[i]; d.wallpaperPlugin = "org.kde.image"; d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General"); d.writeConfig("Image", "$wallpaper")}'
    # Lock Screen
    kwriteconfig5 --file $HOME/.config/kscreenlockerrc --group "Greeter" --group "Wallpaper" --group "org.kde.image" --group "General" --key "Image" "file://$wallpaper"
    kwriteconfig5 --file $HOME/.config/plasmarc --group Wallpapers --key usersWallpapers "$HOME/Pictures/Wallpapers/wallpaper.jpg"
  echo "Wallpapers set."

  # Font
  echo "Setting up system fonts..."
    kwriteconfig5 --file $HOME/.config/kdeglobals --group General --key XftAntialias "true"
    kwriteconfig5 --file $HOME/.config/kdeglobals --group General --key XftHintStyle ""
    kwriteconfig5 --file $HOME/.config/kdeglobals --group General --key XftSubPixel "rgb"
  echo "System fonts set."

  # Terminal fonts
  # TOOD: Set Iosevka Term as default Konsole font.

  # Reload Plasma Desktop
  kquitapp5 plasmashell && sleep 2s && plasmashell &>/dev/null &
  echo "Plasma desktop reloaded."

