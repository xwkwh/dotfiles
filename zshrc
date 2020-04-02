# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export LC_ALL=zh_CN.UTF-8


# Path to your oh-my-zsh installation.
export ZSH="/Users/xwk/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="myys"


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias gopath="cd /Users/xwk/gopath/src/"
alias hello="cd /Users/xwk/gopath/src/hello"
alias e='emacs -nw'
alias vimgo='vim -u ~/.vimrc.go'
alias wx='nohup /Applications/WeChat.app/Contents/MacOS/WeChat > /dev/null 2>&1 &'

export PATH=/bin:/usr/bin:/usr/local/bin:$PATH

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.bash_profile



export PATH=~/go/bin:/usr/local/bin:$PATH
#alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias eme='emacs -nw'
alias ems='emacs --daemon&'
alias emc='emacsclient -c '
alias emt='emacsclient -t '
alias ec="emacsclient -e '(kill-emacs)'"

alias sql='/Users/xwk/Work.localized/baolei.exp 73.56'
alias baolei='/Users/xwk/Work.localized/baolei_ssh.exp'
alias gomodon='export GO111MODULE=on'


export HOMEBREW_NO_AUTO_UPDATE=1 # install时不自动update 
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles


vterm_prompt_begin() {
      print -Pn "\e]51;C\e\\"
}
vterm_prompt_end() {
      print -Pn "\e]51;A$(pwd)\e\\"
}
PROMPT='%{$(vterm_prompt_begin)%}'$PROMPT'%{$(vterm_prompt_end)%}'

# for bash
# PS1='\[\033]0;\u@\H:\w\007\]\$ '

# for emacs term.el
HOSTNAME=$(uname -n)
USER=$(whoami)
case $TERM in
    dumb)
        #在 Emacs终端 中使用 Zsh 的一些设置 及Eamcs tramp sudo 远程连接的设置
        prompt='%1/ %(!.#.$) '
        unsetopt zle
        unsetopt prompt_cr
        unsetopt prompt_sp
        unsetopt prompt_subst
        # unfunction precmd
        # unfunction preexec
        PS1='$ '
        ;;
    (*xterm*|*rxvt*|(dt|k)term*))
        autoload -U add-zsh-hook
        add-zsh-hook -Uz chpwd (){
            # https://www.xfree86.org/current/ctlseqs.html
            # https://www.iterm2.com/documentation-escape-codes.html
            # https://wiki.bash-hackers.org/scripting/terminalcodes
            # https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
            # print -Pn "\e]51;$(pwd)\e\\";
            print -Pn "\e]2;%2~\a" #s
            # ESC]0;stringBEL — Set icon name and window title to string
            # ESC]1;stringBEL — Set icon name to string
            # ESC]2;stringBEL — Set window title to string
            # print -Pn "\e]2;%2~\a" #set title path  chpwd里取不到当前cmd
        }
        add-zsh-hook -Uz preexec(){
            print -Pn "\e]51;B\e\\";
        }
        ;;
esac

