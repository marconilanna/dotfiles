# ~/.bashrc

export PATH=$HOME/usr/bin:$PATH

export JAVA_HOME=/Library/Java/Home
export JAVA_OPTS="-server -Xss8m -Xms100m -Xmx1500m -XX:MaxPermSize=500m"
export CLASSPATH=.

export BLOCKSIZE=K
export PAGER='less'

alias ls='ls -AFGl'
alias dir='\ls -AFG'
alias cpl='clear; pwd; ls'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -pv'
alias mkdir='mkdir -pv'

alias df='df -H'
alias du='du -sc * | sort -n'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='grep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'

alias c='clear'
alias h='history'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'

alias gvim='gvim -reverse'

alias header='curl -I'

PS1='\h:\w\$ '

HISTIGNORE="bg:cd:clear:exit:fg:jobs:ls:ps:pwd:w"
HISTCONTROL=ignoredups
HISTFILESIZE=200000
HISTSIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

umask 0077

mesg n

# Git prompt
GP='/usr/local/git/contrib/completion/git-prompt.sh'
[ -r $GP ] && . $GP && PS1='\h:\w$(__git_ps1 " [%s]")\$ '

GIT_PS1_SHOWDIRTYSTATE=1

# Git tab completion
GTC='/usr/local/git/contrib/completion/git-completion.bash'
[ -r $GTC ] && . $GTC 

# Git aliases
alias add='        git add'
alias amend='      git commit --amend'
alias branch='     git branch'
alias commit='     git commit'
alias cont='       git rebase --continue'
alias cout='       git checkout'
alias cpick='      git cherry-pick'
alias dif='        git diff'
alias difftool='   git difftool'
alias fetch='      git fetch'
alias ignored='    git status --ignored'
alias list='       git stash list'
alias log='        git log --graph --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset %Cgreen%cr%Creset - %s%C(yellow)%d" --abbrev-commit --'
alias master='     git checkout master'
alias merg='       git merge'
alias pop='        git stash pop'
alias pull='       git pull --rebase '
alias push='       git push'
alias push-branch='git push -u origin'
alias rebase='     git rebase -i'
alias revert='     git revert'
alias rlog='       git reflog'
alias show='       git stash show -p'
alias staged='     git diff --staged'
alias stash='      git stash save'
alias status='     git status'
alias unstage='    git reset HEAD'
