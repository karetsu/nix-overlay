# ██╗░░██╗██████╗░███████╗███████╗░██████╗░██╗░░░██╗██████╗░░██████╗███████╗███████╗
# ╚██╗██╔╝██╔══██╗██╔════╝██╔════╝██╔═══██╗██║░░░██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ░╚███╔╝░██████╔╝█████╗░░███████╗██║░░░██║██║░░░██║██████╔╝██║░░░░░█████╗░░███████╗
# ░██╔██╗░██╔══██╗██╔══╝░░╚════██║██║░░░██║██║░░░██║██╔══██╗██║░░░░░██╔══╝░░╚════██║
# ██╔╝░██╗██║░░██║███████╗███████║╚██████╔╝╚██████╔╝██║░░██║╚██████╗███████╗███████║
# ╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚══════╝░╚═════╝░░╚═════╝░╚═╝░░╚═╝░╚═════╝╚══════╝╚══════╝
{ ... }:
let
  # preferred colour schemes:
  # Nord:
  #   https://github.com/arcticicestudio/nord-xresources
  # Dracula:
  #   https://draculatheme.com/xresources/
  # Laserwave:
  #   https://github.com/Jaredk3nt/laserwave
  # Ant:
  #   https://github.com/eliverlara/Ant

  # TODO: abstract these out so it becomes an import from ./themes/<theme>.nix
  colours = import ./themes/horizon.nix;
  fonts = import ./themes/fonts.nix;
in {
  xresources.properties = {
    # Colours
    "*.foreground" = colours.base04;
    "*.background" = colours.base00;
    "*.cursorColor" = colours.base11;

    "*.color0" = colours.base01;
    "*.color1" = colours.base11;
    "*.color2" = colours.base14;
    "*.color3" = colours.base13;
    "*.color4" = colours.base09;
    "*.color5" = colours.base15;
    "*.color6" = colours.base08;
    "*.color7" = colours.base05;
    "*.color8" = colours.base03;
    "*.color9" = colours.base11;
    "*.color10" = colours.base14;
    "*.color11" = colours.base13;
    "*.color12" = colours.base09;
    "*.color13" = colours.base15;
    "*.color14" = colours.base07;
    "*.color15" = colours.base06;

    # Terminals
    "XTerm*faceName" = fonts.xfonts;

    # Xft;
    "Xft.autohint" = "0";
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintstyle" = "hintslight";
    "Xft.hinting" = "1";
    "Xft.antialias" = "1";
    "Xft.rgba" = "rgb";
    "Xft.dpi" = "96";

    # Cursors
    "Xcursor.theme" = "Vanilla-DMZ";

    # dzen
    "dzen2.font" = fonts.xfonts;
    "dzen2.foreground" = colours.basefg;
    "dzen2.background" = colours.base01;
  };
}
