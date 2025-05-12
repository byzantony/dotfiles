###### Tony's Cool Zoomer Shell config  ######
#
#
#       ̿̿ ̿'̿'\̵͇̿̿\з= ( ▀ ͜͞ʖ▀) =ε/̵͇̿̿/’̿’̿ ̿ ̿̿ ̿̿ ̿̿
#
#	   bash boomers BTFO
#
#############################################

#ufetch
neofetch

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tsar/.zshrc'
autoload -Uz compinit
compinit

export PATH=$PATH:/home/dev/check

# End of lines added by compinstall
#
# Prompt ZSH
#autoload -U promptinit; promptinit
#prompt spaceship

autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

##### Aliases for the Zoomer shell #####
#--------------------------------------#

## dotfiles ##
alias v='sudo -E vim'
alias zshconfig='v ~/.zshrc'
alias bootstrap='v .bootstrap.sh'
alias termconfig='v ~/.config/alacritty/alacritty.yml'
alias zsource='source ~/.zshrc'
alias vimconfig='v ~/.vimrc'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

## Package management ##
alias p='sudo pacman -S'
alias y='yay -S'
alias pr='sudo pacman -Rs'
alias pu='sudo pacman -Syu'
	
## Git ##
alias gs='git status'
alias grm='git remote'
alias gp='git add . && git commit -m "auto push" && git push'
alias gc='git clone'
alias gac='git add . && git commit'
alias gch='git checkout'
alias gpom='git pull origin master'
alias ga='git add'

## dotfiles git ##
alias dp='dotfiles add . && dotfiles commit -m "auto push" && dotfiles push'
alias da='dotfiles add'
alias dcm='dotfiles commit -m'
alias dp='dotfiles push'
alias ds='dotfiles status'

## Term programs ##
alias nb='newsboat'
alias code='vscodium'

## i3 ##
alias i3-config='v ~/.config/i3/config'
alias i3-logout='i3-msg exit'
alias i3-reload='i3-msg reload'
alias newlock='betterlockscreen -u ~/Pictures/Wallpaper/*'

## System ##
alias monitors='xrandr -q | grep " connected" | cut -d ' ' -f1'
alias vpnc='sudo protonvpn c -f'
alias vpnd='sudo protonvpn d'

## Curls ##
alias weather='curl http://wttr.in/allentown'
alias corunka='curl https://corona-stats.online/states/us'
alias moon='curl wittr.in/moon'
alias crypto='curl rate.sx'
alias btc='curl rate.sx/btc'
alias eth='curl rate.sx/eth'

alias todo='v todo.txt'
