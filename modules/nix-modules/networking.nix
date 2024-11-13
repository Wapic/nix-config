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
        networking.wireless.iwd = {
            enable = true;
            settings = {
                Rank.BandModifier2_4GHz = 0.1;
            };  
        };
        environment.systemPackages = [ pkgs.iwgtk ];
    };
}
