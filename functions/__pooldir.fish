function __pooldir -d "Get or create pooldir"
    set -q POOLDIR_ROOT; or set -U POOLDIR_ROOT "$HOME/share/pool2"
    set -l depth_option -depth
    if test (uname -s) = Linux
        set -l depth_option -maxdepth
    end

    set -l subdir
    set -l query
    command find "$POOLDIR_ROOT" "$depth_option" 1 -type d | eval "fzf --no-multi --print-query $POOLDIR_FZF_OPTIONS" \
        | while read -l r
        # store the query
        if test -z "$query"
            set query $r
            # store the subdir
        else
            set subdir $r
        end
    end

    # exit if user canceled
    if test -z "$query"; and test -z "$subdir"
        commandline -f repaint
        return
    end

    if test -z $subdir
        if test -d $query
            # In this case there was a valid result but no query was typed in,
            # possibly because of arrow-key selecting in results.
            commandline -it -- (string trim "$subdir")
        else
            # Here query was typed in, but no directories matched, so create
            # one.
            set -l basedir (string trim "$query" | sed 's/[^[a-z0-9]/-/ig')
            set -l fulldir $POOLDIR_ROOT/(date +%Y%m%d)-$basedir
            mkdir -p (string trim "$fulldir")
            commandline -it -- (string trim "$fulldir")
        end
    else
        commandline -it -- (string trim "$subdir")
    end
end
