#! /bin/bash

function set_colors
{

  local NCOLORS

  # check if stdout is a terminal...
  if [[ -t 1 ]]; then

    # see if it supports colors...
    NCOLORS=$(tput colors)

    if [[ $NCOLORS ]] && [[ $NCOLORS -ge 8 ]]; then
      BOLD="$(tput bold)"
      UNDERLINE="$(tput smul)"
      STANDOUT="$(tput smso)"
      NORMAL="$(tput sgr0)"
      BLACK="$(tput setaf 0)"
      RED="$(tput setaf 1)"
      GREEN="$(tput setaf 2)"
      YELLOW="$(tput setaf 3)"
      BLUE="$(tput setaf 4)"
      MAGENTA="$(tput setaf 5)"
      CYAN="$(tput setaf 6)"
      WHITE="$(tput setaf 7)"
    fi
  fi
}

set_colors

echo "${RED}error${NORMAL}"
echo "${GREEN}success${NORMAL}"

echo "${GREEN}0.052${NORMAL} ${GREEN}2,816.00 ${BOLD}kb${NORMAL}"
