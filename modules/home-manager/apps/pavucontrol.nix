{ pkgs, lib, config, ... }: {
    
    options = {
        programs.pavucontrol = {
            enable = lib.mkOption {
                default = true;
                type = lib.types.bool;
            };
        };
    };

    config = lib.mkIf config.programs.pavucontrol.enable {
        home.packages = [ pkgs.pavucontrol ];
    };
}
