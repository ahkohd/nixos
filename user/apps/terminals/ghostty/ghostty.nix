{ config, pkgs, ... }:

{

  home.file.".config/ghostty/config".text = ''
    # [appearance]

    font-family = SF Mono
    # font-family = Berkeley Mono
    # font-family = GeistMono Nerd Font

    # recommended font size 13pt ~ 17.33px
    font-size = 17.33

    window-padding-x = 20

    window-padding-y = 10

    window-width = 150

    window-height = 48 

    # [keybinds]

    keybind = alt+d=new_split:right

    keybind = alt+shift+d=new_split:down

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

    # [decorations]

    gtk-titlebar = false

    # [behaviour]

    mouse-hide-while-typing = true

    # theme - xcodedark
    palette = 0=#414453
    palette = 1=#ff8170
    palette = 2=#78c2b3
    palette = 3=#d9c97c
    palette = 4=#4eb0cc
    palette = 5=#ff7ab2
    palette = 6=#b281eb
    palette = 7=#dfdfe0
    palette = 8=#7f8c98
    palette = 9=#ff8170
    palette = 10=#acf2e4
    palette = 11=#ffa14f
    palette = 12=#6bdfff
    palette = 13=#ff7ab2
    palette = 14=#dabaff
    palette = 15=#dfdfe0
    background = 292a30
    foreground = dfdfe0
    cursor-color = dfdfe0
    selection-background = 414453
    selection-foreground = dfdfe0
  '';
}
