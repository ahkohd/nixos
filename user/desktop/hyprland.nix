{ inputs, ... }:
let
  desktop_font = "TX-02-AREMU";
  display_picture = "~/.avatars/var.png";
  wallpapers = [ "~/.wallpapers/01.png" "~/.wallpapers/02.png" ];
  active_wallpaper = builtins.elemAt wallpapers 0;
  hyprlock_theme = {
    fg = "255, 255, 255";
    primary = "120, 196, 241";
  };
  default_apps = {
    terminal = "ghostty";
    fileManager = "nautilus";
    menu = "fuzzel";
    browser = "brave";
  };
in {

  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  wayland.windowManager.hyprland.enable = true;

  # Hint Electron apps to use Wayland:
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];

  wayland.windowManager.hyprland.settings = with default_apps; {
    animation = [ "workspaces, 0" ];
    "$mod" = "SUPER";
    "$hyper" = "SUPER + ALT + CTRL + SHIFT";
    "$terminal" = terminal;
    "$fileManager" = fileManager;
    "$menu" = menu;
    "$browser" = browser;
    input = { touchpad = { natural_scroll = true; }; };
    general = {
      gaps_in = 5;
      gaps_out = 10;
      layout = "dwindle";
      border_size = 2;
      "col.active_border" = "rgba(29a4bdff)";
      "col.inactive_border" = "rgba(414868ff)";
    };
    decoration = {
      rounding = 12;
      blur = {
        enabled = true;
        size = 8;
        passes = 2;
      };
      shadow = {
        enabled = true;
        range = 50;
        render_power = 3;
        color = "rgba(1a1a1a31)";
      };
    };
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };
    bind = [
      "$mod, B, exec, $browser"
      "$mod, T, exec, $terminal"
      "$mod, F, exec, $fileManager"
      "$mod, slash, exec, $menu"
    ] ++ [
      "$mod, Q, killactive"
      "$mod, G, togglefloating"
      "$mod, O, togglesplit"

      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"

      "$hyper, J, movewindow, d"
      "$hyper, K, movewindow, u"
      "$hyper, H, movewindow, l"
      "$hyper, L, movewindow, r"

      "$hyper, S, resizeactive, 0 100"
      "$hyper, D, resizeactive, 0 -100"
      "$hyper, A, resizeactive, 100 0"
      "$hyper, F, resizeactive, -100 0"

      "$mod, Return, togglespecialworkspace"
    ] ++ [
      "$mod, Escape, exec, hyprlock --immediate"
      "$mod SHIFT, Escape, exit"

      "$mod SHIFT, J, workspace, e-1"
      "$mod SHIFT, K, workspace, e+1"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

      "$mod SHIFT, H, movetoworkspace, e-1"
      "$mod SHIFT, L, movetoworkspace, e+1"

      "$hyper, Y, workspace, 1"
      "$hyper, U, workspace, 2"
      "$hyper, I, workspace, 3"
      "$hyper, O, workspace, 4"
      "$hyper, P, workspace, 5"

      "$hyper, Q, movetoworkspace, 1"
      "$hyper, W, movetoworkspace, 2"
      "$hyper, E, movetoworkspace, 3"
      "$hyper, R, movetoworkspace, 4"
      "$hyper, T, movetoworkspace, 5"
    ] ++ (builtins.concatLists (builtins.genList (i:
      let ws = i + 1;
      in [
        "$mod, ${toString i}, workspace, ${toString ws}"
        "$mod SHIFT, ${toString i}, movetoworkspace, ${toString ws}"
      ]) 5));
    bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
    windowrulev2 = [
      "opacity 0.90, class:^(com.mitchellh.ghostty)$"

      "opacity 0.90, class:^(brave-browser)$"
      "opacity 1.0 override, title: (.*YouTube.*)$"
      "opacity 1.0 override, title: (.*Netflix.*)$"
      "opacity 1.0 override, title: (.*t3rn.*)$ class:^(brave-browser)$"

      "opacity 0.90, class:^(spotify)$"
      "opacity 0.90, class:^(ferdium)$"
      "opacity 0.90, class:^(1Password)$"
      "opacity 0.90, class:^(obsidian)$"
      "opacity 0.90, class:^(Slack)$"
      "opacity 0.90, class:^(org.gnome.Nautilus)$"

      "noblur, class:(), title:()"
      "noshadow, class:(), title:()"
      "opaque, class:(), title:()"
    ];
    layerrule = [ "dimaround,launcher" ];
    workspace = "1,monitor:auto";
    exec-once = with default_apps; [ terminal ];
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = false;
      splash = false;
      preload = wallpapers;
      wallpaper = "DP-1,${active_wallpaper}";
    };
  };

  programs.hyprpanel.overlay.enable = true;

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    theme = "tokyo_night";
    override = { };

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "systray" ];
          middle = [ "windowtitle" ];
          right = [ "media" "volume" "network" "clock" "notifications" ];
        };
      };
    };

    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;

      bar.clock.format = "%a %d %b %I:%M%p";
      bar.clock.showIcon = false;
      bar.network.label = false;
      bar.volume.label = false;

      menus.clock = {
        time = {
          military = false;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enabled = false;
      menus.dashboard.powermenu.avatar.image = display_picture;
      menus.dashboard.shortcuts.left.shortcut1.command = "1password";
      menus.dashboard.shortcuts.left.shortcut1.icon = "󰯄";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "1password";
      menus.dashboard.shortcuts.left.shortcut2.command = "spotify";
      menus.dashboard.shortcuts.left.shortcut2.icon = "󰎄";
      menus.dashboard.shortcuts.left.shortcut2.tooltip = "Spotify";
      menus.dashboard.shortcuts.left.shortcut3.command = "ferdium";
      menus.dashboard.shortcuts.left.shortcut3.icon = "󰵅";
      menus.dashboard.shortcuts.left.shortcut3.tooltip = "Ferdium";
      menus.dashboard.shortcuts.left.shortcut4.command = "fuzzel";
      menus.dashboard.shortcuts.left.shortcut4.icon = "󰵆";
      menus.dashboard.shortcuts.left.shortcut4.tooltip = "Search Apps";

      theme.bar.buttons.workspaces.pill.active_width = "12em";
      theme.bar.buttons.workspaces.pill.height = "4em";
      theme.bar.buttons.workspaces.pill.radius = "1.9rem * 0.6";
      theme.bar.buttons.workspaces.pill.width = "4em";
      theme.bar.buttons.workspaces.smartHighlight = true;
      theme.bar.buttons.radius = "0.5em";
      theme.bar.transparent = false;
      theme.bar.opacity = 90;
      theme.bar.outer_spacing = "1em";

      theme.bar.menus.popover.scaling = 90;
      theme.bar.menus.popover.radius = "0.6rem";

      theme.font = {
        name = desktop_font;
        size = "14.5px";
        weight = 500;
      };
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 2;
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
        ignore_empty_input = true;
      };

      background = [{
        path = active_wallpaper;
        blur_passes = 3;
        blur_size = 8;
        noise = 1.0e-2;
        contrast = 0.8916;
        brightness = 0.7;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      }];

      input-field = with hyprlock_theme; [{
        monitor = "";
        size = "225, 50";
        outline_thickness = 3;
        dots_size = 0.33;
        dots_spacing = 0.45;
        dots_center = true;
        dots_rounding = -1;
        outer_color = "rgba(0,0,0,0)";
        inner_color = "rgba(0,0,0,0)";
        font_color = "rgba(${primary}, 0.15)";
        fade_on_empty = false;
        fade_timeout = 1000;
        font_family = desktop_font;
        placeholder_text = "";
        hide_input = false;
        rounding = 4;
        check_color = "rgba(0,0,0,0)";
        fail_color = "rgba(0,0,0,0)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        fail_transition = 200;
        capslock_color = -1;
        numlock_color = -1;
        bothlock_color = -1;
        invert_numlock = false;
        swap_font_color = false;
        position = "0, 150";
        halign = "center";
        valign = "bottom";
      }];

      label = with hyprlock_theme; [
        # (date)
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = "rgba(${fg}, 0.7)";
          font_size = 15;
          font_family = desktop_font;
          position = "75, -75";
          shadow_passes = 5;
          shadow_size = 10;
          halign = "left";
          valign = "top";
        }
        # (hours)
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%H")"'';
          color = "rgba(${fg}, 0.7)";
          shadow_pass = 2;
          shadow_size = 3;
          shadow_color = "rgb(0,0,0)";
          shadow_boost = 1.2;
          font_size = 150;
          font_family = desktop_font;
          position = "0, 90";
          halign = "center";
          valign = "center";
        }
        # (minutes)
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%M")"'';
          color = "rgba(${fg}, 0.7)";
          font_size = 150;
          font_family = desktop_font;
          position = "0, -90";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "ghostty -e";
        layer = "overlay";
        dpi-aware = false;
        icon-theme = "Papirus-Dark";
        font = "Berkeley Mono:weight=regular:size=14";
        use-bold = false;
        line-height = 25;
        match-mode = "fzf";
        fields = "name,generic,comment,categories,filename,keywords";
        prompt = "  ";
        placeholder = "Search";
        show-actions = true;
        exit-on-keyboard-focus-loss = true;
        width = 50;
      };
      colors = {
        background = "1f2335ff";
        text = "c0caf5ff";
        match = "2ac3deff";
        selection = "363d59ff";
        selection-match = "2ac3deff";
        selection-text = "c0caf5ff";
        border = "414868ff";
      };
      border = {
        radius = 50;
        width = 2;
      };
      dmenu = { exit-immediately-if-empty = true; };
    };
  };

  home.file.".wallpapers/01.png".source = ./assets/wallpapers/01.png;
  home.file.".wallpapers/02.png".source = ./assets/wallpapers/02.png;
  home.file.".avatars/var.png".source = ./assets/avatars/var.png;
}
