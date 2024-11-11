{ pkgs, lib, config, ... }: {
    time.timeZone = "Europe/Stockholm";

    console.useXkbConfig = true;

    i18n = {
        defaultLocale = "en_US.UTF-8";

        supportedLocales = [
            "en_US.UTF-8/UTF-8"
            "sv_SE.UTF-8/UTF-8"
        ];

        extraLocaleSettings = {
            LANG = "en_US.UTF-8";
            LC_CTYPE="sv_SE.UTF-8";
            LC_NUMERIC = "sv_SE.UTF-8";
            LC_TIME = "sv_SE.UTF-8";
            LC_COLLATE="sv_SE.UTF-8";
            LC_MONETARY = "sv_SE.UTF-8";
            LC_PAPER = "sv_SE.UTF-8";
            LC_NAME = "sv_SE.UTF-8";
            LC_ADDRESS = "sv_SE.UTF-8";
            LC_TELEPHONE = "sv_SE.UTF-8";
            LC_MEASUREMENT = "sv_SE.UTF-8";
            LC_IDENTIFICATION = "sv_SE.UTF-8";
        };
    };
}
