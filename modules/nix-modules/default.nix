{ pkgs, lib, config, ... }: {
    imports = [
        ./login-manager.nix
        ./gaming.nix
        ./audio.nix
        ./fonts.nix
        ./security.nix
        ./networking.nix
        ./bluetooth.nix
        ./locale.nix
        ./dev.nix
        ./system.nix
    ];

    programs.zsh.enable = true;
    programs.dconf.enable = true;
}
