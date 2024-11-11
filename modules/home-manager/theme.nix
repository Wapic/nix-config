{pkgs, config, ... }: {

    ############################
    ### theme related config ###
    ############################

    colorScheme = {
        slug = "wapic";
        name = "wapic";
        author = "wapic";
        palette = {
            base00 = "#000000";
            base01 = "#FA5355";
            base02 = "#3A9850";
            base03 = "#BDB000";
            base04 = "#4581EB";
            base05 = "#FA54FF";
            base06 = "#33C2C1";
            base07 = "#1A1A1A";
            base08 = "#1F2329";
            base09 = "#FB7172";
            base0A = "#67FF4F";
            base0B = "#FFFF00";
            base0C = "#6D9DF1";
            base0D = "#FV82FF";
            base0E = "#60D3D1";
            base0F = "#A0A8B7";
        };
    };

    home = {
        packages = with pkgs; [
            lavanda-gtk-theme
            adwaita-icon-theme
        ];

        pointerCursor = {
            gtk.enable = true;
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
            size = 30;
        };
    };

    gtk = {
        enable = true;

        theme = {
            package = pkgs.lavanda-gtk-theme;
            name = "Lavanda-Sea-Dark";
        };

        cursorTheme = {
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
        };

        iconTheme = {
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
        };

        font = {
            name = "Fira Code Nerd Font Regular";
            size = 14;
        };
    };

    wayland.windowManager.hyprland.settings = {
        env = [ "XCURSOR_SIZE,30" ];
        exec-once = [ "hyprctl setcursor Adwaita 30" ];
        general."col.active_border" = "0xff${config.colorScheme.palette.base06}";
        general."col.inactive_border" = "0xff${config.colorScheme.palette.base07}";
        decoration."col.shadow" = "0xff${config.colorScheme.palette.base00}";
    };

    programs = {
        kitty = {
            font.name = "Fira Code Nerd Font Mono";
            font.size = 14;
            settings = {
                background = "#${config.colorScheme.palette.base08}";
                foreground = "#${config.colorScheme.palette.base0F}";

                selection_background = "#${config.colorScheme.palette.base0F}";
                selection_foreground = "#${config.colorScheme.palette.base00}";

                cursor = "#${config.colorScheme.palette.base0F}";

                color0 = "#${config.colorScheme.palette.base00}";
                color1 = "#${config.colorScheme.palette.base01}";
                color2 = "#${config.colorScheme.palette.base02}";
                color3 = "#${config.colorScheme.palette.base03}";
                color4 = "#${config.colorScheme.palette.base04}";
                color5 = "#${config.colorScheme.palette.base05}";
                color6 = "#${config.colorScheme.palette.base06}";
                color7 = "#${config.colorScheme.palette.base07}";
                color8 = "#${config.colorScheme.palette.base08}";
                color9 = "#${config.colorScheme.palette.base09}";
                color10 = "#${config.colorScheme.palette.base0A}";
                color11 = "#${config.colorScheme.palette.base0B}";
                color12 = "#${config.colorScheme.palette.base0C}";
                color13 = "#${config.colorScheme.palette.base0D}";
                color14 = "#${config.colorScheme.palette.base0E}";
                color15 = "#${config.colorScheme.palette.base0F}";
            };
        };

        waybar.style = ''
            * {
                font-size: 20px;
                font-family: 'Fira Code Nerd Font Regular';
            }

            #custom-right-arrow-dark,
            #custom-left-arrow-dark {
                color: #1a1a1a;
            }
            #custom-right-arrow-light,
            #custom-left-arrow-light {
                color: #${config.colorScheme.palette.base08};
                background: #1a1a1a;
            }

            window#waybar {
                background: #${config.colorScheme.palette.base08};
                color: #${config.colorScheme.palette.base0F};
            }

            #workspaces button {
                padding: 0 2px;
            }
            #workspaces button.active {
                color: #${config.colorScheme.palette.base04};
            }
            #workspaces button:hover {
                text-shadow: inherit;
                box-shadow: inherit;
                background: #101010;
                border: #101010;
                padding: 0 2px;
                color: #${config.colorScheme.palette.base0C};
            }

            #pulseaudio {
                color: #${config.colorScheme.palette.base04};
            }
            #battery {
                color: #${config.colorScheme.palette.base02};
            }
            #bluetooth {
                color: #${config.colorScheme.palette.base06};
            }

            #network,
            #workspaces,
            #clock,
            #pulseaudio,
            #battery,
            #bluetooth,
            #tray {
                background: #1a1a1a;
            }

            #bluetooth,
            #clock,
            #pulseaudio,
            #network,
            #battery {
                padding: 0 10px;
            }
        '';

        wofi.style = ''
            window {
                border:     1px solid #${config.colorScheme.palette.base06};
                background-color:   #${config.colorScheme.palette.base08};
            }

            #input {
                border: none;
                background-color: #${config.colorScheme.palette.base07};
                color: #${config.colorScheme.palette.base0F};
                margin: 2px 2px 0px;
                outlne: none;
            }

            #entry {
                margin: 0px;
            }

            #entry:selected {
                outline: none;
                background-color: #${config.colorScheme.palette.base07};
                margin: 0px 2px 0px 2px;
                padding-left: 8px;
            }

            #innerbox {
                margin: -2px;
            }

            #scroll {
                padding: 0px 0px 4px 0px;
            }
            #text {
                color: #${config.colorScheme.palette.base0F}
            }
        '';
    };

    services = {
        dunst.settings = {
            global = {
                icon_theme = "Adwaita";
                font = "Fira Code Nerd Font Regular 14";
                frame_color = "#${config.colorScheme.palette.base06}";
                foreground = "#${config.colorScheme.palette.base0F}";
                background = "#${config.colorScheme.palette.base08}";
            };
            urgency_critical.frame_color = "#${config.colorScheme.palette.base01}";
        };
    };
}
