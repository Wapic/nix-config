{config, lib, pkgs, ... }: {
    options = {
        programs.spotify = {
            enable = lib.mkOption {
                type = lib.types.bool;
                default = true;
            };
        };
    };

    config = lib.mkIf config.programs.spotify.enable {
        home.packages = [ pkgs.spotify ];
    };
}
