{
  description = "Nix-darwin system flake";

  inputs = {
    # Unstable Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Nix Darwin
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NeoVim Blending Edge
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      home-manager,
      nixpkgs,
      ...
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = with pkgs; [
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Allow unfree packages
          nixpkgs.config.allowUnfree = true;

          # Optimise Automatic
          nix.optimise.automatic = true;

          # Add ability to used TouchID for sudo authentication
          security.pam.enableSudoTouchIdAuth = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          users.users."salvatore.criscione" = {
            name = "salvatore.criscione";
            home = "/Users/salvatore.criscione";
          };

          homebrew = {
            enable = true;
            taps = [ ];
            brews = [
              "openssl"
              "mise"
            ];
            casks = [
              "firefox"
              "zed"
            ];
          };

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#salvatore-criscione
      darwinConfigurations."salvatore-criscione" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."salvatore.criscione" = import ./home.nix { inputs = inputs; };
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
