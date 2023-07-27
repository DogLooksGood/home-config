{
  description = "Home Manager configuration of tianshu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, emacs-overlay, ... } @ inputs:
    let
      features = ./features;
      dotfiles = ./dotfiles;
    in
    {
      homeConfigurations = {
        "tianshu@tianshu-laptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./hosts/tianshu-laptop.nix ];
          extraSpecialArgs = {
            inherit inputs dotfiles features;
            proxy = "http://172.29.32.1:7890";
          };
        };
        "tianshu@tianshu-PC" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./hosts/tianshu-pc.nix ];
          extraSpecialArgs = {
            inherit inputs dotfiles features;
            proxy = "http://localhost:20171";
          };
        };
      };
    };
}
