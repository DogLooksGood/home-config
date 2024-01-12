{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam-run
    wezterm
    emacs29-pgtk
  ];
}
