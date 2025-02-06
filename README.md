# dotfiles

## Installing

You will need `git` and GNU `stow`

Clone this repository

```bash
git clone https://github.com/CrystarZ/dotfiles.git ./DotFiles
cd ./DotFiles
```

Run `stow` to symlink everything or just select what you want

```bash
stow -t $HOME */ # Everything (the '/' ignores the README)
stow -t $HOME -D .git
```
or

```bash
stow -t $HOME zsh # Just my zsh config
```

On Windows, make sure you run the shell as `Administrator`, you can ask `msys` to use windows native links by setting environment variable:

```bash
export MSYS=winsymlinks:nativestrict
```