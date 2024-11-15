{ lib, config, pkgs, ... }: {
    programs.waybar = {
        enable = true;

        settings.mainbar = {
            layer = "top";
            position = "bottom";

            modules-left = [ "custom/right-arrow-light" "hyprland/workspaces" "custom/right-arrow-dark" ];
            modules-center = [ "hyprland/window" ];
            modules-right = [
                "custom/left-arrow-dark"
                "pulseaudio"
                "custom/left-arrow-light"
                "custom/left-arrow-dark"
                "clock"
                "custom/left-arrow-light"
                "custom/left-arrow-dark"
                "tray"
            ];

            "hyprland/workspaces" = {
                disable-scroll = true;
                format = "{id}";
            };

            "custom/left-arrow-dark" = {
                format = "";
                tooltip = false;
            };

            "custom/left-arrow-light" = {
                format = "";
                tooltip = false;
            };

            "custom/right-arrow-dark" = {
                format = "";
                tooltip = false;
            };

            "custom/right-arrow-light" = {
                format = "";
                tooltip = false;
            };

            "network" = {
                interval = 30;
                interface = "wlan0";
                format = "󱛄";
                format-wifi = "{icon}  {frequency}";
                format-disconnected = "󰤮";
                format-icons = [
                    "󰤯"
                    "󰤟"
                    "󰤢"
                    "󰤥"
                    "󰤨"
                ];
                tooltip = true;
                tooltip-format = "{ifname}\t{ipaddr}\n{essid}\t({signalStrength}%)";
                tooltip-format-disconnected = "{ifname}";
                on-click = "iwgtk";
            };

            "bluetooth" = {
                on-click = "blueberry";
                format = " {status}";
                format-on = "";
                format-disabled = "󰂲";
                format-connected = " {device_alias}";
                format-connected-battery = " {device_alias} {device_battery_percentage}%";
                tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
                tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
                tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
                tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
            };

            "clock" = {
                format = "{:%H:%M}   ";
                format-alt = "{:%A, %B %d, %Y (%R)}";
                tooltip-format = "<tt><small>{calendar}</small></tt>";
                calendar = {
                    mode = "year";
                    mode-mon-col = 3;
                    weeks-pos = "right";
                    on-scroll = 1;
                    on-click-right = "mode";
                    format = {
                        months = "<span color='#ffead3'><b>{}</b></span>";
                        days = "<span color='#ecc6d9'><b>{}</b></span>";
                        weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                        weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                        today = "<span color='#ff6699'><b><u>{}</u></b></span>";
                    };
                };
                actions = {
                    on-click-right = "mode";
                    on-click-forward = "tz_up";
                    on-click-backward = "tz_down";
                    on-scroll-up = "shift_up";
                    on-scroll-down = "shift_down";
                };
            };

            "pulseaudio" = {
                format = "{icon}   {volume:2}%";
                format-bluetooth = "󰂰  {volume:2}%";
                format-muted = "  MUTED";
                format-icons = {
                    headphones = "";
                    default = [
                        ""
                        ""
                    ];
                };
                scroll-step = 5;
                on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
                on-click-right = "pavucontrol";
            };

            "battery" = {
                interval = 5;
                states = {
                    good = 60;
                    warning = 30;
                    critical = 15;
                };
                format = "{icon} {capacity}%";
                tooltip-format = "Max Capacity: {health}%\n{timeTo}";
                format-chargin = "{icon}󱐋 {capacity}%";
                format-icons = [
                    "󰁺"
                    "󰁻"
                    "󰁼"
                    "󰁽"
                    "󰁾"
                    "󰁿"
                    "󰂀"
                    "󰂁"
                    "󰂂"
                    "󱟢"
                ];
            };

            "hyprland/window" = {
                format = "{title}";
                icon = true;
                max-length = 50;
            };

            "tray" = {
                icon-size = 18;
                spacing = 4;
                show-passive-items = true;
            };
        };
    };
}
