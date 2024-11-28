{ pkgs, config, nix-colors, ... }: let 
    nix-colors-lib = nix-colors.lib.contrib { inherit pkgs; };
in {
    
    ############################
    ### theme related config ###
    ############################

    home.file.print-theme = {
        enable = true;
        executable = true;
        target = "scripts/print-colors.sh";
        text = ''
            show_color(){
                for i do
                    printf '\e]4;%d;%s\a\e[0;48;5;%dm%s\e[m\n' "$#" "$i" "$#" "$i"
                    shift
                done
            }

            show_color "#${config.colorScheme.palette.base00}" "#${config.colorScheme.palette.base01}" "#${config.colorScheme.palette.base02}" "#${config.colorScheme.palette.base03}" "#${config.colorScheme.palette.base04}" "#${config.colorScheme.palette.base05}" "#${config.colorScheme.palette.base06}" "#${config.colorScheme.palette.base07}" "#${config.colorScheme.palette.base08}" "#${config.colorScheme.palette.base09}" "#${config.colorScheme.palette.base0A}" "#${config.colorScheme.palette.base0B}" "#${config.colorScheme.palette.base0C}" "#${config.colorScheme.palette.base0D}" "#${config.colorScheme.palette.base0E}" "#${config.colorScheme.palette.base0F}"
        '';
    };

    colorScheme = {
        slug = "wapic";
        name = "wapic";
        author = "wapic";
        palette = {
            base00 = "011111"; #Background-Dark
            base01 = "012120"; #Background
            base02 = "05625E"; #Background-Bright
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
            base0F = "438279"; # Foreground
        };
    };

    home = {
        packages = with pkgs; [
            lavanda-gtk-theme
            adwaita-icon-theme
            kdePackages.breeze-icons
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
            package = pkgs.kdePackages.breeze-icons;
            name = "Breeze";
        };

        font = {
            name = "Fira Code Nerd Font Regular";
            size = 14;
        };
    };

    wayland.windowManager.hyprland.settings = {
        env = [ "XCURSOR_SIZE,30" ];
        exec-once = [ "hyprctl setcursor Adwaita 30" ];
        general."col.active_border" = "0xff${config.colorScheme.palette.base02}";
        general."col.inactive_border" = "0xff${config.colorScheme.palette.base03}";
        decoration."col.shadow" = "0xff${config.colorScheme.palette.base01}";
    };

    programs = {
        kitty = {
            font.name = "Fira Code Nerd Font Mono";
            font.size = 14;
            settings = {
                background_opacity = 0.9;
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
                color: #${config.colorScheme.palette.base0F};
            }
            #pulseaudio {
                color: #00aaff;
            }
            #battery {
                color: #8ebd6b;
            }
            #bluetooth {
                color: #00ffff;
            }
            #network {
                color: #ffffff;
            }
            #clock {
                color: #ffffff;
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
                border: 1px solid #${config.colorScheme.palette.base0D};
                background-color: #${config.colorScheme.palette.base01};
                color: #${config.colorScheme.palette.base0F}
            }

            #outer-box {
                margin: 4px;
            }

            #entry:selected, #input {
                outline: none;
                background-color: #${config.colorScheme.palette.base00};
            }

            #img {
                padding-right: 4px;
            }
        '';
    };

    services = {
        dunst.settings = {
            global = {
                icon_theme = "Breeze";
                font = "Fira Code Nerd Font Regular 14";
                frame_color = "#${config.colorScheme.palette.base0D}";
                foreground = "#${config.colorScheme.palette.base0F}";
                background = "#${config.colorScheme.palette.base01}";
            };
            urgency_critical.frame_color = "#${config.colorScheme.palette.base08}";
        };
    };
}
