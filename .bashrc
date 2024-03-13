# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

free_mem()
{
    awk '/MemFree/{printf "%.2f\n", $2 / (1024 * 1024)}' /proc/meminfo
}

net_ip()
{
    ifconfig | awk '/inet 192/{print $2}'
}

#PS1 Prompt
#==========
# GameCube

# green strawberry
PS1='\[\e[01;48;5;42m\] $(net_ip) \[\e[01;48;5;12m\] $(free_mem)Gb \[\e[01;48;5;79m\] \A \[\e[01;48;5;87;38;5;42m\] \u \[\e[01;38;5;202;48;5;228m\] \w \[\033[0m\]\n\[\e[01;33m\]> \[\033[0m\]'

# red
#PS1='\[\e[01;48;5;196m\] $(net_ip) \[\e[01;48;5;202m\] $(free_mem)Gb \[\e[01;48;5;208m\] \A \[\e[01;48;5;226;38;5;202m\] \u \[\e[01;38;5;202;48;5;228m\] \w \[\033[0m\]\n\[\e[01;33m\]> \[\033[0m\]'

# starter blue
#PS1='\[\e[01;102m\] $(net_ip) \[\e[01;45m\] $(free_mem)Gb \[\e[01;46m\] \A \[\e[01;104m\] \u \[\e[01;38;5;240;48;5;252m\] \w \[\033[0m\]\n\[\e[01;33m\]> \[\033[0m\]'

# default
#PS1="[\[\e[95m\]\u\[\e[m\]@\[\e[96m\]\A\[\e[m\] \[\e[92m\]\W\[\e[m\]]\[\e[1m\]\[\e[34m\]\\$\[\e[m\] "

# Aliases
# =======
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l1='ls -1'
alias lal='ls -al'
alias tips='cd ~/Documents/guides; pwd; ls'
alias dev='cd ~/Documents/devel/sketch; pwd; ls'
alias proj='cd ~/Documents/devel/projects; pwd; ls'
alias conf='cd ~/Documents/devel/configs; pwd; la' 
alias vita='cd ~/Documents/devel/vitasdk; pwd; la'
alias curr='cd ~/Documents/devel/sketch/web/short_story; pwd; la' 

# psvita sdk environment
export VITASDK=/usr/local/vitasdk
export PATH=$VITASDK/bin:$PATH 
