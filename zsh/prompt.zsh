# Finding all the colors:
# for COLOR in {0..255} 
# do
#     for STYLE in "38;5"
#     do 
#         TAG="\033[${STYLE};${COLOR}m"
#         STR="${STYLE};${COLOR}"
#         echo -ne "${TAG}${STR}${NONE}  "
#     done
#     echo
# done

autoload colors && colors

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on \e[38;5;28m$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

# This assumes that you always have an origin named `origin`, and that you only
# care about one specific origin. If this is not the case, you might want to use
# `$git cherry -v @{upstream}` instead.
need_push () {
  if [ $($git rev-parse --is-inside-work-tree 2>/dev/null) ]
  then
    number=$($git cherry -v origin/$(git symbolic-ref --short HEAD 2>/dev/null) 2>/dev/null | wc -l | bc)

    if [[ $number == 0 ]]
    then
      echo " "
    else
      echo " with %{$fg_bold[magenta]%}$number unpushed%{$reset_color%}"
    fi
  fi
}

directory_name() {
  echo "%{\e[38;5;26m%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'\n[%(?.✓.%?)]$(directory_name) $(git_dirty)$(need_push)› '

preexec() {
  mytimer=${mytimer:-$SECONDS}
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  
  if [ $mytimer ]; then
    mydisplay=$(($SECONDS - $mytimer))
    mydisplay=$(printf '%.2f\n' $mydisplay)
    export RPROMPT="${mydisplay}s"
    unset mytimer
  fi
}
