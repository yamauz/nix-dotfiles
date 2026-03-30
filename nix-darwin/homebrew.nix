{
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    user = "yamauz";
    enableRosetta = false;
    autoMigrate = false;
  };

  homebrew = {
    enable = true;
    user = "yamauz";

    global.autoUpdate = false;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "uninstall";
    };

    brews = [
    ];
    casks = [
    ];
  };
}
