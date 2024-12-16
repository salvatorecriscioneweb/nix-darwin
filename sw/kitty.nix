{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "RobotoMono Nerd Font";
      package = pkgs.nerd-fonts.roboto-mono;
      size = 14;
    };
    shellIntegration.enableFishIntegration = true;
    settings = {
      tab_bar_edge = "top";
      background_opacity = "0.90";
      window_padding_width = 12;
      cursor_trail = 2;
      background_blur = "14";
      hide_window_decorations = "titlebar-only";
      tab_bar_style = "slant";
      tab_bar_align = "center";
    };
    themeFile = "Aquarium_Light";
  };
}
