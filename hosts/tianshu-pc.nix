{ features, ... }:
{
  imports = [
    /${features}/global
    /${features}/tui
    /${features}/gui
  ];
}
