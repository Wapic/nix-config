{ pkgs, lib, config, ... }: {
    options = {
        programs.discord = {
            enable = lib.mkOption {
                default = true;
                type = lib.types.bool;
            };
        };
    };

    config = lib.mkIf config.programs.discord.enable {
        home.packages = [ pkgs.discord-canary ];
    };
}
