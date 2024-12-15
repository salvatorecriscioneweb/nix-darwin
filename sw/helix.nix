{ config, pkgs, ... }:

{

  # ========= HELIX ==========
  programs.helix = {
    enable = true;
    settings = {
      theme = "autumn_night_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      }
      {
        name = "elixir";
        scope = "source.elixir";
        injection-regex = "elixir";
        file-types = [
          "ex"
          "exs"
        ];
        roots = [ "mix.exs" ];
        auto-format = true;
        diagnostic-severity = "Hint";
        comment-token = "#";
        indent = {
          tab-width = 2;
          unit = " ";
        };
        "language-servers" = [ "lexical" ];
      }
    ];
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
  };
}
