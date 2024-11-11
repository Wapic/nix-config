{ config, lib, pkgs, ... }: {
    services.dunst = {
        enable = true;

        settings = {
            global = {
                follow = "mouse";
                width = 300;
                height = "(0,300)";
                origin = "bottom-right";
                offset = "8x8";
                notification_limit = 10;
                progress_bar = true;
                frame_width = 2;
                padding = 8;
                separator_height = 2;
                gap_size = 4;
                separator_color = "frame";
                line_height = 0;
                markup = "full";
                format = "<b>%s</b>\n%b";
                alignment = "left";
                vertical_alignment = "center";
                show_age_threshold = 60;
                ellipsize = "middle";
                ignore_newline = "no";
                stack_duplicates = true;
                hide_duplicate_count = true;
                show_indicators = "yes";
                icon_position = "left";
                min_icon_size = 32;
                max_icon_size = 128;
                icon_path = "/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/";
                browser = "/usr/bin/xdg-open";
                force_xwayland = false;
                mouse_left_click = "close_current";
                mouse_middle_click = "do_action, close_current";
                mouse_right_click = "close_all";
            };

            urgency_low.timeout = 10;

            urgency_normal = {
                timeout = 10;
                override_pause_level = 30;
            };

            urgency_critical = {
                timeout = 0;
                override_pause_level = 60;
            };
        };
    };
}
