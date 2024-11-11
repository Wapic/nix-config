{ pkgs, lib, config, ... }: {
    
    options = {
        programs.stremio = {
            enable = lib.mkOption {
                default = true;
                type = lib.types.bool;
            };
        };
    };

    config = lib.mkIf config.programs.stremio.enable {
        home.packages = [ pkgs.stremio ];
    };
}
