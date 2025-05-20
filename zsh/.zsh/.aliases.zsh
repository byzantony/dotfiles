### dotfile configs ###
alias zconfig='nvim ~/.dotfiles/zsh/.zshrc' # Edit .zshrc in Neovim
alias zconfigcode='zed ~/.dotfiles/zsh/.zshrc' # Edit .zshrc in Zed
alias nvimconfig='nvim ~/.dotfiles/nvim/init.lua' # Edit init.lua in Neovim
alias wezconfig='nvim ~/.dotfiles/wezterm/.wezterm.lua' # Edit .wezterm.lua
alias zsource='source ~/.dotfiles/zsh/.zshrc' # Refresh .zshrc
alias aliases='nvim ~/.dotfiles/zsh/.zsh/.aliases.zsh' # Edit ZSH aliases
alias dotfiles='nvim ~/.dotfiles' # Open dotfiles directory in Neovim


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

### Desktop Navigatgion ###
alias reloadbar='sketchybar --reload' # Reloads sketchybar

### git ###
alias gs='git status' # Check status of git branch
alias grm='git remote'
alias gp='git add . && git commit -m "auto push" && git push' # Add all, commit with message "auto push" and push to repo
alias gc='git clone' # Clone repository
alias gac='git add . && git commit' # Add all changes and commit
alias gch='git checkout' # Checkout branch
alias gpom='git pull origin master' # Pull from master branch
alias ga='git add' # Add file changes

### Homebrew ###
alias brew-sync="~/.dotfiles/scripts/sync_brewfile.sh" # Runs Brewfile sync

### Server Admin ###
alias empire1='ssh root@100.103.69.59' # Tailscale SSH login
alias empire2='ssh root@empire.trex-scala.ts.net' # Tailscale SSH login custom DNS
alias empire3='ssh root@empire.local' # Local SSH without Tailscale
alias empiremedia='root@100.103.69.59/mnt/user/media' # Tailscale location of media on cache drive
alias empiredata='root@100.103.69.59/mnt/user/data' # Tailscale location of data on cache drive

### Networking ###
alias flushdns='sudo killall -HUP mDNSResponder'

### rsync ###
alias sync='rsync -avh --delete --progress'

### Terminal programs ###
alias nb='newsboat' # Open RSS reader
alias n='nvim' # Open file or folder in Neovim

### Curls ###
alias weather='curl http://wttr.in/allentown'
alias moon='curl wittr.in/moon'
alias crypto='curl rate.sx'
alias btc='curl rate.sx/btc'
alias eth='curl rate.sx/eth'

### Misc ###
alias todo='nvim ~/.dotfiles/todo.md'
alias vim='nvim'
alias c='clear'

