{ pkgs,
  config,
  dotfiles,
  ... }:
{
  home.packages = with pkgs; [
    emacs29-nox
    git
    pass
    simple-http-server
    rust-analyzer
    clojure-lsp
    ripgrep
    mosh
    zellij
    rnix-lsp
    babashka
    curl
    wget
    tree
    yarn
    tokei
    zip
    jet
    helix
    p7zip
    qrencode
    librime
    gnumake
    gcc13
    podman
    podman-compose
    tokio-console
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
    enableAutosuggestions = false;
    shellAliases = {
      hms = "home-manager switch";
      ns = "nix-shell";
      nd = "nix develop";
      z = "zellij --layout $HOME/.config/zellij/layout.kdl";
      zt = "zellij action new-tab --cwd . --layout";
      pr = "podman run -it --rm --detach-keys 'ctrl-d'";
      pb = "podman build --progress=plain";
    };
    profileExtra = ''
      e() {
        if [ $# -gt 0 ]; then
          emacsclient -nw $@
        else
          emacsclient -nw -e "(switch-to-buffer nil)"
        fi
      }

      . $HOME/.nix-profile/etc/profile.d/nix.sh
      LOCAL_RC=$HOME/.zshrc
      if [ -f "$LOCAL_RC" ]; then
        . "$LOCAL_RC"
      fi
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
