{ config, pkgs, ... }:

{
  programs.zellij = { enable = true; };

  home.file.".config/zellij/config.kdl".text = ''
    default_shell "zsh"
    pane_frames false
    simplified_ui true
    theme "nord"

    keybinds {
      move {
        unbind "Ctrl h"
        bind "Ctrl x" { SwitchToMode "Normal"; }
      }

      shared_except "tab" "locked" {
        unbind "Ctrl h"

        bind "Ctrl x" { SwitchToMode "Move"; }
      }

      shared_except "locked" {
        bind "Alt f" { ToggleFloatingPanes; SwitchToMode "Normal"; }

        bind "Alt b" {
              LaunchOrFocusPlugin "file:~/.config/zellij/plugins/harpoon.wasm" {
                  floating true; move_to_focused_tab true;
              }
          }

        bind "Alt m" { ToggleFocusFullscreen; }
      }
    }

    ui {
      pane_frames {
        hide_session_name true
      }
    }
  '';

  home.file.".config/zellij/layouts/default.kdl".text = ''
        layout {
        default_tab_template {
            pane size=1 borderless=true {
                plugin location="file:${pkgs.zjstatus}/bin/zjstatus.wasm" {
                    format_left   "{tabs}"
                    format_center "{mode}"
                    format_right  ""
                    format_space  ""

                    border_enabled  "false"
                    border_char     "─"
                    border_format   "#[fg=#6C7086]{char}"
                    border_position "top"

                    mode_normal        "⚡"
                    mode_locked        "  ^+g: normal"
                    mode_resize        "  n: normal h: i  j: i  k: i  l: i  H: d  J: d  K: d  L: d  =: inc. -: dec."
                    mode_pane          "  n: new d: new  r: new  p: focus w: float e: embed f: full-screen c: rename x: close"
                    mode_tab           "  n: new r: rename l:   h:   x: close s: sync b: break p. 󰅪: break r. 󰅪: break l.  : toggle"
                    mode_scroll        " e: edit s: search ^+c: bottom j:  k:   ^+f: pg.  ^+b: pg.  d: half  u: half "
                    mode_enter_search  "  #[italic]search..."
                    mode_search        "  j:   k:   ^+f: pg.  ^+b: pg.  d: half  u: half  n: next p: prev c: case w: wrap o: word"
                    mode_rename_tab    "  (rename) ^+c: normal esc: undo"
                    mode_rename_pane   "  (rename) ^+c: normal esc: undo"
                    mode_session       "  ^+o: normal ^+s: scroll d: detach w: manager"
                    mode_move          "  ^+x: normal (n, ): move p: backwards h:   j:   k:   l: "
                    mode_prompt        ""
                    mode_tmux          ""

                    tab_normal   "#[fg=#6C7086] {name} "
                    tab_active   "#[fg=#9399B2,bold,italic] {name} "
                }
            }
            children
        }
    }
  '';

  home.file.".config/zellij/plugins/harpoon.wasm".source = builtins.fetchurl {
    url =
      "https://github.com/Nacho114/harpoon/releases/download/v0.1.0/harpoon.wasm";
    sha256 = "00ln03gjpf6xdfq1d3z84pcvmyrk1n1ddi1nkfxsmnqxldyzinfa";
  };
}
