# dotfiles

Set up dotfiles in new system:

```bash
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
source $HOME/.bashrc
echo ".cfg" >> .gitignore
git clone --bare <git-repo-url> $HOME/.cfg
config config --local status.showUntrackedFiles no
config checkout
```

For full instructions see
[here](https://www.atlassian.com/git/tutorials/dotfiles)
