#!/bin/bash

# Create init tmux
tmux_init()
{
    tmux start-server
    tmux new-session -s "minliu" -d -n "shell"    # create a new session
    tmux new-window -n "editor"          # create a new window
    tmux new-window -n "server" "top"          # create a new window
    tmux new-window -n "files" "ranger"          # create a file manager window
    tmux new-window -n "ncdu" "ncdu"          # create a ncdu window
    tmux new-window -n "mutt" "mutt"          # create a email window
    tmux new-window -n "sup" "sup"          # create a email window
    tmux select-pane -t 0
    tmux select-window -t 1
    tmux -2 attach-session -d           # tmux -2 force to use 256color，and attach existed tmux
}

# Check the tmux session is open or not, otherwise open a new tmux session.
if which tmux 2>&1 >/dev/null; then
    test -z "$TMUX" && (tmux attach || tmux_init)
fi

