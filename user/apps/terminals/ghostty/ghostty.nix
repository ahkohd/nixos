{ ... }:

{

  home.file.".config/ghostty/config".text = ''
    # [appearance]

    font-family = SF Mono
    # font-family = Berkeley Mono

    # recommended font size 13pt ~ 17.33px
    font-size = 14

    window-padding-x = 20

    window-padding-y = 10

    window-width = 150

    window-height = 48 

    cursor-style = bar

    # [keybinds]

    keybind = alt+b=new_split:right

    keybind = alt+shift+b=new_split:down

    keybind = alt+t=new_tab

    keybind = alt+shift+h=previous_tab

    keybind = alt+shift+l=next_tab

    keybind = alt+h=goto_split:left

    keybind = alt+l=goto_split:right

    keybind = alt+k=goto_split:top

    keybind = alt+shift+k=goto_split:previous

    keybind = alt+shift+j=goto_split:next

    keybind = alt+j=goto_split:bottom

    keybind = alt+,=reload_config

    keybind = alt+w=close_surface

    keybind = alt+enter=toggle_split_zoom

    keybind = alt+shift+enter=toggle_split_zoom

    keybind = alt+d=scroll_page_down

    keybind = alt+u=scroll_page_up

    # [decorations]

    gtk-titlebar = false

    # background-opacity = 0.9

    # [behaviour]

    mouse-hide-while-typing = true

    # [theme]

    theme = tokyonight-storm

    # [shell]

    shell-integration = fish

    command = fish -c "nitch && exec fish"
  '';
}
