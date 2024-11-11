{ pkgs, config, lib, ... }: {

    environment.systemPackages = with pkgs; [
        sddm-chili-theme
    ];

    services = {
        displayManager.sddm = {
            enable = true;
            theme = "chili";
            settings = {
                Wayland.SessionDir = "${pkgs.hyprland}/share/wayland-sessions";
            };
        };

        xserver = {
            enable = true;
            xkb.layout = "se";
        };
    };
}
