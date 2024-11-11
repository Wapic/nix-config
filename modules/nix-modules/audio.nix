{ pkgs, lib, config, ... }: {
    services.pipewire = {
        enable = true;
        pulse.enable = true;
        jack.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;

        extraConfig.pipewire."92-low-latency"."context.properties" = {
                "default.clock.rate" = 48000;
                "default.clock.quantum" = 128;
                "default.clock.min-quantum" = 128;
                "default.clock.max-quantum" = 128;
        };
    };
}
