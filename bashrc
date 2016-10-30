# ~/.bashrc

export PATH="$HOME/usr/bin:$PATH"

jdk() { export JAVA_HOME=$(/usr/libexec/java_home -v 1.$1); }

jdk 8

export JAVA_OPTS='-server -Xss10m -Xms50m -Xmx1500m -XX:ReservedCodeCacheSize=100m'
export CLASSPATH='.'

SCALA_OPTS='-encoding UTF-8 -target:jvm-1.8 -Xexperimental -Xfuture'
SCALA_REPL_OPTS='-language:_ -nowarn -Dscala.color -i ~/.repl.scala'
SCALAC_OPTS='-deprecation -feature -g:vars -opt:_ -unchecked -Xdev -Xfatal-warnings -Xlint:_ -Xstrict-inference -Yno-adapted-args -Ywarn-dead-code -Ywarn-numeric-widen -Ywarn-unused -Ywarn-unused-import -Ywarn-value-discard'
alias scala="scala $SCALA_OPTS $SCALA_REPL_OPTS"
alias scalac="scalac $SCALA_OPTS $SCALAC_OPTS"

export SBT_OPTS=$JAVA_OPTS

export BLOCKSIZE='K'
export LESS='--ignore-case --RAW-CONTROL-CHARS'
export PAGER='less'
LESSHISTFILE="-"

alias ls='ls -AFGl'
alias dir='\ls -AFG'
alias cls='clear; ls'
alias cpl='clear; pwd; ls'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -pv'
alias mkdir='mkdir -pv'

alias df='df -H'
alias dusc='du -sc * | sort -n'
alias du.='du -sc . | sort -n'

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='grep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'

alias c='clear'
alias h='history'

alias cd-='cd -'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'

alias gvim='gvim -reverse'

alias header='curl -I'

PS1='\h:\w\$ '

HISTIGNORE='bg:c:cd:cd ..:clear:exit:fg:jobs:ls:ps:pwd:w'
HISTCONTROL='ignorespace:erasedups'
HISTFILESIZE=1000000
HISTSIZE=5000
HISTTIMEFORMAT="%y-%m-%d %T "

# append to the history file, don't overwrite it
shopt -s histappend

set -o ignoreeof

umask 0077

mesg n

#
# https://github.com/git/git/tree/master/contrib/completion
#

# Git prompt
GP='/usr/local/git/contrib/completion/git-prompt.sh'
[ -r $GP ] && . $GP && PS1='\h:\w$(__git_ps1 " [%s]")\$ '

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

# Git completion
GC='/usr/local/git/contrib/completion/git-completion.bash'
[ -r $GC ] && . $GC

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
alias ggrep='      git grep --break --heading --line-number'
alias ignored='    git status --ignored'
alias lastcommit=' git diff HEAD^..HEAD'
alias list='       git stash list'
alias log='        git log --abbrev-commit --graph --no-merges --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset %Cgreen%cr%Creset - %s%C(yellow)%d%Creset"'
alias master='     git checkout master'
alias merg='       git merge'
alias mm='         git merge master'
alias pop='        git stash pop'
alias pull='       git pull --rebase '
alias push='       git push'
alias push-branch='git push -u origin'
alias rebase='     git rebase -i'
alias revert='     git revert'
alias rlog='       git reflog'
alias show='       git show'
alias sshow='      git stash show -p'
alias slog='       git shortlog -sn'
alias staged='     git diff --staged'
alias stash='      git stash save'
alias status='     git status'
alias statuss='    git status -sb'
alias uncommit='   git reset --soft HEAD~1'
alias unstage='    git reset HEAD'
