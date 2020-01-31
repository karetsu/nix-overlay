{ pkgs, ... }:
let
  fonts = import ./themes/fonts.nix;
  colours = import ./themes/horizon.nix;
in {
  services = {
    polybar = {
      enable = true;

      package = pkgs.polybar.override {
        githubSupport = true;
        pulseSupport = true;
      };

      script = "~/.scripts/polybar/launch";

      # - bars ------------------------------------------------------------------------
      config = {

        # XMONAD #
        "bar/xmonad" = fonts // {
          monitor = "DP-4";
          override-redirect = false;

          enable-ipc = true;

          width = "100%";
          height = "52";
          bottom = false;
          fixed-center = true;
          line-size = "2";

          # tray-position = "left";
          # tray-detached = true;
          # tray-maxsize = 16;
          # tray-background = colours.basebg;
          # tray-offset-x = 515;
          # tray-offset-y = 0;
          # tray-padding = 1;

          background = colours.basebg;
          foreground = colours.basefg;

          cursor-click = "pointer";
          cursor-scroll = "ns-resize";

          modules-left = "workspaces layout volume spotify";
          modules-center = "";
          modules-right = "date caffeine lock userswitch powermenu";
        };

        # modules ---------------------------------------------------------------------

        "module/layout" = {
          type = "custom/script";
          exec = "tail -f /tmp/xmonad-layout";
          exec-if = "[ -p /tmp/xmonad-layout ]";
          tail = true;

          format = "<label>";
          format-background = colours.basebg-alt;
          format-foreground = colours.basefg-alt;
          format-padding = 1;

          label = "%output%";
        };

        "module/spotify" = {
          type = "custom/script";
          exec =
            "${pkgs.playerctl}/bin/playerctl --follow metadata --format '%{F${colours.basefg}}{{artist}}%{F${colours.base11}}  %{F${colours.base13}}{{title}}%{F-}'";
          tail = true;
          format = "<label>";
          # format-background = colours.base14; # closest to spotify green
          # format-foreground = colours.basebg;
          format-background = colours.basebg;
          format-foreground = colours.base14;
          format-padding = 3;

          click-left = "wmctrl -x -a spotify";

          label = "  %output%";
        };

        "module/workspaces" = {
          type = "custom/script";
          exec = "tail -F /tmp/xmonad-wspace";
          exec-if = "[ -p /tmp/xmonad-wspace ]";
          tail = true;

          click-left = "sleep 0.1; xdotool key Super w g";

          format = " <label>";
          format-background = colours.basebg-alt;
          format-foreground = colours.base02;
          format-padding = 2;
        };

        "module/caffeine" = {
          type = "custom/script";
          exec = "tail -F /tmp/caffeine";
          exec-if = "[ -p /tmp/caffeine ]";
          tail = true;

          click-left = "~/.scripts/caffeine";

          format = "<label>";
          format-background = colours.basebg-alt;
          format-foreground = colours.base02;
          label = "   %output% ";
          content-padding = 3;
        };

        "module/volume" = {
          type = "internal/pulseaudio";
          # sink = "alsa_output.pci-0000_01_00.1.hdmi-stereo-extra2";
          format-volume = "<ramp-volume> <label-volume>  ";
          format-volume-padding = 2;
          format-volume-background = colours.basebg-alt;
          format-volume-foreground = colours.basefg-alt;
          label-volume = "%percentage:3%%";
          label-muted = "%{F${colours.base10}}%{F-} mute  ";
          label-muted-foreground = colours.basefg-alt;
          label-muted-background = colours.basebg-alt;
          label-muted-padding = 2;

          ramp-volume-0 = "%{F${colours.base10}}%{F-}";
        };

        "module/date" = {
          type = "internal/date";
          interval = 30;
          label = "%time%  ";
          label-padding = 2;
          label-background = colours.basebg;
          label-foreground = colours.basefg-alt;
          time = "%{F${colours.base15}}%{F-} %H:%M";
          time-alt = "%{F${colours.base15}}%{F-} %Y-%m-%d";
        };

        "module/powermenu" = {
          type = "custom/text";
          content = "襤 ";
          content-padding = 2;
          content-background = colours.basebg-alt;
          content-foreground = colours.basefg-alt;
          click-left = "sleep 0.1; xdotool key Super q m";
        };

        "module/userswitch" = {
          type = "custom/text";
          content = "";
          content-padding = 2;
          content-background = colours.basebg-alt;
          content-foreground = colours.basefg-alt;
          click-left = "~/.scripts/switch";
        };

        "module/lock" = {
          type = "custom/text";
          content = " ";
          content-padding = 2;
          content-background = colours.basebg-alt;
          content-foreground = colours.basefg-alt;
          click-left = "sleep 0.1; xdotool key Super q l";
        };
      };
    };
  };
}