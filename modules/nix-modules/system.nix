{ pkgs, config, lib, ... }: {
    boot.kernelPackages = pkgs.linuxPackages_zen;

    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
        pulseaudio # allow for pactl command for compatibility
    ];
}
