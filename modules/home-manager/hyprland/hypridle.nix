{ config, lib, pkgs, ... }: {
    services.hypridle = {
        enable = true;

        settings = {
            general = {
                after_sleep_cmd = "hyprctl dispatch dpms on";
                lock_cmd = "pidof hyprlock || hyprlock";
            };

        };
    };
}
