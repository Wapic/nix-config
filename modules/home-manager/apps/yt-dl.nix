{ config, pkgs, lib, ... }: {
    programs.yt-dlp = {
        enable = true;
        settings = {
            output = "/home/wapic/yt-dl/%(title)s.%(ext)s";
        };
    };

    programs.zsh.shellAliases.yt-dl = "/home/wapic/scripts/yt-dl.py";

    home.file.yt-dl = {
        enable = true;
        executable = true;
        target = "scripts/yt-dl.py";
        text = ''
            #!/usr/bin/env python3
            import subprocess
            import sys

            def main():
                if len(sys.argv) > 1:
                    url, ff = sys.argv[1], sys.argv[2]
                else:
                    url, ff = input("enter url: "), input("file format: ")

                audioFormats = ("mp3", "m4a", "flac", "ogg", "wav", "aac")

                cmd = ["yt-dlp", "-f", "mp4", url]
                if ff in audioFormats:
                    cmd.extend(["-x", "--audio-format", ff])

                subprocess.run(cmd)

            if __name__ == "__main__":
                main()
        '';
    };
}
