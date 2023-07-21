{ pkgs,
  config,
  dotfiles,
  proxy ? "http://localhost:7890",
  ... }:
{
  home.packages = with pkgs; [
    emacs28-nox
    git
    pass
    simple-http-server
    rust-analyzer
    clojure-lsp
    ripgrep
    mosh
    zellij
    rnix-lsp
    curl
    wget
    tree
  ];

  home.file = {
    ".config/zellij".source = /${dotfiles}/zellij;
    ".profile".text = ''
      . $HOME/.nix-profile/etc/profile.d/nix.sh
    '';
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "emacsclient -nw";
  };

  programs.bash = {
    enable = true;
    profileExtra = ''
      . $HOME/.nix-profile/etc/profile.d/nix.sh
    '';
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases = {
      n = "nix develop";
      e = "emacsclient -nw";
      z = "zellij --layout $HOME/.config/zellij/layout.kdl";
    };
    profileExtra = ''
      . $HOME/.nix-profile/etc/profile.d/nix.sh
      export ALL_PROXY=${proxy}
    '';
    oh-my-zsh = {
      enable = true;
      theme = "simple";
    };
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.fzf = {
    enableZshIntegration = true;
    enable = true;
  };

  programs.direnv.enable = true;

  programs.direnv.nix-direnv.enable = true;
}
