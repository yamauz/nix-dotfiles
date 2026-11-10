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

  # homebrew.enable など、ユーザー単位で適用されるオプションの対象ユーザー。
  # (nix-darwin の activation は root 実行になったため明示が必要)
  system.primaryUser = "yamauz";

  imports = [
    ./home_manager.nix
  ];

  # Homebrew (cask) の宣言的管理。
  # brew 本体はこのモジュールでは入らないため、事前に公式インストーラで導入しておく必要がある。
  # cleanup = "none": 宣言外の formula/cask (ffmpeg 等) を消さない。
  homebrew = {
    enable = true;
    casks = [
      "docker-desktop"
    ];
    onActivation.cleanup = "none";
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  # darwin-rebuild のみパスワードなしでsudo実行を許可
  # (TTYを持たないエージェント経由でも drs を実行できるようにするため。
  #  darwin-rebuildはシステム設定を書き換えられるので実質root相当の権限委譲である点に注意)
  security.sudo.extraConfig = ''
    yamauz ALL=(ALL:ALL) NOPASSWD: /run/current-system/sw/bin/darwin-rebuild
  '';

  # eMudhra 中間 CA の秘密鍵漏洩 (2026-10) への暫定対策。
  # nix の cacert バンドルから、漏洩した中間 CA の信頼元になっているルートを外す。
  # https://emudhra.we-have-a-problem.com/
  security.pki.caCertificateBlacklist = [
    "Comodo AAA Services root"
    "emSign ECC Root CA - G3"
  ];

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
