{ features, ... }:
{
  imports = [
    /${features}/git
    /${features}/global
    /${features}/input-method
    /${features}/tui
    /${features}/apps
  ];
}
