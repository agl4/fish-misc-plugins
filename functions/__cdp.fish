function __cdp_select_project --description 'List projects directories.'
    set -l dir (find (string split : $CDP_PROJECT_DIR) \
        -type d \
        -name .git \
        | grep -v straight \
        | sed 's/\/\.git$//' \
        | fzf --no-color --tac --no-sort --exact)
    echo $dir
end

function __cdp_insert_project --description 'Insert selected project directory to command line.'
    set -l dir (__cdp_select_project)
    if test -z "$dir"
        commandline -f repaint
        return
    end
    commandline -it -- (string trim "$dir")
end

function cdp --description 'Go to selected project directory.'
    set -l dir (__cdp_select_project)
    if test -z "$dir"
        commandline -f repaint
        return
    end
    builtin cd $dir
end
