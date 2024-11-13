{ config, pkgs, nix-colors, ... }: {
    imports = [
        ../modules/home-manager
        nix-colors.homeManagerModules.default
    ];

    home.stateVersion = "24.05";

    programs = {
        osu.enable = true;
        spotify.enable = true;
        obs.enable = true;
    };

    services = {
        hypridle.settings.listener = [
            {
                timeout = 300;
                on-timeout = "brightnessctl -s set 10";
                on-resume = "brightnessctl -r";
            }
            {
                timeout = 900;
                on-timeout = "hyprctl dispatch dpms off";
                on-resume = "hyprctl dispatch dpms on";
            }
        ];
    };

    wayland.windowManager.hyprland.settings = {
        monitor = [
            "desc:Acer Technologies XV272U KV 91121D1DA4203,preferred,0x0,auto"
            "desc:AOC AG276QZD 1322131231233,preferred,2560x0,auto"
            "desc:Ancor Communications Inc ASUS MG278 0x0001F437,preferred,5120x0,auto"
        ];

        device = {
            name = "endgame-gear-endgame-gear-op1-8k-gaming-mouse";
            sensitivity = 0.0;
        };
    };
}

