{ config, pkgs, lib, ... }: {
    options = {
        programs.obs = {
            enable = lib.mkOption {
                default = true;
                type = lib.types.bool;
            };
        };
    };

    config = lib.mkIf config.programs.obs.enable {
        programs.obs-studio = {
            enable = true;
            plugins = with pkgs.obs-studio-plugins; [
                wlrobs
                obs-vaapi
                obs-vkcapture
                obs-pipewire-audio-capture
                obs-webkitgtk
            ];
        }; 
    };
}
