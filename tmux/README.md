# Tmux config


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
