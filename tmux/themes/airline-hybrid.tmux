#!/bin/sh

main() {
  tmux set-option -g status 'on'
  tmux set-option -g status-utf8 'on'
  tmux set-option -g status-bg 'colour8'
  tmux set-option -g status-left-length '100'
  tmux set-option -g status-right-length '100'
  tmux set-option -g pane-active-border-fg 'colour65'
  tmux set-option -g pane-border-fg 'colour0'
  tmux set-option -g message-bg 'colour0'
  tmux set-option -g message-fg 'colour15'
  tmux set-option -g message-command-bg 'colour0'
  tmux set-option -g message-command-fg 'colour15'
  tmux set-option -g status-left '#[fg=colour15,bold] #S '
  tmux set-option -g status-right '#[fg=colour0,bg=colour8]#[fg=colour6,bg=colour0] %Y-%m-%d %H:%M '
  tmux set-window-option -g window-status-fg 'colour15'
  tmux set-window-option -g window-status-activity-bg 'colour8'
  tmux set-window-option -g window-status-activity-fg 'colour65'
  tmux set-window-option -g window-status-separator ''
  tmux set-window-option -g window-status-bg 'colour8'
  tmux set-window-option -g window-status-format '#[fg=colour15,bg=colour8] #I #W '
  tmux set-window-option -g window-status-current-format \
    '#[fg=colour8,bg=colour4]#[fg=colour0] #I  #W #[fg=colour4,bg=colour8]'
}

main

# vim: set filetype=sh
