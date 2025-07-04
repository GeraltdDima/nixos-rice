{
    programs.waybar = {
        enable = true;

        style =
        ''
            * {
                border: none;
                border-radius: 0;
                /* `otf-font-awesome` is required to be installed for icons */
                font-family: FontAwesome, JetBrains Mono Bold, sans-serif;
                min-height: 20px;
                transition: ease-in-out 0.2s;
            }

            window#waybar {
                background: transparent;
            }

            window#waybar.hidden {
                opacity: 0.2;
            }

            #workspaces {
                margin-right: 8px;
                border-radius: 10px;

                background: #383c4a;
            }

            #workspaces button {

                color: white;
                background: transparent;
                padding: 5px;
                border-radius: inherit;
                font-size: 16px;
            }

            #workspaces button.persistent {
                color: white;
            }

            /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
            #workspaces button:hover {

                box-shadow: inherit;
                text-shadow: inherit;
                background: #7c818c;
            }

            #workspaces button.active {
                background: #4e5263;
                color: white;
                border-radius: inherit;
            }

            #custom-kblayout {
                padding-left: 16px;
                padding-right: 8px;
                border-radius: 10px 0px 0px 10px;

                color: #ffffff;
                background: #383c4a;
            }

            #keyboard-state {
                margin-right: 8px;
                padding-right: 16px;
                border-radius: 0px 10px 10px 0px;

                color: #ffffff;
                background: #383c4a;
            }

            #submap {
                padding-left: 16px;
                padding-right: 16px;
                border-radius: 10px;

                color: #ffffff;
                background: #383c4a;
            }

            #clock {
                padding-left: 16px;
                padding-right: 16px;
                border-radius: 10px 10px 10px 10px;
                margin-right: 10px;

                color: #ffffff;
                background: #383c4a;
            }

            #pulseaudio {
                margin-right: 8px;
                padding-left: 16px;
                padding-right: 16px;
                border-radius: 10px;

                color: #ffffff;
                background: #383c4a;
            }

            #pulseaudio.muted {
                background-color: #90b1b1;
                color: #2a5c45;
            }

            #custom-mem {
                margin-right: 8px;
                padding-left: 16px;
                padding-right: 16px;
                border-radius: 10px;

                color: #ffffff;
                background: #383c4a;
            }

            #cpu {
                margin-right: 8px;
                padding-left: 16px;
                padding-right: 16px;
                border-radius: 10px;

                color: #ffffff;
                background: #383c4a;
            }

            #backlight {
                margin-right: 8px;
                padding-left: 16px;
                padding-right: 16px;
                border-radius: 10px;

                color: #ffffff;
                background: #383c4a;
            }

            #battery {
                margin-right: 8px;
                padding-left: 16px;
                padding-right: 16px;
                border-radius: 10px;

                color: #ffffff;
                background: #383c4a;
            }

            #battery.charging {
                color: #ffffff;
                background-color: #26A65B;
            }

            #battery.warning:not(.charging) {
                background-color: #ffbe61;
                color: black;
            }

            #battery.critical:not(.charging) {
                background-color: #f53c3c;
                color: #ffffff;
                animation-name: blink;
                animation-duration: 0.5s;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }

            @keyframes blink {
                to {
                    background-color: #ffffff;
                    color: #000000;
                }
            }

            #custom-cava {
                padding-left: 16px;
                padding-right: 16px;
                border-radius: 10px 10px 10px 10px;

                color: #ffffff;
                background: #383c4a;
                font-size: 10px;
                font-weight: bold;
            }
        '';
          settings = {
            mainBar = {
              layer = "top";
              position = "top";
              margin = "9 13 -10 18";
              modules-left = [
                "hyprland/workspaces"
                "custom/kblayout"
                "keyboard-state"
                "hyprland/submap"
                "custom/cava"
              ];
              modules-right = [
                "clock"
                "pulseaudio"
                "custom/mem"
                "cpu"
                "backlight"
                "battery"
              ];

              "hyprland/workspaces" = {
                on-click = "activate";
                active-only = false;
                all-outputs = true;
                format = "{}";
                format-icons = {
                  urgent = "";
                  active = "";
                  default = "";
                };
                persistent-workspaces = {
                  "*" = 5;
                };
              };

              "custom/kblayout" = {
                exec = "python3 ~/.config/waybar/scripts/kblayout.py";
                interval = 1;
                tooltip = false;
              };

              "keyboard-state" = {
                capslock = true;
                format = "{icon} ";
                format-icons = {
                  locked = " ";
                  unlocked = "";
                };
              };

              "hyprland/submap" = {
                format = "pon {}";
              };

              "clock" = {
                tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                format = "{:%a, %d %b, %I:%M %p}";
              };

              "pulseaudio" = {
                format = "{icon} {volume}%";
                format-muted = " {format_source}";
                format-source = "{volume}% ";
                format-source-muted = "";
                format-icons = {
                  headphone = "";
                  hands-free = "";
                  headset = "";
                  phone = "";
                  portable = "";
                  car = "";
                  default = [ "" " " " " ];
                };
                on-click = "pavucontrol";
              };

              "custom/mem" = {
                format = "{} ";
                interval = 3;
                exec = "free -h | awk '/Mem:/{printf $3}'";
                tooltip = false;
              };

              "cpu" = {
                interval = 2;
                format = "{usage}% ";
                min-length = 6;
                on-click = "alacritty --command btop";
              };

              "backlight" = {
                device = "intel_backlight";
                format = "{percent}% {icon}";
                format-icons = [ "" ];
                min-length = 7;
              };

              "battery" = {
                states = {
                  warning = 30;
                  critical = 15;
                };
                format = "{capacity}% {icon}";
                format-charging = "{capacity}% ";
                format-plugged = "{capacity}% ";
                format-alt = "{time} {icon}";
                format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
                on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
              };

              "custom/cava" = {
                format = "{}";
                exec = "sh ~/.config/waybar/scripts/cava.sh";
                tooltip = false;
              };
            };
          };
    };
}
