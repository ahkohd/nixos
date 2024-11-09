{ ... }:

{

  home.file.".config/ghostty/config".text = ''
    # [appearance]

    font-family = SF Mono

    # font-family = Berkeley Mono

    # recommended font size 13pt ~ 17.33px
    # font-size = 17.33

    font-size = 14.33

    window-padding-x = 10

    window-padding-y = 5

    window-width = 150

    window-height = 48 

    # [keybinds]

    keybind = alt+shift+t=new_tab

    keybind = alt+shift+g=new_split:right

    keybind = alt+shift+b=new_split:down

    keybind = alt+shift+i=previous_tab

    keybind = alt+shift+o=next_tab

    keybind = alt+shift+h=goto_split:left

    keybind = alt+shift+l=goto_split:right

    keybind = alt+shift+j=goto_split:bottom

    keybind = alt+shift+k=goto_split:top

    keybind = alt+shift+,=reload_config

    keybind = alt+shift+w=close_surface

    keybind = alt+shift+enter=toggle_split_zoom

    # [decorations]

    gtk-titlebar = false

    window-decoration = false

    # [behaviour]

    mouse-hide-while-typing = true

    # [theme]

    theme = tokyonight-storm

    # [shell]

    shell-integration = zsh

    # command = fish -c "nitch && exec fish"
    command = zsh -c "nitch && exec zsh"
  '';
}
