{ pkgs, lib, config, ...}: {

    programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        settings = {
            background_opacity = 1;
            enable_audio_bell = "no";
        };
    };
}
