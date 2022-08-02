function __cdp_select_project --description 'List projects directories.'
    set -l dir (find (string split : $CDP_PROJECT_DIR) \
        -type d \
        -name .git \
        | grep -v straight \
        | sed 's/\/\.git$//' \
        | fzf --no-color --tac --no-sort --exact)
    echo $dir
end
