{ config, pkgs, ... }:

{

  home.file.".config/ghostty/config".text = ''
    # [appearance]

    font-family = Berkeley Mono
    # font-family = GeistMono Nerd Font

    font-size = 14

    window-padding-x = 20

    window-padding-y = 10

    window-width = 150

    window-height = 48 

    theme = Solarized Dark - Patched

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
  '';
}
