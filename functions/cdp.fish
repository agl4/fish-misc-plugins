function cdp --description 'Go to selected project directory.'
    set -l dir (__cdp_select_project)
    if test -z "$dir"
        commandline -f repaint
        return
    end
    builtin cd $dir
end
