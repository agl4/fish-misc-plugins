set -q CDP_PROJECT_DIR; or set -U CDP_PROJECT_DIR "$HOME/src"
set -q CDP_FZF_OPTIONS; or set -U CDP_FZF_OPTIONS "--tac --sort --exact"
bind \cp __cdp_insert_project
if ! test "$fish_key_bindings" = fish_default_key_bindings
    bind -M insert \cp __cdp_insert_project
end
