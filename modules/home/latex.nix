{ pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-basic

      # Build tools and bibliography support.
      latexmk
      biber
      biblatex
      biblatex-ieee
      csquotes

      # German thesis/document structure.
      babel-german
      koma-script
      caption
      booktabs
      tocloft

      # Code listings and colors.
      listings
      minted
      xcolor

      # Fonts and LuaLaTeX/XeLaTeX support.
      fontspec
      newcomputermodern

      # Graphics and common document packages.
      graphics
      hyperref
      amsmath
      wrapfig
      ulem
      capt-of

      # Org/preview/export helpers.
      dvisvgm
      dvipng
      ;
  });
in
{
  home.packages = with pkgs; [
    tex
  ];
}
