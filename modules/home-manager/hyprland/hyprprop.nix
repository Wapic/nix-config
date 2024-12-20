{config, lib, pkgs, ... }: {
    home.packages = with pkgs; [
        jq
        slurp
    ];

    programs.zsh.shellAliases = {
        hyprprop = "/home/wapic/scripts/hyprprop.sh";
    };

    home.file.hyprprop = {
        enable = true;
        target = "scripts/hyprprop.sh";
        executable = true;
        text = ''
            #!/bin/sh

            ## Author: Douile (https://github.com/Douile)

            ## The window selection part (and others) of this tool is based on grimblast
            ## https://github.com/hyprwm/contrib/blob/main/grimblast

            set -eu

            check() {
              COMMAND=$1
              if command -v "$COMMAND" >/dev/null 2>&1; then
                RESULT="OK"
              else
                RESULT="NOT FOUND"
              fi
              echo "   $COMMAND: $RESULT"
            }

            # https://www.shellcheck.net/wiki/SC2086
            jq_with_flags() {
              if [ "$RAW" = "yes" ]; then
                set -- --compact-output "$@"
                set -- --monochrome-output "$@"
              fi
              jq "$@"
            }

            CHECK=no
            HELP=no
            ID=""
            RAW=no

            while [ $# -gt 0 ]; do
              key="$1"
              case "$key" in
              -c | --check)
                CHECK=yes
                shift
                ;;
              -h | --help)
                HELP=yes
                shift
                ;;
              --id)
                shift
                ID="$1"
                shift
                ;;
              -r | --raw)
                RAW=yes
                shift
                ;;
              *)
                break
                ;;
              esac
            done

            if [ "$HELP" = "yes" ]; then
              echo "Hyprprop: View window information of selected window"
              echo "Usage:"
              echo "  hyprprop [--help] [--check] [--id id] [--raw]"
              echo ""
              echo "Flags:"
              echo "  --help    : Print help information"
              echo "  --check   : Check dependencies are installed"
              echo "  --id <id> : Print information for window ID, skip selection, e.g. 0x1d0503e0"
              echo "  --raw     : Output raw JSON data"
              echo ""
              exit
            elif [ "$CHECK" = "yes" ]; then
              check slurp
              check hyprctl
              check jq
              exit
            fi

            WORKSPACES="$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')"
            WINDOWS="$(hyprctl clients -j | jq -r --argjson workspaces "$WORKSPACES" 'map(select([.workspace.id] | inside($workspaces)))')"

            if [ "$ID" = "" ]; then
              ID=$(printf "%s" "$WINDOWS" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1]) \(.address)"' | slurp -f "%l")
            fi

            # NOTE: We don't want to expand the expression as it is an argument used by jq
            # shellcheck disable=SC2016
            printf "%s" "$WINDOWS" | jq_with_flags --arg id "$ID" '.[] | select(.address == $id)'
        '';
    };
}
