Dotfiles
=======

Installation
------------

### 1. Clone this repository
```
git clone git://github.com/anansilva/dotfiles ~/.dotfiles`
```

### 2. Symlink the zsh and vim config files to your home directory

```
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/vim/vimrc ~/.vim/vimrc
```

### 3. Symlink other zsh and vim sub-config files to your home directory

`slz` This will symlink all the zsh config files under the `~/dotfiles/zsh`
folder

`slv` This will symlink all the vim config files under the `~/dotfiles/vim` folder

### 4. Install all the vim plugins
Vim plugins are managed through vundle. You'll need to install vundle to get them.

Enter vim and type `:PluginInstall`

### 5. Symlink the gitignore file
```
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
```

You might need to run this command after:

```
git config --global core.excludesfile ~/.gitignore_global
```

Inspiration
-----------

- [Chris Toomey](https://github.com/christoomey/dotfiles)
- [Ben Orenstein](https://github.com/r00k/dotfiles)
