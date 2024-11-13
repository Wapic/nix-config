{ lib, config, pkgs, ... }: {
    
    home.packages = with pkgs; [
        slurp
        grim
        hyprpicker
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;

        settings = {
            exec-once = [
                "waybar"
                "lxqt-policykit-agent"
            ];

            env = [
                "NIXOS_OZONE_WL,1"
                "SDL_VIDEODRIVER,wayland,x11,xcb"
                "QT_QPA_PLATFORM,wayland;xcb"
                "CLUTTER_BACKEND,wayland"
                "GDK_BACKEND,wayland,x11,*"
            ];

            monitor = [
                ",preffered,auto,1.0"
            ];

            "$terminal" = "kitty";
            "$terminal_floating" = "kitty --class=term_floating";
            "$menu" = "wofi -a --show drun";
            "$mod" = "SUPER";

            general = {
                gaps_in = 2;
                gaps_out = 8;

                border_size = 1;

                resize_on_border = false;
                allow_tearing = true;
                layout = "dwindle";
            };

            decoration = {
                rounding = 6;

                active_opacity = 1.0;
                inactive_opacity = 1.0;

                drop_shadow = false;
                shadow_range = 0;
                shadow_render_power = 3;

                blur = {
                    enabled = true;
                    size = 4;
                    passes = 2;

                    vibrancy = 0.1696;
                };
            };

            animations = {
                enabled = true;
                bezier = "myBezier, 0.12, 0, 0.39, 0";

                animation = [
                    "windows, 1, 1, myBezier"
                    "windowsOut, 1, 1, default, popin 0%"
                    "border, 1, 1, default"
                    "borderangle, 1, 1, default"
                    "fade, 1, 1, default"
                    "workspaces, 1, 1, default"
                ];
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_status = "master";
            };

            misc = {
                force_default_wallpaper = -1;
                disable_hyprland_logo = false;
            };

            xwayland = {
                force_zero_scaling = true;
            };

            input = {
                kb_layout = "se";

                follow_mouse = 1;

                accel_profile = "flat";
                sensitivity = 0;

                touchpad = {
                    natural_scroll = false;
                };
            };

            gestures = {
                workspace_swipe = true;
            };

            bind = [
                # Base
                "$mod SHIFT, Q, killactive"
                "$mod SHIFT, SPACE, togglefloating"
                "$mod, F, fullscreen"
                "$mod, G, togglesplit"

                # Applications
                "$mod SHIFT, Return, exec, $terminal_floating"
                "$mod, Return, exec, $terminal"
                "$mod, D, exec, $menu"

                # Multimedia
                ",XF86AudioPrev, exec, playerctl --ignore-player=firefox previous"
                ",XF86AudioPlay, exec, playerctl --ignore-player=firefox play-pause"
                ",XF86AudioNext, exec, playerctl --ignore-player=firefox next"

                # Screenshots
                ", Print, exec, slurp -or | grim -g - - | wl-copy"
                "$mod SHIFT, S, exec, slurp | grim -g - - | wl-copy"
                "$mod CTRL, S, exec, ~/scripts/imgurUpload.sh"

                # Workspaces
                "$mod, A, movecurrentworkspacetomonitor, +1"
                
                "$mod SHIFT, left, movewindow, l"
                "$mod SHIFT, right, movewindow, r"
                "$mod SHIFT, up, movewindow, u"
                "$mod SHIFT, down, movewindow, d"

                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

                # Vim Bindings
                "$mod, H, movefocus, l"
                "$mod, L, movefocus, r"
                "$mod, K, movefocus, u"
                "$mod, J, movefocus, d"

                "$mod SHIFT, H, movewindow, l"
                "$mod SHIFT, L, movewindow, r"
                "$mod SHIFT, K, movewindow, u"
                "$mod SHIFT, J, movewindow, d"

                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"
                "$mod, 0, workspace, 10"

                "$mod SHIFT, 1, movetoworkspacesilent, 1"
                "$mod SHIFT, 2, movetoworkspacesilent, 2"
                "$mod SHIFT, 3, movetoworkspacesilent, 3"
                "$mod SHIFT, 4, movetoworkspacesilent, 4"
                "$mod SHIFT, 5, movetoworkspacesilent, 5"
                "$mod SHIFT, 6, movetoworkspacesilent, 6"
                "$mod SHIFT, 7, movetoworkspacesilent, 7"
                "$mod SHIFT, 8, movetoworkspacesilent, 8"
                "$mod SHIFT, 9, movetoworkspacesilent, 9"
                "$mod SHIFT, 0, movetoworkspacesilent, 10"
            ];  

            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];

            windowrulev2 = [
                "float, class:(term_floating)"
                "size 50% 50%, class:(term_floating)"

                "float, title:(Authentication Required)"

                "float, class:(electron)"
                "size 50% 50%, class:(electron)"

                "float, class:(org.pulseaudio.pavucontrol)"
                "size 50% 50%, class:(org.pulseaudio.pavucontrol)"

                "immediate, class:(gamescope)"
                "immediate, class:(steam_app_.*)"
                "immediate, title:(Counter-Strike 2)"

                "suppressevent maximize, class:.*"
            ];
        };
    };
}
