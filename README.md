# Dotfiles

These dotfiles is build based on my development environment, please consider properly before you run the install script.

## Usage

Run shell script in terminal. 

```
sh -c "`curl -fsSL https://raw.githubusercontent.com/tpai/dotfiles/master/install.sh `"
```

Put this line into iTerm `Profiles > General > Command > Send text at start`

```
tmux attach -t init || tmux new -s init
```

Done!
