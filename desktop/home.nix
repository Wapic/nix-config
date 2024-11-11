{ lib, config, pkgs, ... }: {
    home = {
        stateVersion = "24.05";

        pointerCursor = {
            gtk.enable = true;
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
            size = 30;
        };

        packages = with pkgs; [
            typescript-language-server
            bash-language-server
            lua-language-server
            pyright
            lavanda-gtk-theme
            gnome-themes-extra
        ];
    };
}
