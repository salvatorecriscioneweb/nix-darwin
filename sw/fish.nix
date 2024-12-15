{ config, pkgs, ... }:
{

  programs.zsh = {
    enable = true;
    initExtra = ''
      if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
      then
          exec fish -l
      fi
    '';
  };

  # ====== FISH ========
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      # Nix Stuff
      . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish

      fish_add_path /etc/profiles/per-user/salvatore.criscione/bin/
      fish_add_path /run/current-system/sw/bin
      fish_add_path /Users/salvatore.criscione/.nix-profile/bin

      /opt/homebrew/bin/mise activate fish | source
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
    shellAbbrs = {
      m = "mix";
      psrv = "mix phx.server";
      cat = "bat";
      ls = "eza";
      rebuilddarwin = "darwin-rebuild switch --flake ~/.config/nix-darwin";
    };
    shellAliases = {
      g = "git";
    };
  };
}
