{ pkgs, lib, config, ... }: {
    environment.systemPackages = with pkgs; [
        lxqt.lxqt-policykit
    ];

    programs = {
        seahorse.enable = true;
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };
    };

    services = {
        openssh.enable = true;
        gnome.gnome-keyring.enable = true;
    };

    security = {
        rtkit.enable = true;
        polkit.enable = true;

        pam.services = {
            hyprlock = {};
            hyprland.enableGnomeKeyring = true;
        };
    };
}
