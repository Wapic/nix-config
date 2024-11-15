{config, lib, pkgs, ... }: {
    imports = [
        ./theme.nix
        ./framework.nix
        ./hyprland/hyprland.nix
        ./hyprland/hyprlock.nix
        ./hyprland/hypridle.nix
        ./hyprland/hyprpaper.nix
        ./hyprland/xdg.nix
        ./hyprland/hyprprop.nix
        ./desktop/dunst.nix
        ./desktop/wofi.nix
        ./desktop/waybar.nix
        ./desktop/brightnessctl.nix
        ./desktop/volumecontrol.nix
        ./terminal/ssh-agent.nix
        ./terminal/shell.nix
        ./terminal/kitty.nix
        ./terminal/neovim.nix
        ./terminal/git.nix
        ./terminal/fzf.nix
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
        ./apps/yt-dl.nix
        ./apps/imv.nix
        ./apps/mpv.nix
        ./apps/killwine.nix
        ./apps/imgur.nix
    ];

    home.packages = with pkgs; [
        python3
        nodePackages.nodejs
        libqalculate
    ];
}
