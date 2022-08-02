function __cdp_select_project --description 'List projects directories.'
    set -l dir (find (string split : $CDP_PROJECT_DIR) \
        -type d \
        -name .git \
        | grep -v straight \
        | sed 's/\/\.git$//' \
        | eval "fzf --no-multi $CDP_FZF_OPTIONS")
    echo $dir
end
