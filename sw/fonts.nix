{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.nerd-fonts.im-writing
    pkgs.nerd-fonts.recursive-mono
    pkgs.nerd-fonts.tinos
  ];
}
