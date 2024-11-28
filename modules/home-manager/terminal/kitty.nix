{ pkgs, lib, config, ...}: {

    programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        settings = {
            enable_audio_bell = "no";
        };
    };
}
