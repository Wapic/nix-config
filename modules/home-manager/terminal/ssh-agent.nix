{ pkgs, lib, config, ... }: {
    programs.ssh.addKeysToAgent = "yes";
    services.ssh-agent.enable = true;
}
