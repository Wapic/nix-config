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
    };
}
