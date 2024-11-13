{config, lib, pkgs, ... }: {
    options = {
        programs.brightnessctl = {
            enable = lib.mkEnableOption "Enable brightnessControl script";
        };
    };

    config = lib.mkIf config.programs.brightnessctl.enable {
        home.packages = [ 
            pkgs.brightnessctl 
        ];

        wayland.windowManager.hyprland.settings = {
            bind = [
                ",XF86MonBrightnessDown, exec, ~/scripts/brightnessControl.sh 5%-"
                ",XF86MonBrightnessUp, exec, ~/scripts/brightnessControl.sh 5%+"
            ];
        };

        home.file.brightnessControl = {
            enable = true;
            executable = true;
            target = "scripts/brightnessControl.sh";
            text = ''
                #!/usr/bin/env bash

                function get_brightness {
                    brightnessctl i | grep Current | awk '{printf "%.0f", $3 / 255 * 100}'
                }

                brightnessctl s "$1"
                dunstify -h int:value:"$(get_brightness)" -r 5555 -u normal "Brightness: $(get_brightness)"
            '';
        };
    };
}
