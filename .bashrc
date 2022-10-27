#
#   ████████╗  █████╗  ██╗   ██╗  ████████╗ ███████╗  ██████╗ ██╗  ██╗
#   ╚══██╔══╝ ██╔══██╗  ██╗ ██╔╝  ╚══██╔══╝ ██╔════╝ ██╔════╝ ██║  ██║
#      ██║    ███████║   ████╔╝      ██║    ███████╗ ██║      ███████║
#   ██ ██║    ██╔══██║  ██╔╝██╗      ██║    ██╔════╝ ██║      ██╔══██║
#   ╚███╔╝    ██║  ██║ ██╔╝  ██╗     ██║    ███████╗ ╚██████╗ ██║  ██║
#    ╚══╝     ╚═╝  ╚═╝ ╚═╝   ╚═╝     ╚═╝    ╚══════╝  ╚═════╝ ╚═╝  ╚═╝
#
# custom ~/.bashrc file for JaxTech
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa --color=always --group-directories-first' # list directory
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -al --color=always --group-directories-first'  # long format - preferred listing
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias vi='vim'
PS1='[\u@\h \W]\$ '
