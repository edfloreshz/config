RELEASE="17.1.0"
mkdir -p /tmp/iosevka-font/$RELEASE
cd /tmp/iosevka-font/$RELEASE

wget https://github.com/be5invis/Iosevka/releases/download/v$RELEASE/ttf-iosevka-term-$RELEASE.zip

unzip \*.zip

sudo mkdir /usr/local/share/fonts/iosevka-term
A | sudo mv --force *.ttf /usr/local/share/fonts/iosevka-term/
sudo chown -R root: /usr/local/share/fonts/iosevka-term
sudo chmod 644 /usr/local/share/fonts/iosevka-term/*
sudo restorecon -vFr /usr/local/share/fonts/iosevka-term

sudo fc-cache -v
