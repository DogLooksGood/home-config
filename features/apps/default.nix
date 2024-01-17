{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam-run
    emacs29-gtk3
    telegram-desktop
    discord
    freetube
    yubikey-manager-qt
    blackbox-terminal
    firefox
    google-chrome
  ];
}
