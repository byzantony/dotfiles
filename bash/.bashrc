#
# ~/.bashrc
#
#If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

## Set default shell to ZSH
exec zsh

neofetch

### Aliases

alias ls="ls --color"
alias ll="ls --color -lh"
alias la="ls --color -a"
alias pacs="pacsearch"
alias vim="vim -y"
alias nano="nano -w"

### Dotfile git alias hook:
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

### Colorize pacman

pacsearch () {
           echo -e "$(pacman -Ss $@ | sed 
                 -e 's#current/.*#\033[1;31m&\033[0;37m#g' 
                 -e 's#extra/.*#\033[0;32m&\033[0;37m#g' 
                 -e 's#community/.*#\033[1;35m&\033[0;37m#g' 
                 -e 's#^.*/.* [0-9].*#\033[0;36m&\033[0;37m#g' )"
             }
        
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

neofetch
alias dotfiles='/usr/bin/git --git-dir=/home/tsar/.dotfiles/ --work-tree=/home/tsar'
