{ ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  home.username = "tianshu";
  home.homeDirectory = "/home/tianshu";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
