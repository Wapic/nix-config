{ config, pkgs, lib, ... }: {
    programs.imv.enable = true;
    wayland.windowManager.hyprland.settings = {
        windowrulev2 = [
            "float, class:(imv)"
            "size 50% 50%, class:(imv)"
        ];
    };
}
