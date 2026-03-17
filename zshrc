alias ll="ls -lah"

# Set keybindings for vim
bindkey -v



# addition to add colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#Variables for clang
#export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
#export CC="/opt/homebrew/opt/llvm/bin/clang"
#export CXX="/opt/homebrew/opt/llvm/bin/clang++"

#Variables for ACT
export ACT_HOME=$HOME/.local/act
export PATH=$ACT_HOME/bin:$PATH

#If I want to use Xyce alone but not needed because I have it with ACT
#export PATH="/Users/lzuniga/Documents/Project-Pipeline/code/ocd/XyceInstall/Serial/bin:$PATH"

#Useful for Bison and Flex, this for xyce_build
export PATH="/opt/homebrew/opt/flex/bin:/opt/homebrew/opt/bison/bin:$PATH"

#for actflow easy access
export ACTFLOW=$HOME/Documents/console/avlsi/tools/actflow

