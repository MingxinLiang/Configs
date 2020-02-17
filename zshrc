# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# export path
# alias
alias complete="compctl"
#alias shopt="setopt"

# get bash set
source ~/.bashrc
# source ~/.bash_profile

# Themes
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(
#git brew node npm zsh-autosuggestions zsh-syntax-highlighting
#)

source $ZSH/oh-my-zsh.sh

#You may need to manually set your language environment
#export LC_ALL=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

# �������� 
#color{{{
autoload colors
colors

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval $color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
FINISH="%{$terminfo[sgr0]%}"
#}}}

#������ʾ��
#RPROMPT=$(echo "$RED%D %T$FINISH")
#PROMPT=$(echo "$CYAN%n@$YELLOW%m:$GREEN%c$_YELLOW>$FINISH ")

#�༭��
export EDITOR=vim
#���뷨
export XMODIFIERS="@im=ibus"
export QT_MODULE=ibus
export GTK_MODULE=ibus
#������ʷ��¼������ {{{
#��ʷ��¼��Ŀ����
export HISTSIZE=10000
#ע���󱣴����ʷ��¼��Ŀ����
export SAVEHIST=10000
#��ʷ��¼�ļ�
export HISTFILE=~/.zhistory
#�Ը��ӵķ�ʽд����ʷ��¼
setopt INC_APPEND_HISTORY
#������������������ͬ����ʷ��¼��ֻ����һ��
setopt HIST_IGNORE_DUPS
#Ϊ��ʷ��¼�е���������ʱ���
setopt EXTENDED_HISTORY

#���� cd �������ʷ��¼��cd -[TAB]������ʷ·��
setopt AUTO_PUSHD
#��ͬ����ʷ·��ֻ����һ��
setopt PUSHD_IGNORE_DUPS

#ÿ��Ŀ¼ʹ�ö�������ʷ��¼{{{
cd() {
    builtin cd "$@"                             # do actual cd
    fc -W                                       # write current history  file
    local HISTDIR="$HOME/.zsh_history$PWD"      # use nested folders for history
    if  [ ! -d "$HISTDIR" ] ; then          # create folder if needed
        mkdir -p "$HISTDIR"
    fi
    export HISTFILE="$HISTDIR/zhistory"     # set new history file
    touch $HISTFILE
    local ohistsize=$HISTSIZE
    HISTSIZE=0                              # Discard previous dir's history
    HISTSIZE=$ohistsize                     # Prepare for new dir's history
    fc -R                                       #read from current histfile
}
mkdir -p $HOME/.zsh_history$PWD
export HISTFILE="$HOME/.zsh_history$PWD/zhistory"

function allhistory { cat $(find $HOME/.zsh_history -name zhistory) }
function convhistory {
    sort $1 | uniq |
        sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |
        awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print }'
}
#ʹ�� histall ����鿴ȫ����ʷ��¼
function histall { convhistory =(allhistory) |
    sed '/^.\{20\} *cd/i\\' }
#ʹ�� hist �鿴��ǰĿ¼��ʷ��¼
function hist { convhistory $HISTFILE }

#���� {{{
#�����ڽ���ģʽ��ʹ��ע��  ���磺
#cmd #����ע��
setopt INTERACTIVE_COMMENTS

#�����Զ� cd������Ŀ¼���س�����Ŀ¼
#��΢�е���ң����� cd ��ȫʵ��
setopt AUTO_CD

#�Զ���ȫѡ��
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

#·����ȫ
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

#��ɫ��ȫ�˵�
#eval $(dircolors -b)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#������Сд
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

#kill ���ȫ
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

# cd ~ ��ȫ˳��
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
#}}}

##�б༭����ģʽ {{{
# Ctrl+@ ���ñ�ǣ���Ǻ͹���֮��Ϊ region
zle_highlight=(region:bg=magenta #ѡ������
special:bold      #�����ַ�
isearch:underline)#����ʱʹ�õĹؼ���
#}}}

##����(���������)��ȫ "cd " {{{
user-complete(){
case $BUFFER in
    "" )                       # �������� "cd "
        BUFFER="cd "
        zle end-of-line
        zle expand-or-complete
        ;;
    "cd --" )                  # "cd --" �滻Ϊ "cd +"
        BUFFER="cd +"
        zle end-of-line
        zle expand-or-complete
        ;;
    "cd +-" )                  # "cd +-" �滻Ϊ "cd -"
        BUFFER="cd -"
        zle end-of-line
        zle expand-or-complete
        ;;
    * )
        zle expand-or-complete
        ;;
esac
}
zle -N user-complete
bindkey "\t" user-complete
#}}}

#[Esc][h] man ��ǰ����ʱ����ʾ���˵��
alias run-help >&/dev/null && unalias run-help
autoload run-help

#Ư����ʵ�õ������������
setopt extended_glob
TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

recolor-cmd() {
region_highlight=()
colorize=true
start_pos=0
for arg in ${(z)BUFFER}; do
    ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
    ((end_pos=$start_pos+${#arg}))
    if $colorize; then
        colorize=false
        res=$(LC_ALL=C builtin type $arg 2>/dev/null)
        case $res in
            *'reserved word'*)   style="fg=magenta,bold";;
            *'alias for'*)       style="fg=cyan,bold";;
            *'shell builtin'*)   style="fg=yellow,bold";;
            *'shell function'*)  style='fg=green,bold';;
            *"$arg is"*)
                [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
            *)                   style='none,bold';;
        esac
        region_highlight+=("$start_pos $end_pos $style")
    fi
    [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
    start_pos=$end_pos
done
 }
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

zle -N self-insert check-cmd-self-insert
zle -N backward-delete-char check-cmd-backward-delete-char

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

export PATH="/usr/local/opt/ncurses/bin:$PATH"
alias irelay="ssh liangmingxin@relay.baidu-int.com"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /Users/liangmingxin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/liangmingxin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh