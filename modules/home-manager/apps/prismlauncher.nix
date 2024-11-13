{ pkgs, lib, config, ... }: {
    options = {
        programs.prismlauncher = {
            enable = lib.mkOption {
                type = lib.types.bool;
                default = true;
            };
        };
    };

    config = lib.mkIf config.programs.prismlauncher.enable {
        home.packages = [ pkgs.prismlauncher ];

        xdg.desktopEntries = {
            skyblock = {
                type = "Application";
                name = "Hypixel Skyblock";
                comment = "A modded minecraft instance.";
                exec = "prismlauncher -i SKYBLOCK_OLD";
                terminal = false;
                categories = [ "Game" ];
                startupNotify = true;
            };
        };
    };
}
