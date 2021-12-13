# zmodload zsh/zprof

# START_TIME="$(date "+%s%3N")"

source ~/.config/zsh/options.zsh
source ~/.config/zsh/keybindings.zsh
source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/modules.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/aliases.zsh

source ~/.config/zsh/*.local.zsh(N) 2>/dev/null

hash fzf 2>/dev/null && source ~/.config/zsh/fzf.zsh

# ELAPSED_TIME=$(($(date "+%s%3N")-$START_TIME))
# echo "Startup time: ${ELAPSED_TIME}ms"

# zprof
