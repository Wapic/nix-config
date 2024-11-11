{lib, config, pkgs, ...}: {
    programs.wofi = {
        enable = true;
        settings = {
            show = "drun";
            prompt = "search";
            allow_images = true;
            image_size = "32px";
            insensitive = true;
            hide_scroll = true;
        };
    };
}
