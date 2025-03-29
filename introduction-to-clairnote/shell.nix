let
  # nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/995f1890a7cccb73ffd25799346c06254a2fc957.tar.gz";
  pkgs = import <nixpkgs> { config = {}; overlays = []; };
  fontPkgs = with pkgs; [
    source-han-sans
    source-han-serif
    source-han-mono
  ];
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    texlive.combined.scheme-full
    inkscape
    ghostscript
    lilypond
  ] ++ fontPkgs;

  FONTCONFIG_FILE = pkgs.makeFontsConf {
    fontDirectories = fontPkgs;
  };
}
