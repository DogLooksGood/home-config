{ pkgs,
  config,
  dotfiles,
  proxy ? null,
  ... }:
{
  home.packages = with pkgs; [
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
    yarn
  ];

  home.file = {
    ".config/zellij".source = /${dotfiles}/zellij;
    ".config/wezterm".source = /${dotfiles}/wezterm;
    ".profile".text = ''
      . $HOME/.nix-profile/etc/profile.d/nix.sh
    '';
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "emacsclient";
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
    '' + (if proxy != null then "export ALL_PROXY=${proxy}" else "");

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
