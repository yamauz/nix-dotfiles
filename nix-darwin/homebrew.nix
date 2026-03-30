{
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    user = "yamauz";
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    user = "yamauz";

    global.autoUpdate = false;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
    };

    brews = [
      "cmake"
      "cpulimit"
      "ffmpeg"
      "fvm"
      "gh"
      "mkcert"
      "neovim"
      "python@3.10"
      "ruby"
      "tmux"
      "x264"
    ];
    casks = [
      "ngrok"
    ];
  };
}
