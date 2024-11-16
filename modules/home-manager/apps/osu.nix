{ pkgs, lib, config, ... }: {

    options = {
        programs.osu = {
            enable = lib.mkOption {
                default = true;
                type = lib.types.bool;
            };
        };
    };

    config = lib.mkIf config.programs.osu.enable {
        home.packages = [ pkgs.osu-lazer-bin ];
    };
}
