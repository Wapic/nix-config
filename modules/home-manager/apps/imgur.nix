{ config, pkgs, lib, ... }: {
    home.packages = with pkgs; [
        slurp
        grim
        wl-clipboard
    ];

    home.file.imgur_uploader = {
        enable = true;
        executable = true;
        target = "scripts/imgurUpload.sh";
        text = ''
            #!/usr/bin/env bash

            IMAGE=$(slurp | grim -g - - | base64)

            RESULT=$(curl \
                --location "https://api.imgur.com/3/image" \
                --header "Authorization: Client-ID $(cat ~/.IMGUR_API_KEY)" \
                --form "image=\"$IMAGE\"" \
                --form 'type="base64"' \
                --silent 2>&1 | grep -E -o 'https://i.imgur.com/.*\.png')

            wl-copy "$RESULT"

            dunstify "Image Uploaded!" "$RESULT"
        '';
    };
}
