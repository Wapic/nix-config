{ pkgs, config, lib, ... }: {
    home.packages = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
    ];
    
    xdg.portal = {
        enable = true;

        config = {
            common = {
                default = [
                    "gtk"
                ];
            };
            hyprland = {
                default = [
                    "gtk"
                    "hyprland"
                ];
            };
        };

        configPackages = [
            pkgs.xdg-desktop-portal-gtk
        ];

        extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-hyprland
        ];
    };
}
