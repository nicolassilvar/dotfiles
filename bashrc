#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#ignore the case of tab complete
set completion-ignore-case on

#Add by Broot command (file manager)
source /home/nico/.config/broot/launcher/bash/br

#Set VIM binding in Bash
set -o vi
