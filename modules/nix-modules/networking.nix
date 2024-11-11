{ config, lib, pkgs, ... } : {
    options = {
        communication.wifi = {
            enable = lib.mkOption {
                default = false;
                type = lib.types.bool;
                description = "enable wireless networking";
            };
        };
    };

    config = lib.mkIf config.communication.wifi.enable {
        networking.wireless.iwd.enable = true;
        environment.systemPackages = [ pkgs.iwgtk ];
    };
}
