setopt EXTENDED_GLOB

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

fpath=(~/zsh-completions/src $fpath)

# # BEGIN oh-my-zsh {{{

# # # Path to your oh-my-zsh installation.
# # export ZSH=$HOME/.oh-my-zsh

# # # Set name of the theme to load.
# # # Look in ~/.oh-my-zsh/themes/
# # # Optionally, if you set this to "random", it'll load a random theme each
# # # time that oh-my-zsh is loaded.
# # ZSH_THEME="robbyrussell"

# # # Uncomment the following line to use case-sensitive completion.
# # # CASE_SENSITIVE="true"

# # # Uncomment the following line to disable bi-weekly auto-update checks.
# # # DISABLE_AUTO_UPDATE="true"

# # # Uncomment the following line to change how often to auto-update (in days).
# # # export UPDATE_ZSH_DAYS=13

# # # Uncomment the following line to disable colors in ls.
# # # DISABLE_LS_COLORS="true"

# # # Uncomment the following line to disable auto-setting terminal title.
# # # DISABLE_AUTO_TITLE="true"

# # # Uncomment the following line to enable command auto-correction.
# # # ENABLE_CORRECTION="true"

# # # Uncomment the following line to display red dots whilst waiting for completion.
# # # COMPLETION_WAITING_DOTS="true"

# # # Uncomment the following line if you want to disable marking untracked files
# # # under VCS as dirty. This makes repository status check for large repositories
# # # much, much faster.
# # # DISABLE_UNTRACKED_FILES_DIRTY="true"

# # # Uncomment the following line if you want to change the command execution time
# # # stamp shown in the history command output.
# # # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# # # HIST_STAMPS="mm/dd/yyyy"

# # # Would you like to use another custom folder than $ZSH/custom?
# # # ZSH_CUSTOM=/path/to/new-custom-folder

# # # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# # # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# # # Example format: plugins=(rails git textmate ruby lighthouse)
# # # Add wisely, as too many plugins slow down shell startup.
# # plugins=(colored-man common-aliases cp dircycle extract git history-substring-search mercurial python)
# # #dirhistory

# # source $ZSH/oh-my-zsh.sh

# # User configuration

# # export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# # if [[ -n $SSH_CONNECTION ]]; then
# #   export EDITOR='vim'
# # else
# #   export EDITOR='mvim'
# # fi

# # Compilation flags
# # export ARCHFLAGS="-arch x86_64"

# # ssh
# # export SSH_KEY_PATH="~/.ssh/dsa_id"

# # Set personal aliases, overriding those provided by oh-my-zsh libs,
# # plugins, and themes. Aliases can be placed here, though oh-my-zsh
# # users are encouraged to define aliases within the ZSH_CUSTOM folder.
# # For a full list of active aliases, run `alias`.
# #
# # Example aliases
# # alias zshconfig="mate ~/.zshrc"
# # alias ohmyzsh="mate ~/.oh-my-zsh"

# # END oh-my-zsh }}}

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=vim

# -2 arg to tmux means "Use 256 colors w/o trying to guess whether
# they're available or not" (this guessing seems to fail under
# some terminals, mintty in particular)
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux -2 attach
fi

# To get fasd working in a shell, some initialization code must be run
eval "$(fasd --init auto)"

# @FIXME remove partially-absolute path (dotfiles)
OS_NAME=$(~/dotfiles/get_os.sh)
case $OS_NAME in
  cygwin)
	# export CC=/usr/bin/clang.exe
	# export CXX=/usr/bin/clang++
	set LC_ALL=ru_RU.UTF-8
	export LESS="-R"
	export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
    ;;
  linux)
	export LESS="-R"
	export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
    ;;
esac

# ls automatically after changing dirs
function chpwd() {
    emulate -L zsh
    ls -A
}

# Very cool - allows to always run Vim in a single instance and
# automatically open new files from shell in this instance.
# Stolen from: http://vim.wikia.com/wiki/Enable_servername_capability_in_vim/xterm
# Original comments follow:
# "Function for always using one (and only one) vim server, even when not
# using gvim.
# If you really want a new vim session, simply do not pass any
# argument to this function"
# @TODO: make work. At the very least, the vim currently installed doesn't have clientserver
# functionality
# function vim {
#   vim_orig=$(which 2>/dev/null vim)
#   if [ -z $vim_orig ]; then
#     echo "$SHELL: vim: command not found"
#     return 127;
#   fi
#   $vim_orig --serverlist | grep -q VIM
#   # If there is already a vimserver, use it
#   # unless no args were given
#   if [ $? -eq 0 ]; then
#     if [ $# -eq 0 ]; then
#       $vim_orig
#     else
#       $vim_orig --remote "$@"
#     fi
#   else
#     $vim_orig --servername vim "$@"
#   fi
# }
