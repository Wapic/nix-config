{ pkgs, lib, config, ... }: {

    programs.git = {
        enable = true;
        userEmail = "17051068+Wapic@users.noreply.github.com";
        userName = "Wapic";
        extraConfig = {
            init.defaultBranch = "master";
            user.signingkey = "/home/wapic/.ssh/id_ed25519.pub";
            commit.gpgSign = true;
            gpg.format = "ssh";
        };
    };
}
