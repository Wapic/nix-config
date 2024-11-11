{ pkgs, lib, config, ... }: {
    options = {
        hardware.framework = {
            fixColor = lib.mkOption {
                type = lib.types.bool;
                default = false;
            };

            colorfile = lib.mkOption {
                type = lib.types.str;
                default = "";
            };
        };
    };


    config = lib.mkIf config.hardware.framework.fixColor {
        home.packages = [ pkgs.argyllcms ];
        wayland.windowManager.hyprland.settings.exec-once = [ "dispwin ${config.hardware.framework.colorfile}" ];
    };
}
