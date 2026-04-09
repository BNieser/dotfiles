#!/bin/bash


toggle_special_workspace() {
    local WS_NAME="$1"      # name of the workspace
    shift
    local CMD=("$@")        # the rest is for the command which should be executed on creation

    if ! hyprctl workspaces | grep -iq "$WS_NAME"; then
        echo "Workspace $WS_NAME does not exist. Creating it..."
        hyprctl dispatch togglespecialworkspace "$WS_NAME"
        sleep 0.5
        if [ "${#CMD[@]}" -gt 0 ]; then
            echo "Starte Befehl: ${CMD[*]} ..."
            "${CMD[@]}" &
            sleep 1
        fi
    else
        echo "Workspace $WS_NAME exists. Switching to it."
        hyprctl dispatch togglespecialworkspace "$WS_NAME"
    fi
}

toggle_special_workspace "$@"
