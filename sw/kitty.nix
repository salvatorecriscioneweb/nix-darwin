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
      name = "iMWritingMono Nerd Font";
      package = pkgs.nerd-fonts.im-writing;
      size = 15;
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
    themeFile = "tokyo_night_night";
  };
}
