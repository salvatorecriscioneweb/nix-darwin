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
      size = 16;
    };
    shellIntegration.enableFishIntegration = true;
    settings = {
      tab_bar_edge = "top";
      background_opacity = "0.95";
      window_padding_width = 12;
      cursor_trail = 3;
      background_blur = "6";
      # macos_titlebar_color = "background";
      hide_window_decorations = "titlebar-only";
      tab_bar_style = "slant";
      tab_bar_align = "center";
    };
    themeFile = "Catppuccin-Macchiato";
  };
}
