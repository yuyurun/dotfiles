source ~/.git-prompt.sh
source ~/.git-completion.bash
#source /usr/local/git/contrib/completion/git-prompt.sh
#source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='\[\033[32m\]\u@\h\[\037[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
export PS1='\[\033[1;35m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '
