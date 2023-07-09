{ config, pkgs, emacs-overlay, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tianshu";
  home.homeDirectory = "/home/tianshu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    emacs-pgtk
    git
    pass
    simple-http-server
    rust-analyzer
    clojure-lsp
    ripgrep
    mosh
    zellij
    rnix-lsp
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/zellij".source = dotfiles/zellij;
    ".profile".text = ''
      . $HOME/.nix-profile/etc/profile.d/nix.sh
    '';
  };

  fonts.fontconfig.enable = true;

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tianshu/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "emacs -nw";
  };

  # Let Home Manager install and manage itself.
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases = {
      n = "nix develop";
      e = "emacs -nw";
      z = "zellij --layout compact";
    };
    profileExtra = ''
      . $HOME/.nix-profile/etc/profile.d/nix.sh
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

  programs.home-manager.enable = true;

  programs.direnv.enable = true;

  programs.direnv.nix-direnv.enable = true;
}
