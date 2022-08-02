function __cdp_insert_project --description 'Insert selected project directory to command line.'
    set -l dir (__cdp_select_project)
    if test -z "$dir"
        commandline -f repaint
        return
    end
    commandline -it -- (string trim "$dir")
end
