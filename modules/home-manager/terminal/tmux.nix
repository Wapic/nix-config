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

            set -s escape-time 0

            bind-key -n M-h select-pane -L
            bind-key -n M-j select-pane -D
            bind-key -n M-k select-pane -U
            bind-key -n M-l select-pane -R

            bind-key -n M-1 select-window -t 1
            bind-key -n M-2 select-window -t 2
            bind-key -n M-3 select-window -t 3
            bind-key -n M-4 select-window -t 4
            bind-key -n M-5 select-window -t 5
            bind-key -n M-6 select-window -t 6
            bind-key -n M-7 select-window -t 7
            bind-key -n M-8 select-window -t 8
            bind-key -n M-9 select-window -t 9

            bind-key -n M-TAB next-window

            bind-key -n M-ENTER new-window
            bind-key -n M-g split-window -h
            bind-key -n M-v split-window -v
        '';
    };
}
