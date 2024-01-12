{ features, ... }:
{
  imports = [
    /${features}/global
    /${features}/tui
    /${features}/wsl
  ];
}
