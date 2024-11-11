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
    };
}
