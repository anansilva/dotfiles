Dotfiles
=======

- zsh (macOS default shell since Catalina)
- vim
- [tmux](https://github.com/tmux/tmux/wiki)
- [tmuxinator](https://github.com/tmuxinator/tmuxinator)

Installation
------------


### 0. Install tmux, tmuxinator and ohmyzsh

```
brew install tmux
brew install tmuxinator
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 1. Clone this repository
```
git clone git@github.com:anansilva/dotfiles.git ~/dotfiles
```

### 2. Symlink the zsh, vim, tmux and tmuxinator config files to your home directory

```
ln -sf ~/dotfiles/zsh ~/.zsh
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/tmuxinator ~/.tmuxinator
```

### 3. Source the zsh configs

`source ~/.zshrc`

After this you will have the `sz` alias to source `.zshrc`

### 4. Symlink other zsh and vim sub-config files to your home directory

- `slz` This will symlink all the zsh config files under the `~/dotfiles/zsh`
folder
- `slv` This will symlink all the vim config files under the `~/dotfiles/vim` folder
- `slt` This will symlink all the tmuxinator config files under the `~/dotfiles/tmuxinator` folder

You might need to install mvim!

### 5. Install all the vim plugins
Vim plugins are managed through vundle. You'll need to install vundle to get them.

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Enter vim and type `:PluginInstall`

Add the Gruvbox theme importing the `~/dotfiles/vim/Gruvbox-dark.terminal` to
your terminal preferences.

### 6. Symlink the gitignore file
```
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
```

You might need to tell git to pick up this file:

```
git config --global core.excludesfile ~/.gitignore_global
```

### 7. Install ripgrep

Needed for fzf (search):

```
brew install ripgrep
```

Inspiration
-----------

- [Leandro Proença](https://github.com/leandronsp/dotfiles)
- [Chris Toomey](https://github.com/christoomey/dotfiles)
- [Ben Orenstein](https://github.com/r00k/dotfiles)
