{ config, pkgs, ... }: {
    home.packages = with pkgs; [ 
        killall
        zip
        unzip
        wget
        wl-clipboard
    ];

    programs = {
        fastfetch.enable = true;
        btop.enable = true;

        zsh = {
            enable = true;
            defaultKeymap = "emacs";

            history = {
                size = 10000;
                save = 10000;
            };

            shellAliases = {
                sudo = "sudo ";
                cp = "cp -i";
                ls = "ls --group-directories-first -X --color=always";
                update = "sudo nixos-rebuild switch --flake /home/wapic/nix-config";
                ssh = "kitten ssh ";
                wpc = "cd /home/wapic/.local/share/PrismLauncher/instances/SKYBLOCK_OLD/minecraft/config/ChatTriggers/modules/";
            };

            completionInit = "autoload -Uz compinit; compinit" + "\n" + "zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'";

            initExtra = ''
                bindkey "^[[3~" delete-char

                autoload -Uz add-zsh-hook
                autoload -Uz vcs_info
                add-zsh-hook precmd vcs_info

                zstyle ':vcs_info:*' enable git
                zstyle ':vcs_info:*' check-for-changes true
                zstyle ':vcs_info:*' hooks setPrompt 

                setopt PROMPT_SUBST

                +vi-setPrompt() {
                    branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
                    isDirty="$(git status --porcelain 2> /dev/null)"

                    END="%k%F{0004}"
                    if [ -n "$branch" ]; then
                        END="%F{0004}%K{green}%F{233}  $branch %k%F{green}"
                        if [ -n "$isDirty" ]; then
                            END="%F{0004}%K{yellow}%F{233}  $branch %k%F{yellow}"
                        fi
                    fi
                }

                PROMPT='%F{green}%K{233} %n@%m %F{233}%K{0004} %1~ $END%f%k'
            '';
        };
    };

}
