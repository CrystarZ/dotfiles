# dotfiles

## Installing

You will need `git` and GNU `stow`

Clone this repository

```bash
git clone https://github.com/AEvaCrystar/dotfiles.git ./DotFiles
cd ./DotFiles
```

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README)
stow -D .git
```
or
```bash
stow zsh # Just my zsh config
