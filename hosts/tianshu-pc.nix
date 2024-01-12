{ features, ... }:
{
  imports = [
    /${features}/global
    /${features}/tui
    /${features}/wayland
  ];
}
