{ inputs }:
{
  config,
  lib,
  pkgs,
  ...
}:
let

  treesitterWithGrammars = (
    pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
      p.bash
      p.comment
      p.css
      p.dockerfile
      p.fish
      p.gitattributes
      p.gitignore
      p.javascript
      p.json5
      p.json
      p.lua
      p.tsx
      p.make
      p.markdown
      p.nix
      p.rust
      p.toml
      p.typescript
      p.yaml
      p.elixir
      p.heex
      p.eex
    ])
  );

  treesitter-parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in
{
  home.packages = with pkgs; [
    ripgrep
    tree-sitter
    lua-language-server
    lexical
    nodejs_20
    gcc
  ];

  # ============ NEOVIM ==============
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    vimAlias = true;
    coc.enable = false;
    withNodeJs = true;
    plugins = [
      treesitterWithGrammars
    ];
  };

  programs.neovide = {
    enable = true;
    settings = {
      fork = true;
      frame = "transparent";
      idle = true;
      neovim-bin = "/etc/profiles/per-user/salvatore.criscione/bin/nvim";
      title-hidden = true;
      vsync = true;
      tabs = false;
      wsl = false;
    };
  };

  home.file."./.config/nvim/" = {
    source = ../dots/nvim;
    recursive = true;
  };
}
