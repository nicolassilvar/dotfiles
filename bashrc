#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#ignore the case of tab complete
set completion-ignore-case on

#Add by Broot command (file manager)
source /home/nico/.config/broot/launcher/bash/br

#Set VIM binding in Bash
set -o vi

#Alias
########################################################

#System
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Pacman 
alias pacup="sudo pacman -Syu"
alias pain="sudo pacman -S"

#Config Triggers
alias vimrc="vim ~/.vim/vimrc"
alias bashrc="vim ~/.bashrc"

#Command Line Serch
alias histg="history | grep"

#Fix Monitors
alias fixS1="xrandr --output eDP-1 --mode 1920x1080" 
alias fixS2="xrandr --output HDMI-2 --left-of eDP-1"

#git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gup="git push -u origin master"

#power
alias pdown="sudo shutdown -h now"
alias preb="sudo shutdown -r now"
