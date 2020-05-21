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

#Alias
########################################################

#Pacman 
pacup="sudo pacman -Syu"
pain="sudo pacman -S"

#Config Triggers
vimrc="vim ~/.vim/vimrc"
bashrc="vim ~/.bashrc"

#Command Line Serch
histg="history | grep"

#Fix Monitors
fixS1="xrandr --output eDP-1 --mode 1920x1080" 
fixS2="xrandr --output HDMI-2 --left-of eDP-1"

#git
gs="git status"
ga="git add"
gc="git commit"
gup="git push -u origin master"
