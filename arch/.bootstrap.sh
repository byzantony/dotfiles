### Big brain script to install arch packages. #

echo '༼ つ ◕_◕ ༽つ Updating your system. Go grab a drink, this may take a while.'

## Update packages
sudo pacman -Syyu

echo '༼ つ ͡° ͜ʖ ͡° ༽つ System update complete. Now installing your packages.'

## Developer tools
sudo pacman -S --needed git base-devel --noconfirm
yay -S git-credential-manager-core-bin
sudo pacman -S vim --noconfirm
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo vim +PluginInstall +qall

## Fonts
sudo pacman -S noto-fonts ttf-hack ttf-fira-code noto-fonts-emoji ttf-font-awesome papirus-icon-theme 
yay -S cryptocoins-git

## System tools
sudo pacman -S gparted --noconfirm
sudo pacman -S cmake --noconfirm
sudo pacman -S neofetch --noconfirm
sudo pacman -S picom --noconfirm
sudo pacman -S lxappearance --noconfirm
sudo pacman -S flameshot --noconfirm
sudo pacman -S imagemagick --noconfirm

## Productivity
sudo pacman -S libreoffice-still --noconfirm
sudo pacman -S thunderbird --noconfirm
sudo pacman -S newsboat

## Terminal Emulator with ZSH
sudo pacman -S alacritty --noconfirm
sudo pacman -S zsh zsh-completions --noconfirm

## yay and pikaur package managers (Arch User Repo)
git blone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -Rf yay
sudo pacman -S --needed base-devel git && git clone https://aur.archlinux.org/pikaur.git && cd pikaur && makepkg -fsri && cd .. && rm -Rf pikaur


## Themeing
sudo yay -S themix-gui-git --no-confirm  
sudo pacman -S feh --noconfirm
yay -S betterlockscreen && betterlockscreen -u ~/Pictures/Wallpaper
sudo pacman -S rofi --noconfirm
sudo pacman -S polybar
yay -S gtk-engine-murrine
pikaur -S themix-full-git
sudo pacman -S dunst

## Browser install
yay -S brave-bin
sudo pacman -S firefox

## Multimedia
sudo pacman -S vlc --noconfirm
sudo pacman -S pulseaudio --noconfirm
sudo pacman -S projectm-pulseaudio --noconfirm
sudo pacman -S qbittorrent --noconfirm
sudo pacman -S mpd mpc ncmpcpp --noconfirm
yay -S soundux
yay -S youtube-dl-cli-git --noconfirm
## Install Suckless software
#git clone https://git.suckless.org/dmenu && cd dmenu && sudo make clean install && cd ..

## File Navigation
sudo pacman -S ranger --noconfirm
sudo pacman -S pcmanfm --noconfirm

## X utilities
#sudo pacman -S xorg-xset xorg-xrandr xorg-xpdyinfo --noconfirm 

## Security / Privacy
sudo pacman -S keepassxc --noconfirm
sudo pacman -S nextcloud-client --noconfirm
sudo pacman -S openvpn --noconfirm
yay -S ledger-live
pamac build protonvpn-cli-ng

## Communication
sudo pacman -S discord --noconfirm
sudo pacman -S telegram --noconfirm
sudo pacman -S nicotine+ --noconfirm
yay -S telegram-desktop-bin --noconfirm #This still has confirmation. Look into yay noconfirm tags
sudo pacman -S element-desktop

## Install the Bible
git clone https://github.com/lukesmithxyz/kjv.git && cd kjv && sudo make install && cd .. && rm -Rf kjv

#bspwm
sudo pacman -S bspwm
sudo pacman -S sxhkd

## i3WM Config
## *Imports custom config files from dotfiles directory
sudo pacman -S i3-wm i3-gaps i3status i3lock --noconfirm 
yay -S autotiling
yay -S skippy-xd-git
yay -S i3blocks-git
sudo pacman -S i3blocks --noconfirm
sudo git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks && cd !$ && cp config.example config && cd ~/

echo "Installing dotfiles for you based configs, sir."

# This script will automatically install configs
git clone --bare https://github.com/tonyynot/dotfiles.git $HOME/.dotfiles
function dotfiles {
       /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
   }
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
	echo "Checked out dotfiles.";
	else
	
        echo "Backing up pre-existing dot files.";
	dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no

echo 'Package installation complete. Enjoy your system, King.'
echo '
⊂_ヽ
　 ＼＼
　　 ＼( ͡° ͜ʖ ͡°)
　　　 >　⌒ヽ
　　　/ 　 へ＼
　　 /　　/　＼＼
　　 ﾚ　ノ　　 ヽ_つ
　　/　/
　 /　/|
  (　(ヽ
　|　|、＼
　| 丿 ＼ ⌒)
　| |　　) /
ノ )　　Lﾉ
(_／'
