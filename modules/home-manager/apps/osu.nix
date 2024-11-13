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
        home.packages = [ pkgs.osu-lazer ];

        xdg.desktopEntries = {
            osu = {
                type = "Application";
                name = "osu!";
                Comment = "A free-to-win rhythm game.";
                icon="osu-lazer";
                exec = "osu-lazer %F";
                terminal = false;
                mimeType = [
                    "application/x-osu-beatmap-archive"
                    "application/x-osu-skin-archive"
                    "application/x-osu-beatmap"
                    "application/x-osu-storyboard"
                    "application/x-osu-replay"
                    "x-scheme-handler/osu"
                ];
                categories = [ "Game" ];
                startupNotify = true;
                startupWMClass = "osu!";
                singleMainWindow = true;
            };
        };
    };
}
