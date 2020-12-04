BASE="$HOME/.zsh"
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

ZSH_THEME="robbyrussell"

plugins=(
  git
)

for file in "$BASE"/*.zsh
do
  source "$file"
done

alias zshconfig="vim ~/.zshrc"
alias runningb="lsof -wni tcp:3001"
alias runningt="lsof -wni tcp:3000"
alias spring="./bin/spring"
alias be="bundle exec"
alias vim='mvim -v'

#Functions

bplease() {
kill -9 $(lsof -i tcp:3001 | grep ruby | awk '{print $2}')
./bin/spring rails s -p 3001 }

tplease() {
kill -9 $(lsof -i tcp:3000 | grep ruby | awk '{print $2}')
./bin/spring rails s -p 3000 }

byarn() {
 bundle && yarn
}

#Functions kubectl
# Get inside a pod

podbo() {
  kubectl exec -it $(kubectl get pod -l app=backoffice-pod -o jsonpath='{.items[0].metadata.name}') bash
}

podfo() {
  kubectl exec -it $(kubectl get pod -l app=frontoffice-pod -o jsonpath='{.items[0].metadata.name}') bash
}

podapi() {
  kubectl exec -it $(kubectl get pod -l app=api-pod -o jsonpath='{.items[0].metadata.name}') bash
}

podjobs() {
  kubectl exec -it $(kubectl get pod -l app=jobs-pod -o jsonpath='{.items[0].metadata.name}') bash
}

kpod() {
  kubectl exec -it $(kubectl get pod -l app=$1-pod -o jsonpath='{.items[0].metadata.name}') bash
}

klogs() {
 kubectl exec $(kubectl get pod -l app=$1-pod -o jsonpath='{.items[0].metadata.name}') -- tail -f log/staging.log
}


# load private config
if [ -f ~/.zsh/private ]; then
. ~/.zsh/private
fi

export EDITOR=vim

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ananunesdasilva/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ananunesdasilva/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ananunesdasilva/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ananunesdasilva/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
