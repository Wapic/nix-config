{ config, pkgs, lib, ... }: {
    programs.yt-dlp = {
        enable = true;
        settings = {
            output = "/home/wapic/yt-dl/%(title)s.%(ext)s";
        };
    };

    programs.zsh.shellAliases.yt-dl = "/home/wapic/scripts/yt-dl.sh";

    home.file.yt-dl = {
        enable = true;
        executable = true;
        target = "scripts/yt-dl.sh";
        text = ''
            #!/usr/bin/env bash

            url=$1
            file_format=$2
            args="-f mp4"

            if [[ -z "$1" ]]; then
                read -rp "URL: " url
            fi

            if [[ -z "$2" ]]; then
                read -rp "File Format: " file_format
            fi

            if [[ "$file_format" != "mp4" ]]; then
                args=$args"-x --audio-format $file_format"
            fi

            yt-dlp "$args" "$url" 
        '';
    };
}
