zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

#vs code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#flutter
export PATH="$PATH:/Users/felix/flutter/bin"

#npm
export PATH=/usr/local/share/npm/bin:$PATH

#AFTER CHANGE run
alias cu="source ~/.zshrc"

#https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%r%f'
zstyle ':vcs_info:*' enable git

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{yellow}%3~%f%b $vcs_info_msg_0_%F{magenta} %#%f '

alias home='cd ~'
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias cs="vim ~/.zshrc"			    # cs: view and edit config file from anywhere

#https://gist.githubusercontent.com/natelandau/10654137/raw/32eb964560873a8c23d7745de2736bef437524ba/.bash_profile

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cl() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cl' == cd + ll
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
#alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside

#git commands
alias gs='git status'
alias gadd='git add'
alias ga='git add .'
alias gc='git commit'
alias gcam='git commit -a -m'
alias gp='git push'
alias gpi='git push --set-upstream origin'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --all --decorate --oneline --graph -n 30'
alias gpf='git push --force-with-lease'
alias gm='git merge --ff-only'

# -x86_64 commands
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'
alias aintel="arch -x86_64"

# cd notes and pull
alias notes='cd ~/notes && git pull'
