RELEASE="15.5.2"
mkdir /tmp/iosevka-font/$RELEASE
cd /tmp/iosevka-font/$RELEASE

wget https://github.com/be5invis/Iosevka/releases/download/v$RELEASE/ttf-iosevka-term-$RELEASE.zip

unzip \*.zip

sudo mkdir /usr/local/share/fonts/iosevka-font
sudo mv *.ttf /usr/local/share/fonts/iosevka-font/.

sudo fc-cache -fv
