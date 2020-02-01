{ pkgs, ... }:
{
  services = {
    pasystray.enable = true;

    mbsync = {
      enable = true;
      frequency = "*:0/15";
      preExec = "${pkgs.afew}/bin/afew -C ~/.notmuch-config --move-mails --verbose";
      postExec = "${pkgs.notmuch}/bin/notmuch new";
    };

    gnome-keyring = {
      enable = true;
    };

    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    redshift = {
      enable = true;
      latitude = "51.7967";
      longitude = "-3.2093";
      tray = true;
      brightness = {
        day = "1";
        night = "1";
      };
      temperature = {
        night = 3500;
        day = 6500;
      };
      extraOptions = [ "transition = 1;" ];
    };

    unclutter = {
      enable = true;
      extraOptions = [ "exclude-root" "ignore-scrolling" ];
      threshold = 1;
      timeout = 1;
    };

    emacs.enable = true;
  };
}
