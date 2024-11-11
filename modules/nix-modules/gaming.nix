{ pkgs, lib, config, ... }: {
    environment.systemPackages = with pkgs; [
        mangohud
        vulkan-tools
    ];

    programs = {
        gamemode.enable = true;
        corectrl.enable = lib.mkDefault true;

        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            gamescopeSession.enable = true;
        };
    };

    services.xserver.videoDrivers = ["amdgpu"];

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
}
