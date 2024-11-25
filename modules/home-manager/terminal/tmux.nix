{ config, lib, pkgs, ... }: {
    programs.tmux = {
        enable = true;
        mouse = true;
        baseIndex = 1;
        clock24 = true;
        customPaneNavigationAndResize = true;
        newSession = true;
    };
}
