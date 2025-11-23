{ colorscheme, ... }:

let theme = if colorscheme == "light" then "cyberdream-light" else "cyberdream";
in {
  home.file.".config/ghostty/themes".source = ./themes;
  home.file.".config/ghostty/config".text = ''
    font-family = TX-02-AREMU
    font-feature = -calt
    font-feature = -liga
    font-feature = -dlig
    font-size = 13
    freetype-load-flags = no-hinting
    theme = ${theme}
    # theme = dark:cyberdream,light:cyberdream-light
    window-padding-x = 5
    window-padding-y = 0
    window-colorspace = display-p3
    window-inherit-font-size = false
    window-save-state = always
    unfocused-split-opacity = 1
    scrollbar = never
    background-opacity = 0.90
    background-blur = true
    keybind = alt+f=set_font_size:16
    keybind = alt+g=set_font_size:13
    keybind = alt+shift+g=set_font_size:10
    keybind = alt+t=new_tab
    keybind = alt+s=new_split:right
    keybind = alt+x=new_split:down
    keybind = alt+i=previous_tab
    keybind = alt+o=next_tab
    keybind = alt+h=goto_split:left
    keybind = alt+l=goto_split:right
    keybind = alt+j=goto_split:bottom
    keybind = alt+k=goto_split:top
    keybind = alt+,=reload_config
    keybind = alt+w=close_surface
    keybind = alt+enter=toggle_split_zoom
    keybind = alt+u=scroll_page_up
    keybind = alt+d=scroll_page_down
    keybind = global:cmd+alt+ctrl+shift+enter=toggle_quick_terminal
    mouse-scroll-multiplier = 2
    cursor-style = bar
    cursor-style-blink = true
    shell-integration = zsh
    command = zsh
    macos-option-as-alt = true
    macos-icon = custom-style
    macos-icon-frame = plastic
  '';
}
