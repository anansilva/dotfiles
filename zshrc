ZSH_DISABLE_COMPFIX=true
BASE="$HOME/.zsh"
ZSH=$HOME/.oh-my-zsh

MYZSH="~/.zshrc"

alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vim"

ZSH_THEME="robbyrussell"

plugins=(
  git
)

for file in "$BASE"/*.zsh
do
  source "$file"
done

source $ZSH/oh-my-zsh.sh

alias vim='mvim -v'
export EDITOR=vim

#Functions

sz() { source ~/.zshrc }
slz() {
  for file in ~/dotfiles/zsh/*zsh
  do
    filename="$(basename "${file}")"
    mkdir -p ~/.zsh
    ln -sf "${file}" ~/.zsh/"${filename}"
  done
}

slv() {
  for file in ~/dotfiles/vim/*vim
  do
    filename="$(basename "${file}")"
    mkdir -p ~/.vim
    ln -sf "${file}" ~/.vim/"${filename}"
  done
}

slt() {
  for file in ~/dotfiles/tmuxinator/*yml
  do
    filename="$(basename "${file}")"
    mkdir -p ~/.tmuxinator
    ln -sf "${file}" ~/.tmuxinator/"${filename}"
  done
}

# load private config
if [ -f ~/.zsh/private ]; then
. ~/.zsh/private
fi

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef


# Postgres
# export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# rbenv stuff. No need if you're using docker :)
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
