{ config, lib, pkgs, ...}: {
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        fira-code-nerdfont
        fira-code-symbols
        fira-code
        hack-font
        cantarell-fonts
        (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    ];
}
