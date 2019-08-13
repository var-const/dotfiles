# https://github.com/christoomey/vim-tmux-navigator
# Smart pane switching with awareness of vim splits
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
bind -n M-h if-shell "$is_vim" "send-keys M-h" "select-pane -L"
bind -n M-j if-shell "$is_vim" "send-keys M-j" "select-pane -D"
bind -n M-k if-shell "$is_vim" "send-keys M-k" "select-pane -U"
bind -n M-l if-shell "$is_vim" "send-keys M-l" "select-pane -R"
bind -n M-\ if-shell "$is_vim" "send-keys M-\\" "select-pane -l"

# Also emulate visual mode
#bind-key -t vi-copy 'v' begin-selection
# bind-key -t vi-copy 'y' copy-selection
# Copy to the system clipboard
#bind -t vi-copy 'y' copy-pipe 'xclip -in -selection clipboard'
#bind -t vi-copy 'Y' copy-pipe 'xclip -in -selection clipboard'
bind-key -Tcopy-mode-vi 'v' send -X begin-selection

if-shell "~/dotfiles/get-os.sh | grep -q darwin" "bind-key -Tcopy-mode-vi 'y' send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'"
if-shell "~/dotfiles/get-os.sh | grep -qv darwin" "bind-key -Tcopy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -selection clipboard -i'"

bind-key -Tcopy-mode-vi Escape send -X cancel
bind-key -Tcopy-mode-vi V send -X rectangle-toggle

# resize panes using PREFIX H, J, K, L
# The -r switch to bind allows half a second time (set via repeat-time) to perform the next keystroke without pressing the prefix again.
bind -n M-H resize-pane -L 5
bind -n M-J resize-pane -D 5
bind -n M-K resize-pane -U 5
bind -n M-L resize-pane -R 5

bind -n M-n next-window
bind -n M-p previous-window
bind -n M-x kill-pane
bind -n M-q confirm-before kill-session
bind -n M-space copy-mode
bind -n M-u copy-mode
#bind -n M-v split-window -h
#bind -n M-- split-window -v
bind -n M-v split-window -h -c "#{pane_current_path}"
bind -n M-- split-window -v -c "#{pane_current_path}"
bind -n M-c new-window
bind -n M-z resize-pane -Z

# Force a reload of the config file
bind -n M-r source-file ~/.tmux.conf \; display 'tmux config reloaded'

# @TODO: promising bindings
# bind -n M-' command-prompt "rename-session %%"
# Changing layout?

# bind '~' split-window -h "exec htop" - not that much a saving
# bind l refresh-client - needed rarely
# I don't use that many windows
# bind ^A last-window
# bind '"' choose-window
# bind ^D detach - not sure if I detach
# bind x lock-server - probably better in window manager
# bind * list-clients - how is it different from choose-session?
# bind -n M-K confirm-before "kill-window"
#bind -n M-' command-prompt "rename-window %%" # Doesn't work
# "insert"
bind -n M-i paste-buffer
# "yank"
bind -n M-y choose-buffer

# bind -n M-- resize-pane -L 5
# bind -n M-= resize-pane -R 5
# bind -n M-u resize-pane -U 5
# bind -n M-d resize-pane -D 5

bind -n M-o resize-pane -Z
bind -n M-O last-pane \; resize-pane -Z

bind -n M-\; command-prompt

bind -n M-8 choose-session

bind -n M-Tab last-pane
