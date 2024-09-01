#!/bin/bash

# Uninstall unnecessary apps
sudo su
apt remove --purge fcitx* mozc* xiterm+thai* mlterm* xterm* kasumi* gnome-terminal* gnome-games* -y
apt remove --purge im* goldendict* hdate* uim* libreoffice-* rhythmbox gnome-music totem gnome-weather cheese synaptic -y
apt remove shotwell gnome-clocks gnome-user-docs gnome-contacts gnome-calendar gnome-characters transmission gnome-console gnome-sushi -y
apt remove gnome-software gnome-maps gnome-tweaks gnome-disk-utility gnome-sudoku gnome-mahjongg gnome-nibbles gnome-tetravex
apt remove gnome-dictionary gnome-font-viewer gnome-color-manager gnome-photos

apt autoremove
mv /usr/share/applications/nm-connection-editor.desktop /usr/share/applications/nm-connection-editor.disable
mv /usr/share/applications/software-properties-gtk.desktop /usr/share/applications/software-properties-gtk.disable

# Theme
apt install git
cd Downloads && git clone https://github.com/vinceliuice/Lavanda-gtk-theme.git
cd Lavanda-gtk-theme && chmod +x install.sh && .\install.sh
gsettings set org.gnome.desktop.interface gtk-theme 'Lavanda-Sea-Dark'

cd Downloads && git clone https://github.com/vinceliuice/Colloid-icon-theme.git
cd Colloid-icon-theme && chmod +x install.sh && .\install.sh
gsettings set org.gnome.desktop.interface icon-theme 'Colloid-Dark'

# Fix Nautilus
mkdir ~/.config/gtk-40
cp ~/.themes/Lavanda-Sea-Dark/gtk-4.0/*.* ~/.config/gtk-40

gnome-shell --replace &

# config my additional disk
echo "# HD secundário" >> /etc/fstab
echo "UUID=\"CEC8C378C8C35CF9\"		/media/500GB	ntfs	0	0	default" >> /etc/fstab

# Configure Flatpak support
apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Flatpak apps
flatpak install flathub dev.zed.Zed
flatpak install flathub org.gnome.Boxes

echo "Script finish!!"
