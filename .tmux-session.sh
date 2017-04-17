#!/bin/bash

SESSION_ID=$(tmux list-sessions -F "#{session_id}" | tail -n1)

tmux rename-session -t $SESSION_ID _${SESSION_ID/\$/}
SESSION_NAMES=$(tmux list-sessions -F "#{session_name}")
SESSION_NUMBER=0
while true; do
  if grep "^$SESSION_NUMBER$" <<<"$SESSION_NAMES" >/dev/null ; then
    ((SESSION_NUMBER++))
  else
    break
  fi
done
tmux rename-session -t $SESSION_ID $SESSION_NUMBER

HOST_ID=$(hostname | sum | cut -d' ' -f1)
if [ -f ~/.tmux-host-colour ]; then
  HOST_COLOUR=$(cat ~/.tmux-host-colour)
else
  HOST_COLOUR=4
fi
STYLE=colour$((1 + (2 * SESSION_NUMBER + HOST_COLOUR - 1) % 8))

tmux set -t $SESSION_ID status-style bg=$STYLE
tmux set -t $SESSION_ID pane-active-border-style fg=$STYLE
