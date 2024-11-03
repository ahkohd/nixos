# source extra variables
source ~/.config/fish/extra_vars.fish

# apply tokyonight_strom theme
source ~/.config/fish/themes/tokyonight_strom.fish

# apply fzf theme
source ~/.config/fish/themes/fzf.fish

if ssh-add -l | grep -q "id_github"
    # do nothing
else
    ssh-add ~/.ssh/id_github
end
