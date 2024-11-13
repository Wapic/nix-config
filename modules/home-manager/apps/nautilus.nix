{ pkgs, lib, config, ... }: {
    options = {
        programs.nautilus = {
            enable = lib.mkOption {
                default = true;
                type = lib.types.bool;
            };
        };
    };

    config = lib.mkIf config.programs.nautilus.enable {
        home.packages = [ pkgs.nautilus ];

        wayland.windowManager.hyprland.settings = {
            windowrulev2 = [
                "float, class:(org.gnome.Nautilus)"
                "size 50% 50%, class:(org.gnome.Nautilus)"
            ];
        };
    };
}
