### DOTFILE CONFIGS ###
alias zconfig='nvim ~/.zshrc' # Edit .zshrc in Neovim
alias nvimconfig='nvim ~/.config/nvim/init.lua' # Edit init.lua in Neovim
alias zsource='source ~/.zshrc' # Refresh .zshrc
alias aliases='nvim ~/.config/zsh/.zsh/.aliases.zsh' # Edit ZSH aliases

### NEOVIM
alias nv="nvim"
alias svim="sudo -E nvim" # Open file in neovim with user config as sudo

### HYPRLAND
alias hlr='nvim ~/.config/hypr/'
alias hlc='nvim ~/.config/hypr/hyprland.conf' # Open hyprland configs in nvim
alias wbc='nvim ~/.config/waybar/config.jsonc'
alias wbs='nvim ~/.config/waybar/style.css'

### eza (better ls) ###
alias l='eza --icons=always' # List one entry per line with icons
alias la='eza -lagoMF --icons --group-directories-first --hyperlink --git --git-repos --time-style long-iso' # Display extended file metadata as a table w/ folders at top
alias lsd='eza -gF --icons --group-directories-first --hyperlink' # Display default
alias lm='eza -lagoMF -s modified --icons --group-directories-first --hyperlink --git --git-repos --time-style long-iso' # Display last modified first
alias ls='eza --icons=always' # Default table view
alias ll='eza -lg --icons=always' # Basic list with icons
alias tree='eza -lTg --level=2 --icons=always' # List tree w/ 2 levels
alias lt3='eza -lTg --level=3 --icons=always' # List tree w/ 3 levels
alias lta3='eza -lTag --level=3 --icons=always' # List all contents w/ 3 levels

### GIT ###
alias gs='git status' # Check status of git branch
alias grm='git remote'
alias gp='git add . && git commit -m "auto push" && git push' # Add all, commit with message "auto push" and push to repo
alias gc='git clone' # Clone repository
alias gac='git add . && git commit' # Add all changes and commit
alias gch='git checkout' # Checkout branch
alias gpom='git pull origin master' # Pull from master branch
alias ga='git add' # Add file changes
alias gitdot='git add ~/.dotfiles .' # Add all dotfiles

### PACMAN ###
alias i="sudo pacman -S"

### SSH ###
alias empire1='ssh root@100.103.69.59' # Tailscale SSH login
alias empire2='ssh root@empire.trex-scala.ts.net' # Tailscale SSH login custom DNS
alias empire3='ssh root@empire.local' # Local SSH without Tailscale
alias empiremedia='root@100.103.69.59/mnt/user/media' # Tailscale location of media on cache drive
alias empiredata='root@100.103.69.59/mnt/user/data' # Tailscale location of data on cache drive
alias pilgrim='mosh root@shinjuru-vps.trex-scala.ts.net' # Shinjiru VPS login on Tailnet

### NETWORKING ###
alias flushdns='sudo killall -HUP mDNSResponder'

### RSYNC ###
alias sync='rsync -avh --delete --progress'

### CLI PROGRAMS ###
alias nb='newsboat' # Open RSS reader
alias n='nvim' # Open file or folder in Neovim
alias music='ferrosonic'

### CURLS ###
alias weather='curl http://wttr.in/allentown'
alias moon='curl wittr.in/moon'
alias crypto='curl rate.sx'
alias btc='curl rate.sx/btc'
alias eth='curl rate.sx/eth'

### MISC ###
alias reboot='umount -a -t cifs -l -f 2>/dev/null && reboot'
alias todo='nvim ~/.dotfiles/todo.md'
alias c='clear'
