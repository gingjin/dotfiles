#!/bin/sh

# xorg
sudo pacman -S udev xorg-server xorg-apps xf86-video-intel xorg-drivers xf86-input-libinput xorg-xinput xorg-xinit xorg-xrdb xorg-xclipboard

sudo touch /etc/X11/xorg.conf.d/30-touchpad.conf
echo 'Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on" # 触摸以点击
    # Option "NaturalScrolling" "true" # 自然滚动(反方向滚动)
    Option "TappingButtonMap" "lrm" # 左(单指) 右(双指) 中(三指)
EndSection' | sudo tee -a /etc/X11/xorg.conf.d/30-touchpad.conf

# bspwm
sudo pacman -S bspwm sxhkd

sudo pacman -S htop lazygit tig flameshot copyq mpv ranger w3m ueberzug fd fzf alacritty rofi polybar feh pulseaudio mpd mpc ncmpcpp pamixer dolphin breeze-icons kdeconnect nomacs qtcreator timeshift xclip dmidecode ntfs-3g trash-cli

sudo pacman -S gimp inkscape

sudo pacman -S wget curl axel motrix

sudo pacman -S atool ark unzip zip tar libarchive binutils cpio bzip2 gzip lrzip lz4 lzip lzop xz zstd p7zip unrar unarchiver

sudo pacman -S zathura zathura-djvu zathura-pdf-mupdf zathura-ps zathura-cb

# 中文字体
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
sudo pacman -S nerd-fonts-complete
yay ttf-material-design-icons-git

# 中文输入法
sudo pacman -S fcitx5-im fcitx5-configtool fcitx5-qt fcitx5-gtk fcitx5-lua fcitx5-rime

# 谷歌浏览器
sudo pacman -S chromedriver
yay google-chrome

# 用户目录
sudo pacman -S xdg-user-dirs
xdg-user-dirs-update

# 添加鼠标样式
git clone https://github.com/alvatip/Sunity-cursors.git
cd Sunity-cursors
sudo ./install.sh

# chezmoi
sudo pacman -S chezmoi
chezmoi init https://github.com/gingjin/dotfiles.git
chezmoi apply

# nvim
sudo pacman -S nvim-packer-git go julia uncrustify js-beautify prettier stylua autopep8 lua-language-server pyright bash-language-server yarn npm
yay texlive-latexindent-meta

# latex
sudo pacman -S texlive-most texlive-core texlive-latexextra texlive-lang texlive-langextra texlive-bibtexextra texlive-fontsextra biber

# 有道翻译
yay youdao-dict

# wps
yay wps-office-cn
yay wps-office-mui-zh-cn
yay ttf-wps-fonts

# sagemath 科学计算
yay sagemath
