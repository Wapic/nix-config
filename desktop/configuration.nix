# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
    imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
      <nixos-hardware/framework/13-inch/7040-amd>
    ];

  # Use the systemd-boot EFI boot loader.
    boot = {
        kernelPackages = pkgs.linuxPackages_zen;
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };

    networking = {
        hostName = "WpcDesktop";
        wireless.iwd.enable = true;
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
    time.timeZone = "Europe/Stockholm";
    console.useXkbConfig = true; # use xkb.options in tty.

    i18n = {
        defaultLocale = "en_US.UTF-8";

        supportedLocales = [
            "en_US.UTF-8/UTF-8"
            "sv_SE.UTF-8/UTF-8"
        ];

        extraLocaleSettings = {
            LANG = "en_US.UTF-8";
            LC_CTYPE="sv_SE.UTF-8";
            LC_NUMERIC = "sv_SE.UTF-8";
            LC_TIME = "sv_SE.UTF-8";
            LC_COLLATE="sv_SE.UTF-8";
            LC_MONETARY = "sv_SE.UTF-8";
            LC_PAPER = "sv_SE.UTF-8";
            LC_NAME = "sv_SE.UTF-8";
            LC_ADDRESS = "sv_SE.UTF-8";
            LC_TELEPHONE = "sv_SE.UTF-8";
            LC_MEASUREMENT = "sv_SE.UTF-8";
            LC_IDENTIFICATION = "sv_SE.UTF-8";
        };
    };

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.wapic = {
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };

    home-manager.users.wapic = import ./home.nix; 

    programs = {
        corectrl.enable = true;
        dconf.enable = true;
        zsh.enable = true;
        seahorse.enable = true;
        gamemode.enable = true;

        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            gamescopeSession.enable = true;
        };
    };

    services = {
        xserver.videoDrivers = [ "amdgpu" ];
        power-profiles-daemon.enable = true;
        libinput.enable = true;
        gnome.gnome-keyring.enable = true;
        openssh.enable = true;
        fwupd.enable = true;
        blueman.enable = true;

        xserver = {
            enable = true;
            xkb.layout = "se";
        };

        displayManager.sddm = {
            enable = true;
            theme = "chili";
            settings = {
                Wayland.SessionDir = "${pkgs.hyprland}/share/wayland-sessions";
            };
        };

        pipewire = {
            enable = true;
            pulse.enable = true;
            jack.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;

            extraConfig.pipewire."92-low-latency" = {
                "context.properties" = {
                "default.clock.rate" = 48000;
                "default.clock.quantum" = 128;
                "default.clock.min-quantum" = 128;
                "default.clock.max-quantum" = 128;
                };
            };
        };
    };

    security = {
        rtkit.enable = true;

        pam.services = {
            hyprlock = {};
            hyprland.enableGnomeKeyring = true;
        };
    };


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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
        #jetbrains.idea-community-bin
        xdg-desktop-portal-gtk
        adwaita-icon-theme
        sddm-chili-theme
        jq
        imv
        zip
        unzip
        wget
        fastfetch
        brightnessctl
        wl-clipboard
        grim
        slurp
        wireless-regdb
        thunderbird
        firefox
        btop
        bat
        nextcloud-client
        spotify
        vesktop
        nautilus
        hyprpicker
        prismlauncher
        pavucontrol
        stremio
        libqalculate
        argyllcms
        killall
        git
        python3
        nodePackages.nodejs
        iwgtk
        lxqt.lxqt-policykit
        mangohud
        vulkan-tools
    ];

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };

    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
        };

        bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
    };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # system.stateVersion = "24.05":
  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system = {
        stateVersion = "24.05"; # Did you read the comment?
        copySystemConfiguration = true;

        autoUpgrade = {
            enable = true;
            allowReboot = false;
        };
    };
}

