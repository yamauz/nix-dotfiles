{
  self,
  ...
}:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = 6;
  nix.enable = false;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  users.users."yamauz".home = "/Users/yamauz";

  imports = [
    ./home_manager.nix
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

  # darwin-rebuild のみパスワードなしでsudo実行を許可
  # (TTYを持たないエージェント経由でも drs を実行できるようにするため。
  #  darwin-rebuildはシステム設定を書き換えられるので実質root相当の権限委譲である点に注意)
  security.sudo.extraConfig = ''
    yamauz ALL=(ALL:ALL) NOPASSWD: /run/current-system/sw/bin/darwin-rebuild
  '';

  launchd.daemons.throttle-noisy-processes = {
    script = ''
      CPULIMIT=/etc/profiles/per-user/yamauz/bin/cpulimit
      for PROC in CybereasonAv SkyDaemon; do
        PID=$(pgrep -x "$PROC")
        if [ -z "$PID" ]; then
          continue
        fi

        # renice
        CURRENT_NI=$(ps -o ni= -p "$PID" | tr -d ' ')
        if [ "$CURRENT_NI" != "20" ]; then
          renice 20 -p "$PID"
        fi

        # cpulimit (skip if already running for this PID)
        if ! pgrep -f "$CPULIMIT -p $PID" > /dev/null; then
          $CPULIMIT -p "$PID" -l 30 -b
        fi
      done
    '';
    serviceConfig = {
      RunAtLoad = true;
      StartInterval = 60;
    };
  };
}
