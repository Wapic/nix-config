{ config, lib, home-manager, nix-colors, pkgs, ... }: {

    imports = [
        ./hardware-configuration.nix
        ../modules/nix-modules
        home-manager.nixosModules.home-manager
    ];

    nixpkgs.config.allowUnfree = true;

    networking.hostName = "WpcDesktop";
    networking.networkmanager.enable = true;
    
    home-manager.users.wapic = import ./home.nix;
    home-manager.extraSpecialArgs = { inherit nix-colors; };

    users.users.wapic = {
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ 
            "wheel"
            "networkmanager"
        ];
    };

    system = {
        stateVersion = "24.05";

        autoUpgrade = {
            enable = true;
            allowReboot = false;
        };
    };
}

