#!/bin/bash
mkdir -p /home/custompkgs
sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf 2>/dev/null || true
pacman -Sy --noconfirm git base-devel wget unzip fuse2 fuse3
cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd ~ && rm -rf /tmp/yay
pacman -Syu --noconfirm
pacman -S --noconfirm kitty steam firefox librewolf flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
flatpak install -y flathub dev.vencord.Vesktop
mkdir -p /home/me/.local/share/ACCELA /home/me/Desktop
curl -L https://github.com/swwayps/ACCELA/releases/latest/download/ACCELA.AppImage -o /home/me/.local/share/ACCELA/ACCELA.AppImage && chmod +x /home/me/.local/share/ACCELA/ACCELA.AppImage
mkdir -p /home/me/.local/share/applications
cat > /home/me/.local/share/applications/accela.desktop << EOF
[Desktop Entry]
Name=ACCELA Mod Manager
Exec=/home/me/.local/share/ACCELA/ACCELA.AppImage %F
Icon=application-x-executable
Terminal=false
Type=Application
Categories=Utility;Game;
EOF
cat >> /home/me/.bashrc << EOF
alias upd="pacman -Syu --noconfirm"
acela() { mkdir -p ~/.local/share/ACCELA; curl -L https://github.com/swwayps/ACCELA/releases/latest/download/ACCELA.AppImage -o \$HOME/.local/share/ACCELA/ACCELA.AppImage; chmod +x \$HOME/.local/share/ACCELA/ACCELA.AppImage; }
EOF
cat > ~/.inputrc << EOF
set show-all-if-unmodified on
set menu-complete-display-prefix on
"\e[Z": reverse-history-search
EOF
pacman -Syu --noconfirm
