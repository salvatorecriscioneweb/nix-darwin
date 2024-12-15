{ config, pkgs, ... }:
{

  ## ========= GIT CONFIGURATION ===========
  # Setup Git
  programs.git = {
    enable = true;
    userName = "Salvatore Criscione";
    userEmail = "salvatore.n@grrlz.net";
    extraConfig = {
      github.user = "salvatorecriscioneweb";
      color.ui = true;
      init.defaultBranch = "main";
    };
  };

  # Git CLI
  programs.gh = {
    enable = true;
    settings = {
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };

  # Enable Lazy Git
  programs.lazygit.enable = true;
}
