# dotfiles
![Screenshot](.screenshots/screenshot.png)

## Configs
- .bashrc
- .xinitrc
- alacritty
- dunst
- spectrwm
- starship
  
### Links to my other repos
- [neovim](https://github.com/kuripa/nvim)
- [dmenu](https://github.com/kuripa/dmenu/)
- [dmenu-scripts](https://github.com/kuripa/dmenu-scripts/)
- [slock](https://github.com/kuripa/slock/) 
- 
## Installation
**WARNING**: If you want the use these dotfiles, you should fork this repository and remove the things you don't need or want!
Use at  your own risk!


Prior to the installation make sure you have committed the alias to your `.bashrc` or `.zsh`:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Create a `.gitignore` file in your `$HOME` and add the `.dotfiles` folder to avoid recursion problems: 
```bash
echo ".dotfiles" >> .gitignore 
```

Clone the repository:
```bash
git clone --bare https://github.com/kuripa/dotfiles.git
```
or

```bash
git clone --bare git@github.com:kuripa/dotfiles.git
```

Checkout the actual content from the bare repository to your `$HOME`:
```bash
dotfiles checkout
```
The step might with a message like:
```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .config/alacritty/alacritty.yml
Please move or remove them before you can switch branches.
Aborting
```
This happens because your `$HOME` does already have the files.
To fix this just back up the files and then remove them from your `$HOME`.
Rerun the check out:
```bash
dotfiles checkout
```
Set the flag `showUntrackedFiles` to `no` on this local repo
```bash
dotfiles config --local status.showUntrackedFiles no
```

## Usage/Examples

Print `dotfiles` status
```bash
dotfiles status
```
Add files/folder to the repository
```bash
dotfiles add .bashrc
dotfiles commit -m "Add .bashrc"
dotfiles add .config/nvim/
dotfiles commit -m "Add nvim"
```
Push local changes
```bash 
dotfiles push origin master
```

## Infos
Here you can find more infos about managing your dotfiles: 
- [dotfiles.github](https://dotfiles.github.io/)
- [manage dotfiles with git --bare](https://www.atlassian.com/git/tutorials/dotfiles)

## License

[WTFPL](https://choosealicense.com/licenses/wtfpl/)
