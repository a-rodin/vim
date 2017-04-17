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

if [ -f ~/.tmux-host-colour ]; then
  HOST_COLOUR=$(cat ~/.tmux-host-colour)
fi
COLOURS=(colour4 colour6 colour8 colour2 colour5 colour3 colour1)
for ((COLOUR_NUMBER = 0; COLOUR_NUMBER < ${#COLOURS[@]}; COLOUR_NUMBER++)); do
  if [ "${COLOURS[$COLOUR_NUMBER]}" == "$HOST_COLOUR" ]; then
    break
  fi
done

STYLE=${COLOURS[$(((SESSION_NUMBER + COLOUR_NUMBER) % ${#COLOURS[@]}))]}

tmux set -t $SESSION_ID status-style bg=$STYLE
tmux set -t $SESSION_ID pane-active-border-style fg=$STYLE
tmux set-hook -t $SESSION_ID after-new-window \
  "set -t $SESSION_ID pane-active-border-style fg=$STYLE"
