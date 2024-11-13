{config, lib, pkgs, ... }: {
    imports = [
        ./theme.nix
        ./framework.nix
        ./hyprland/hyprland.nix
        ./hyprland/hyprlock.nix
        ./hyprland/hypridle.nix
        ./hyprland/hyprpaper.nix
        ./hyprland/xdg.nix
        ./desktop/dunst.nix
        ./desktop/wofi.nix
        ./desktop/waybar.nix
        ./terminal/ssh-agent.nix
        ./terminal/shell.nix
        ./terminal/kitty.nix
        ./terminal/neovim.nix
        ./terminal/git.nix
        ./apps/pavucontrol.nix
        ./apps/mozilla.nix
        ./apps/nautilus.nix
        ./apps/osu.nix
        ./apps/prismlauncher.nix
        ./apps/nextcloud.nix
        ./apps/spotify.nix
        ./apps/stremio.nix
        ./apps/vesktop.nix
        ./apps/obs.nix 
    ];

    home.packages = with pkgs; [
        python3
        nodePackages.nodejs
        libqalculate
    ];
}
