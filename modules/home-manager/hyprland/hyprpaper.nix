{ pkgs, config, lib, ... }: {
    services.hyprpaper = {
        enable = true;

        settings = {
            ipc = "off";
            preload = [ "~/.config/hypr/wallpaper.png" ];
            wallpaper = [",~/.config/hypr/wallpaper.png" ];
        };
    };
}
