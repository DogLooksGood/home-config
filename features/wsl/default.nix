{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs29-nox
  ];
}
