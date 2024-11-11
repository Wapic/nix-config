{ pkgs, lib, config, ... }: {
    options = {
        communication.bluetooth = {
            enable = lib.mkOption {
                default = false;
                type = lib.types.bool;
                description = "enable wireless networking";
            };
        };
    };

    config = lib.mkIf config.communication.bluetooth.enable {
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
        environment.systemPackages = [ pkgs.blueberry ];
    };
}
