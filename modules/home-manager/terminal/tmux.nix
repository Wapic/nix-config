{ config, lib, pkgs, ... }: {
    programs.tmux = {
        enable = true;
        mouse = true;
        baseIndex = 1;
        clock24 = true;
        customPaneNavigationAndResize = true;
        newSession = true;
        terminal = "screen-256color";
        extraConfig = ''
            set -ag terminal-overrides ",xterm-kitty:Tc"
        '';
    };
}
