{ pkgs, dotfiles, ... }:
{
  home.packages = with pkgs; [
    librime
  ];

  home.file = {
    ".local/share/fcitx5/rime/default.yaml".source              = /${dotfiles}/rime/default.yaml;
    ".local/share/fcitx5/rime/pinyin_simp.dict.yaml".source     = /${dotfiles}/rime/pinyin_simp.dict.yaml;
    ".local/share/fcitx5/rime/pinyin_simp.schema.yaml".source   = /${dotfiles}/rime/pinyin_simp.schema.yaml;
    ".local/share/fcitx5/rime/xklbdz.schema.yaml".source        = /${dotfiles}/rime/xklbdz.schema.yaml;
    ".local/share/fcitx5/rime/xklbdz.dict.yaml".source          = /${dotfiles}/rime/xklbdz.dict.yaml;
    ".local/share/fcitx5/rime/xklbdz.extended.dict.yaml".source = /${dotfiles}/rime/xklbdz.extended.dict.yaml;
  };
}
