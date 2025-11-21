# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Functions
play-mc() {
    hyprctl keyword input:touchpad:disable_while_typing false
    minecraft-launcher
    hyprctl keyword input:touchpad:disable_while_typing true
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jkelly/.local/share/google-cloud-sdk/path.bash.inc' ]; then . '/home/jkelly/.local/share/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jkelly/.local/share/google-cloud-sdk/completion.bash.inc' ]; then . '/home/jkelly/.local/share/google-cloud-sdk/completion.bash.inc'; fi
export PATH="$PATH:/usr/local/bin/go/bin"
. "/home/jkelly/.deno/env"

. "$HOME/.local/share/../bin/env"
source /home/jkelly/.config/op/plugins.sh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
