{ pkgs, lib, config, ... }: {
    options = {
        programs.vesktop = {
            enable = lib.mkOption {
                default = true;
                type = lib.types.bool;
            };
        };
    };

    config = lib.mkIf config.programs.vesktop.enable {
        home.packages = [ pkgs.vesktop ];
    };
}
