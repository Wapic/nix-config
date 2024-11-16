{ config, pkgs, nix-colors, ... }: {
    imports = [
        ../modules/home-manager
        nix-colors.homeManagerModules.default
    ];

    home.stateVersion = "24.05";

    hardware.framework.fixColor = true;
    hardware.framework.colorfile = "~/scripts/BOE_CQ_______NE135FBM_N41_03.icm";

    programs = {
        osu.enable = true;
        spotify.enable = true;
        obs.enable = false;
        brightnessctl.enable = true;

        waybar.settings.mainbar.modules-right = [
            "custom/left-arrow-dark"
            "bluetooth"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "network"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "battery"
            "custom/left-arrow-light"
        ];
    };

    services = {
        hypridle.settings.listener = [
            {
                timeout = 120;
                on-timeout = "brightnessctl -s set 10";
                on-resume = "brightnessctl -r";
            }
            {
                timeout = 150;
                on-timeout = "loginctl lock-session";
            }
            {
                timeout = 180;
                on-timeout = "hyprctl dispatch dpms off";
                on-resume = "hyprctl dispatch dpms on";
            }
        ];
    };

    wayland.windowManager.hyprland.settings = {
        monitor = [
            "eDP-1,preffered,auto,1.33"
        ];
        
        bind = [
            "$mod CTRL, L, exec, loginctl lock-session"
        ];

        device = {
            name = "pixa3854:00-093a:0274-touchpad";
            sensitivity = 1.0;
        };

        windowrulev2 = [
            "float, class:(org.twosheds.iwgtk)"
            "size 32% 45%, class:(org.twosheds.iwgtk)"

            "float, class:(blueberry.py)"
            "size 32% 45%, class:(blueberry.py)"
        ];
    };
}

