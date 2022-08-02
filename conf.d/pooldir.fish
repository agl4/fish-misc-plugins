set -q POOLDIR_ROOT; or set -U POOLDIR_ROOT "$HOME/share/pool2"
bind \co __pooldir
if ! test "$fish_key_bindings" = fish_default_key_bindings
    bind -M insert \co __pooldir
end
