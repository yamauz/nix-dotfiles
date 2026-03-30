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

  launchd.daemons.renice-noisy-processes = {
    script = ''
      for PROC in CybereasonAv SkyDaemon; do
        PID=$(pgrep -x "$PROC")
        if [ -z "$PID" ]; then
          continue
        fi
        CURRENT_NI=$(ps -o ni= -p "$PID" | tr -d ' ')
        if [ "$CURRENT_NI" != "20" ]; then
          renice 20 -p "$PID"
        fi
      done
    '';
    serviceConfig = {
      RunAtLoad = true;
      StartInterval = 60;
    };
  };
}
