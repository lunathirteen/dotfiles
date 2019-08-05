## Setup environment in a new computer

### Make sure to have git installed, then:

* clone your github repository

```git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles```

* define the alias in the current shell scope

```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```

* checkout the actual content from the git repository to your $HOME

```dotfiles checkout```

https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b

Usefull dotfiles http://dotfiles.github.io/
