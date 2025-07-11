let
  wallpaperPath = "/home/dima/Downloads/396783-wallpaper-anime-girl-flower-umbrella-raining-4k.jpg";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      monitor=,preferred,auto,auto

      $terminal = alacritty
      $fileManager = dolphin
      $menu = wofi --show drun

      env = XDG_CURRENT_DESKTOP="Hyprland"
      env = XDG_SESSION_TYPE="wayland"
      env = XDG_SESSION_DESKTOP="Hyprland"
      env = QT_AUTO_SCREEN_SCALE_FACTOR="1"
      env = QT_QPA_PLATFORM="wayland"
      env = QT_QPA_PLATFORMTHEME="gtk3"
      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24

      exec-once = hyprpaper
      exec-once = waybar
      exec-once = mako
      exec-once = wl-paste --type text --watch cliphist store
      exec-once = wl-paste --type image --watch cliphist store

      general {
        gaps_in = 5
        gaps_out = 20
        border_size = 1
        col.active_border = rgba(595959aa)
        col.inactive_border = rgba(595959aa)
        resize_on_border = true
        allow_tearing = false
        layout = dwindle
      }

      decoration {
        rounding = 10
        active_opacity = 0.98
        inactive_opacity = 0.9
        shadow {
          enabled = true
          range = 4
          render_power = 3
          color = rgba(1a1a1aee)
        }
        blur {
          enabled = true
          size = 3
          passes = 1
          vibrancy = 0.1696
        }
      }

      animations {
        enabled = true
        bezier = linear, 0, 0, 1, 1
        bezier = md3_standard, 0.2, 0, 0, 1
        bezier = md3_decel, 0.05, 0.7, 0.1, 1
        bezier = md3_accel, 0.3, 0, 0.8, 0.15
        bezier = overshot, 0.05, 0.9, 0.1, 1.1
        bezier = crazyshot, 0.1, 1.5, 0.76, 0.92
        bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
        bezier = fluent_decel, 0.1, 1, 0, 1
        bezier = easeInOutCirc, 0.85, 0, 0.15, 1
        bezier = easeOutCirc, 0, 0.55, 0.45, 1
        bezier = easeOutExpo, 0.16, 1, 0.3, 1
        animation = windows, 1, 3, md3_decel, popin 60%
        animation = border, 1, 10, default
        animation = fade, 1, 2.5, md3_decel
        animation = workspaces, 1, 3.5, easeOutExpo, slide
        animation = specialWorkspace, 1, 3, md3_decel, slidevert
      }

      dwindle {
        pseudotile = true
        preserve_split = true
      }

      master {
        new_status = master
      }

      misc {
        force_default_wallpaper = -1
        disable_hyprland_logo = true
      }

      input {
        kb_layout = us, ru, il
        kb_variant =
        kb_model =
        kb_options = grp:caps_toggle
        kb_rules =
        follow_mouse = 1
        sensitivity = 0
        touchpad {
          natural_scroll = true
        }
      }

      gestures {
        workspace_swipe = true
      }

      device {
        name = epic-mouse-v1
        sensitivity = -0.5
      }

      $mainMod = SUPER

      bind = $mainMod, SPACE, exec, $terminal
      bind = ALT, B, exec, hyprshot -m window
      bind = $mainMod, Q, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, V, togglefloating,
      bind = ALT, SPACE, exec, $menu
      bind = $mainMod, J, togglesplit,
      bind = $mainMod, R, exec, wlogout
      bind = $mainMod, F, exec, firefox
      bind = $mainMod, N, exec, thunar
      bind = ALT, B, exec, grim ~/Pictures/screenshot.png
      bind = $mainMod, P, exec, overskride
      bind = $mainMod, C, exec, code
      bind = $mainMod, Z, exec, zen
      bind = $mainMod, S, exec, spotify
      bind = $mainMod, T, exec, Telegram
      bind = $mainMod, Y, exec, firefox youtube.com
	  bind = SUPER SHIFT, P, exec, sh ~/.config/home-manager/powermenu/powermenu.sh

      bind = ALT, H , movefocus, l
      bind = ALT, L, movefocus, r
      bind = ALT, K, movefocus, u
      bind = ALT, J, movefocus, d

      bind = SUPER SHIFT, M, exec, pkill -SIGUSR1 waybar
      bind = SUPER SHIFT, SPACE, exec, pkill -SIGUSR2 waybar

      bind = $mainMod, H, swapwindow, l
      bind = $mainMod, L, swapwindow, r
      bind = $mainMod, K, swapwindow, u
      bind = $mainMod, J, swapwindow, d

      bind = $mainMod, W, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      bind = CTRL, H, resizeactive, -60 0
      bind = CTRL, L, resizeactive, 60 0
      bind = CTRL, J, resizeactive, 0 60
      bind = CTRL, K, resizeactive, 0 -60

      bind = $mainMod SHIFT, S, movetoworkspace, special:magic
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindel = ,XF86MonBrightnessUp, exec, brightnessctl set 10%+
      bindel = ,XF86MonBrightnessDown, exec, brightnessctl set 10%-

      bindl = , XF86AudioNext, exec, playerctl next
      bindl = , XF86AudioPause, exec, playerctl play-pause
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous

      windowrulev2 = suppressevent maximize, class:.*
      windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
      windowrulev2 = float, size: 80% 70%, title:(Volume Control)
      windowrulev2 = float, size: 80% 70% title:(overskride)
      windowrulev2 = float, size: 60% 50% class:(thunar)
      windowrulev2 = float, class:(org.gnome.Loupe)
      windowrulev2 = workspace: 2, class:(Alacritty)
      windowrulev2 = workspace: 3, class:(firefox)
      windowrulev2 = workspace: 4, class:(Spotify)
      windowrulev2 = workspace: 3, class:(zen-beta)
      windowrulev2 = workspace: 1, class:(Code)

      debug {
        damage_tracking=2
      }

      xwayland {
        force_zero_scaling = true
      }

      ecosystem:no_update_news = true
    '';
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ wallpaperPath ];
      wallpaper = [ ", ${wallpaperPath}" ];
    };
  };
}
