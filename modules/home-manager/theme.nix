{pkgs, config, ... }: {

    ############################
    ### theme related config ###
    ############################

    colorScheme = {
        slug = "wapic";
        name = "wapic";
        author = "wapic";
        palette = {
            base00 = "12151a"; #Background-Darker
            base01 = "1c2128"; #Background
            base02 = "373e47"; #Background-Bright
            base03 = "545d68"; 
            base04 = "768390";
            base05 = "909dab";
            base06 = "bdb000"; # yellow
            base07 = "39cfe6"; # cyan
            base08 = "f47067"; # red
            base09 = "e0823d"; # orange
            base0A = "c69026"; # gold?
            base0B = "57ab5a"; # Green
            base0C = "96d0ff"; # light blue
            base0D = "539bf5"; # blue
            base0E = "e275ad"; # pink
            base0F = "adbac7"; # Foreground
        };
    };

    home = {
        packages = with pkgs; [
            lavanda-gtk-theme
            adwaita-icon-theme
            adwaita-qt
        ];

        pointerCursor = {
            gtk.enable = true;
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
            size = 30;
        };
    };

    qt = {
        enable = true;
        style = {
            name = "adwaita-dark";
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
        general."col.active_border" = "0xff${config.colorScheme.palette.base0D}";
        general."col.inactive_border" = "0xff${config.colorScheme.palette.base01}";
        decoration."col.shadow" = "0xff${config.colorScheme.palette.base01}";
    };

    programs = {
        kitty = {
            font.name = "Fira Code Nerd Font Mono";
            font.size = 14;
            settings = {
                background = "#${config.colorScheme.palette.base01}";
                foreground = "#${config.colorScheme.palette.base0F}";

                selection_background = "#${config.colorScheme.palette.base0F}";
                selection_foreground = "#${config.colorScheme.palette.base01}";

                cursor = "#${config.colorScheme.palette.base0F}";
            };
        };

        waybar.style = ''
            * {
                font-size: 20px;
                font-family: 'Fira Code Nerd Font Regular';
            }

            #custom-right-arrow-dark,
            #custom-left-arrow-dark {
                color: #${config.colorScheme.palette.base00};
            }
            #custom-right-arrow-light,
            #custom-left-arrow-light {
                color: #${config.colorScheme.palette.base01};
                background: #${config.colorScheme.palette.base00};
            }

            window#waybar {
                background: #${config.colorScheme.palette.base01};
                color: #${config.colorScheme.palette.base0F};
            }

            #workspaces button {
                padding: 0 2px;
            }
            #workspaces button.active {
                color: #${config.colorScheme.palette.base0D};
            }
            #workspaces button:hover {
                color: #${config.colorScheme.palette.base0C};
            }
            #pulseaudio {
                color: #${config.colorScheme.palette.base0D};
            }
            #battery {
                color: #${config.colorScheme.palette.base0B};
            }
            #bluetooth {
                color: #${config.colorScheme.palette.base07};
            }

            #network,
            #workspaces,
            #clock,
            #pulseaudio,
            #battery,
            #bluetooth,
            #tray {
                background: #${config.colorScheme.palette.base00};
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
                border:     1px solid #${config.colorScheme.palette.base0D};
                background-color:   #${config.colorScheme.palette.base01};
            }

            #input {
                border: none;
                background-color: #${config.colorScheme.palette.base00};
                color: #${config.colorScheme.palette.base0F};
                margin: 2px 2px 0px;
                outlne: none;
            }

            #entry {
                margin: 0px;
            }

            #entry:selected {
                outline: none;
                background-color: #${config.colorScheme.palette.base00};
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
                frame_color = "#${config.colorScheme.palette.base0D}";
                foreground = "#${config.colorScheme.palette.base0F}";
                background = "#${config.colorScheme.palette.base01}";
            };
            urgency_critical.frame_color = "#${config.colorScheme.palette.base08}";
        };
    };
}
