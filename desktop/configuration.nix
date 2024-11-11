{ config, lib, home-manager, nixos-hardware, nix-colors, pkgs, ... }: {

    imports = [
        ./hardware-configuration.nix
        ../modules/nix-modules
        nixos-hardware.nixosModules.framework-13-7040-amd
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
        stateVersion = "24.05"; # Did you read the comment?

        autoUpgrade = {
            enable = true;
            allowReboot = false;
        };
    };
}

