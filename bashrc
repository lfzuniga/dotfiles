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

set -o vi

. /gpfs/gibbs/project/manohar/rm2267/setup/init
setup local

export PATH="$HOME/TurboVNC/bin:$PATH"


#alias start_session="srun --pty --x11 -p pi_manohar --cpus-per-task=4 --mem=32GB --time=1-12:00:00 bash"

#if [[ "$(hostname)" =~ ^login[0-9]+\.grace$ || "$(hostname)" =~ ^login[0-9]+\.grace.ycrc.yale.edu$ ]]; then
#    echo "Grace login node --> starting session"
#    start_session
#elif [[ "$(hostname)" =~ ^transfer[0-9]+\.grace$ || "$(hostname)" =~ ^transfer[0-9]+\.grace.ycrc.yale.edu$ ]]; then
    # Commands for transfer nodes
    # echo "Running on a Grace transfer node --> remain"
    :
#else
#    echo "Compute node $(hostname) --> loading software"
#    source /gpfs/gibbs/project/manohar/rm2267/setup/init
#    setup local
#    setup act
#    setup cadence
#    setup siemens
#fi


# I am adding my changes from here
alias ls="ls --color=auto"
alias ll="ls -lah"
alias kompute="salloc --x11 -p pi_manohar -t 24:00:00 --mem=64G -c 8"
asram="$HOME/git/asram-fusion-refactor"
