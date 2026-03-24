DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Source everything from ~/.settings
for file in $(find ~/.settings -type f -o -type l); do
    . $file
done

# call starship prompt
eval "$(starship init bash)"
eval "$(fzf --bash)"
eval "$(mise activate bash)"
eval "$(zoxide init --cmd cd bash)"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/asakh/opt/sdkman"
[[ -s "/home/asakh/opt/sdkman/bin/sdkman-init.sh" ]] && source "/home/asakh/opt/sdkman/bin/sdkman-init.sh"
