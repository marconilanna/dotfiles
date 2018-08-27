# ~/.bashrc

export PATH="$HOME/usr/bin:$PATH"

jdk() { export JAVA_HOME=$(/usr/libexec/java_home -v 1.$1); java -version; }

jdk 8 2> /dev/null

export JAVA_OPTS='-server -Xss10m -Xms50m -Xmx1500m -XX:ReservedCodeCacheSize=100m'
export CLASSPATH='.'

SCALA_OPTS='-encoding UTF-8 -target:jvm-1.8 -Xexperimental -Xfuture'
SCALAC_OPTS='-deprecation -feature -g:vars -opt:l:inline -opt-inline-from:** -unchecked -Xdev -Xfatal-warnings -Xlint:_,-missing-interpolator -Xstrict-inference -Yno-adapted-args -Ywarn-dead-code -Ywarn-extra-implicit -Ywarn-numeric-widen -Ywarn-self-implicit -Ywarn-unused:_ -Ywarn-value-discard'
SCALA_REPL_OPTS='-explaintypes -language:_ -nowarn -i ~/.repl.scala'

alias scala="scala $SCALA_OPTS $SCALA_REPL_OPTS"
alias scalac="scalac $SCALA_OPTS $SCALAC_OPTS"

export SBT_OPTS=$JAVA_OPTS

export BLOCKSIZE='K'
export LC_COLLATE='C'
export LESS='--ignore-case -F -X --RAW-CONTROL-CHARS'
export PAGER='less'
LESSHISTFILE='-'

alias ls='ls -AFGl'
alias dir='\ls -AFG'
alias cls='clear; ls'
alias cpl='clear; pwd; ls'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -pv'
alias mkdir='mkdir -pv'
mcd() { mkdir -pv $1; cd $1; }

alias rmdsstore='find . -name .DS_Store -delete'

alias df='df -H'
alias du.='du -sc .'
alias dusc='du -sc * | sort -n'

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

alias cloc='cloc . --exclude-dir=.idea,target'

alias header='curl -I'

PS1='\h:\w\$ '

HISTIGNORE='bg:c:cd:cd ..:clear:exit:fg:jobs:ls:ps:pwd:w'
HISTCONTROL='ignorespace:erasedups'
HISTFILESIZE=1000000
HISTSIZE=5000
HISTTIMEFORMAT='%y-%m-%d %T '

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
alias branch='     git branch -v'
alias branches='   git for-each-ref --sort=-committerdate refs/heads/ --format="%(color:red)%(objectname:short) %(color:green)%(authordate:short) %(color:blue)%(authorname) %(color:yellow)%(refname:short) %(color:reset)%(subject) %(color:dim white)(%(committerdate:relative))"'
alias commit='     git commit'
alias cont='       git rebase --continue'
alias cout='       git checkout'
alias cpick='      git cherry-pick'
alias dif='        git diff --color-moved'
alias difftool='   git difftool'
alias fetch='      git fetch --all'
alias ggrep='      git grep --break --heading --line-number'
alias ignored='    git status --ignored'
alias lastcommit=' git diff HEAD^..HEAD'
alias latest='     branches --count=20'
alias log='        git log --abbrev-commit --graph --no-merges --pretty=format:"%C(red)%h %C(green)%cr %C(blue)%an %C(reset)%s%C(yellow)%d%C(reset)"'
alias master='     git checkout master'
alias merg='       git merge'
alias mm='         git merge master'
alias pull='       git pull --rebase'
alias push='       git push'
alias pushbranch=' git push -u origin HEAD'
alias rebase='     git rebase -i'
alias reflog='     git reflog'
alias revert='     git revert'
alias shortlog='   git shortlog -sn'
alias show='       git show --color-moved'
alias sdrop='      git stash drop'
alias slist='      git stash list'
alias spop='       git stash pop'
alias ssave='      git stash save'
alias sshow='      git stash show --color-moved'
alias staged='     git diff --staged --color-moved'
alias status='     git status'
alias statuss='    git status -sb'
      tag() {      git tag -a $1 -m $1; }
alias uncommit='   git reset --soft HEAD~1'
alias unpushed='   git log --branches --not --remotes --oneline'
alias unstage='    git reset HEAD'
