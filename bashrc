# ~/.bashrc

export PATH=$HOME/usr/bin:/usr/local/git/bin:/usr/local/mysql/bin:$PATH

export JAVA_HOME=/Library/Java/Home
export JAVA_OPTS="-server -Xss8m -Xms100m -Xmx1500m -XX:MaxPermSize=500m"
export CLASSPATH=.

export ANT_HOME=$HOME/usr/ant

export BLOCKSIZE=K
export PAGER='less'

alias ls='ls -AFGl'
alias dir='\ls -AFG'
alias cpl='clear; pwd; ls'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias grep='grep --color=auto'

alias h='history'
alias ..='cd ..'

alias gvim='gvim -reverse'

alias curlhead='curl -o /dev/null -s -D -'

PS1='\h:\w$(__git_ps1 " [%s]")\$ '

HISTIGNORE="bg:cd:clear:exit:fg:jobs:ls:ps:pwd:w"
HISTCONTROL=ignoredups
HISTFILESIZE=200000
HISTSIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

umask 0077

mesg n

# Git tab completion
GTC='/usr/local/git/contrib/completion/git-completion.bash'
[ -r $GTC ] && . $GTC 

# Git aliases
alias add='     git add'
alias amend='   git commit --amend'
alias branch='  git branch'
alias commit='  git commit'
alias cout='    git checkout'
alias cpick='   git cherry-pick'
alias dif='     git diff'
alias difftool='git difftool'
alias fetch='   git fetch'
alias ignored=' git status --ignored'
alias list='    git stash list'
alias log='     git log'
alias log1='    git log --pretty=oneline'
alias master='  git checkout master'
alias merg='    git merge'
alias pop='     git stash pop'
alias pull='    git pull --rebase '
alias push='    git push'
alias push-branch='git push -u origin'
alias revert='  git revert'
alias rlog='    git reflog'
alias slog='    git shortlog'
alias stash='   git stash save'
alias status='  git status'
alias unstage=' git reset HEAD'

alias slog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
