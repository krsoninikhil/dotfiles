# Setup

- Clone this as bare repo with `git clone --bare git@github.com:krsoninikhil/dotfiles.git $HOME/dotfiles.git`
- Hide untracked files from status check by:
`git --git-dir=$HOME/dotfiles.git --work-tree=$HOME config status.showUntrackedFiles no`
- Use this repo as git directory and $HOME as working directory.
- Add all dotfiles one by one using: `git --git-dir=$HOME/dotfiles.git --work-tree=$HOME add <filename>`
- Commit using: `git --git-dir=$HOME/dotfiles.git --work-tree=$HOME commit -m <message>`
- To add submodules, e.g. for vim plugins, go to appropriate path and add it as submodule by:
`git --git-dir=$HOME/dotfiles.git --work-tree=$HOME submodule add <url>`
- To create this repo first time, use:
`git init --bare $HOME/dotfiles.git`

# Credits

https://news.ycombinator.com/item?id=11070797
