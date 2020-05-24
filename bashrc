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

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# fortune is a simple program that displays a pseudorandom message
[[ "$PS1" ]] && /usr/bin/fortune

#powerline fonts
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

#Alias
########################################################

#System
PS1='[\u@\h \W]\$ '
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
alias c="clear"
alias ..="cd .."

#python
alias py="python"

#Pacman
alias pacup="sudo pacman -Syu"
alias pain="sudo pacman -S"
alias paer="sudo pacman -Rns"

#Config Triggers
alias vimrc="vim ~/.vim/vimrc"
alias bashrc="vim ~/.bashrc"
alias basrc="vim ~/.bashrc"

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

#applications
alias def="/usr/bin/sdcv"

#From Arch
#https://www.itworld.com/article/2833199/3-ways-to-pimp-your-bash-console.html

# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)

if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] ; then

	# we have colors :-)

	# Enable colors for ls, etc. Prefer ~/.dir_colors
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

	# Use this other PS1 string if you want \W for root and \w for all other users:
	# PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h\[\033[01;34m\] \W'; else echo '\[\033[01;32m\]\u@\h\[\033[01;34m\] \w'; fi) \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "


	# Uncomment the "Color" line in /etc/pacman.conf instead of uncommenting the following line...!

	# alias pacman="pacman --color=auto"

else

	# show root@ when we do not have colors

	PS1="\u@\h \w \$([[ \$? != 0 ]] && echo \":( \")\$ "

	# Use this other PS1 string if you want \W for root and \w for all other users:
	# PS1="\u@\h $(if [[ ${EUID} == 0 ]]; then echo '\W'; else echo '\w'; fi) \$([[ \$? != 0 ]] && echo \":( \")\$ "

fi

PS2="> "
PS3="> "
PS4="+ "

# Try to keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# Try to enable the "Command not found" hook ("pacman -S pkgfile" to install it).
# See also: https://wiki.archlinux.org/index.php/Bash#The_.22command_not_found.22_hook
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash
