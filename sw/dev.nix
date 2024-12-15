{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Nix
    nixfmt-rfc-style

    # Dev
    gcc
  ];
}
