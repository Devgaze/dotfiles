export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
source /opt/boxen/env.sh


alias ll="ls -al"
alias pwd="sh ~/.pwdc"

# GIT shortcuts
alias co="git checkout "
alias ci="git commit "
alias br="git branch "
alias st="git status "
alias fm="git fetch upstream && git merge upstream/master"

# projects
alias max='cd ~/Sites/adobe-max-2014'
alias summit15e='cd ~/Sites/adobe-summit-2015-placeholder'
alias summit15='cd ~/Sites/adobe-summit-2015'
alias att='cd ~/Sites/attendease'
alias cnow='cd ~/Sites/attendease/var/organizations/creativecloud'
alias sites='cd ~/Sites'

# Git related
# -----------
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

function rmb {
  current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ "$current_branch" != "master" ]; then
    echo "WARNING: You are on branch $current_branch, NOT master."
  fi
    echo "Fetching merged branches..."
  git remote prune origin
  remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$")
  local_branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")
  if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
    echo "No existing branches have been merged into $current_branch."
  else
    echo "This will remove the following branches:"
    if [ -n "$remote_branches" ]; then
      echo "$remote_branches"
    fi
    if [ -n "$local_branches" ]; then
      echo "$local_branches"
    fi
    read -p "Continue? (y/n): " -n 1 choice
    echo
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
      # Remove remote branches
      git push origin `git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$" | sed 's/origin\//:/g' | tr -d '\n'`
      # Remove local branches
      git branch -d `git branch --merged | grep -v 'master$' | grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
    else
      echo "No branches removed."
    fi
  fi
}


# Anotine's & Troy's tips
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# if [ -f ~/.git-completion.bash ]; then
#  . ~/.git-completion.bash
# fi

# git branch highlighting
function parse_git_branch
{
       branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
       if [ -n "$branch" ]; then
               echo "${branch} "
       fi
}
function proml
{
       local       WHITE="\[\033[1;37m\]"
       local  LIGHT_GREY="\[\033[0;37m\]"
       local         RED="\[\033[0;31m\]"
       local       GREEN="\[\033[0;32m\]"
       PS1="$RED\$(parse_git_branch)$GREEN\u@\h\w\$ "
       PS1="$RED\$(parse_git_branch)$GREEN\h:\W \u\$$LIGHT_GREY "
}
proml

alias restart-nginx="kill -HUP \`cat /usr/local/var/run/nginx.pid\`"
alias ms="git checkout master;git fetch upstream;git merge upstream/master;git push"
alias pr="hub pull-request -b coverall:master"
alias deploybot="ssh -p 2242 deploybot@deploybot.coverallcrew.com"

LANG="en_CA.UTF-8"
LC_CTYPE="en_CA.UTF-8"
LANG="en_CA.UTF-8"
LC_CTYPE="en_CA.UTF-8"
LANG="en_CA.UTF-8"
LC_CTYPE="en_CA.UTF-8"
LANG="en_CA.UTF-8"
LC_CTYPE="en_CA.UTF-8"
