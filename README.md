<p align="center">
	<h1 align="center">Excalith Dotfiles</h1>
</p>

![Screenshot of alacritty terminal using fish shell with spaceship prompt and tmux, displaying neofetch, nvim and custom scripts](assets/screenshots/dotfiles.png)

## Features

- Fully customizable installation depending on OS
- The [installer](scripts/) is seperated from configs and install scripts
- A [dotfiles manager](bin/dotfiles/main.sh) for post-install maintenance
- Has post-install scripts for configuring `git`, `ssh` and `gpg`
- Requires git commands for syncing without fancy dotfile managers

## Uses

- Supports `bash`, `zsh`, `fish`  with `starship` shell prompt

## Installation
In the home directory
```bash
git clone https://github.com/codechenx/.dotfiles.git
```
## Using Dotfiles

After installing the dotfiles, you can pretty much start using these configurations right away.

- All changes to configuration files will be recognized by git as modified within dotfiles folder except for the config files created with `.local` suffix.
- You can use `dotfiles` command for dotfile manager script for running maintenance commands.
## Credits

This dotfiles repository is a heavily ~~knocked-off~~ inspired version of beautiful [Cătălin’s dotfiles](https://github.com/alrra/dotfiles). You should probably check it out!

I have modified this dotfiles with my own taste of config files and added a bunch of helpers and utilities to install packages, extensions etc. from different sources that I trust. I tried to seperate installation system and OS-spesific configurations as much as I can, so it would be easier to implement new OS setups which I might do later.

## License

The code is available under the [MIT license](LICENSE).
