{
    description = "Wpc NixOS Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        nix-colors.url = "github:misterio77/nix-colors";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, nixos-hardware, nix-colors, ... }: {
        nixosConfigurations = {
            WpcLaptop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { 
                    inherit nix-colors;
                    inherit home-manager;
                    inherit nixos-hardware;
                };
                modules = [
                    ./laptop/configuration.nix
                ];
            };

            WpcDesktop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { 
                    inherit nix-colors;
                    inherit home-manager;
                };
                modules = [
                    ./desktop/configuration.nix
                ];
            };
        };
    };
}
