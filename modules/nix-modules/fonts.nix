{ config, lib, pkgs, ...}: {
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        nerd-fonts.fira-mono
        nerd-fonts.fira-code
        nerd-fonts.hack
        cantarell-fonts
    ];
}
