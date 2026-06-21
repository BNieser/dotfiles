# Tmux config

## Tmux Plugin Manager

### Install

clone:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Keybindings

- `prefix`+`I`
  - install new plugins

- `prefix` + `U`
  - update plugins

## Check if in tmux the nvim color scheme is corretly displayed

Check if the correct term-info is installed as it´s needed from the tmux config.

```bash
infocmp tmux-256color
```

With `infocmp` we can compare several terminal capabilites and information.

If it´s not there we can installed on Ubuntu with

```bash
sudo apt install ncurses-term
```

Then after restrting tmux we can check within

```bash
tmux kill-server
tmux
```

Check if we have the correct terminal infos

```bash
echo $TERM
```
