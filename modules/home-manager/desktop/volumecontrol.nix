{config, lib, pkgs, ... }: {
    home.packages = with pkgs; [ 
        pulseaudio
    ];

    wayland.windowManager.hyprland.settings = {
        bind = [
            ",XF86AudioLowerVolume, exec, ~/scripts/volumeControl.sh 5%-"
            ",XF86AudioRaiseVolume, exec, ~/scripts/volumeControl.sh 5%+"
            ",XF86AudioMute, exec, ~/scripts/volumeControl.sh mute"
            ",XF86AudioMicMute, exec, pactl -- -set-source-mute 0 toggle"
        ];
    };

    home.file.volumeControl = {
        enable = true;
        executable = true;
        target = "scripts/volumeControl.sh";
        text = ''
            #!/usr/bin/env bash

            function get_volume {
                wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}'
            }

            function is_muted {
                pactl -- get-sink-mute 0 | awk '{print $2}' #yes/no
            }

            if [ "$1" == "mute" ]; then
                progress=$(get_volume)
                muted=$(is_muted)
                message="$progress%"

                if [ "$muted" != "yes" ]; then
                    progress=0
                    message="MUTED"
                fi

                wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
                dunstify -h int:value:"$progress" -r 5555 -u normal "Volume: $message"
                exit 0
            fi

            wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
            wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1"
            dunstify -h int:value:"$(get_volume)" -r 5555 -u normal "Volume: $(get_volume)%"
        '';
    };
}
