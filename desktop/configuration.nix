{ config, lib, home-manager, nix-colors, pkgs, ... }: {

    imports = [
        ./hardware-configuration.nix
        ../modules/nix-modules
        home-manager.nixosModules.home-manager
    ];

    nixpkgs.config.allowUnfree = true;

    programs.corectrl.enable = true;

    networking.hostName = "WpcDesktop";
    networking.networkmanager.enable = true;

    communication = {
        wifi.enable = false;
        bluetooth.enable = false;
    };
    
    home-manager = {
        users.wapic = import ./home.nix;
        extraSpecialArgs = { inherit nix-colors; };
        useGlobalPkgs = true;
        useUserPackages = true;
    };

    users.users.wapic = {
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };

    system = {
        stateVersion = "24.05"; # Did you read the comment?

        autoUpgrade = {
            enable = true;
            allowReboot = false;
        };
    };
}
