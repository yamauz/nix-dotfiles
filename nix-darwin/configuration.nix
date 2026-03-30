{
  self,
  ...
}:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nix.enable = false;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  users.users."yamauz".home = "/Users/yamauz";

  imports = [
    ./home_manager.nix
    ./homebrew.nix
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

  launchd.daemons.renice-cybereason = {
    script = ''
      PID=$(pgrep -x CybereasonAv)
      if [ -z "$PID" ]; then
        exit 0
      fi
      CURRENT_NI=$(ps -o ni= -p "$PID" | tr -d ' ')
      if [ "$CURRENT_NI" != "20" ]; then
        renice 20 -p "$PID"
      fi
    '';
    serviceConfig = {
      RunAtLoad = true;
      StartInterval = 60;
    };
  };
}
