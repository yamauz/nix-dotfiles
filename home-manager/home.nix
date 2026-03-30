{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yamauz";
  home.homeDirectory = "/Users/yamauz";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.nerd-fonts.meslo-lg
    pkgs.ripgrep
    pkgs.fd
    pkgs.bat
    pkgs.eza
    pkgs.gnupg
    pkgs.bun
    pkgs.rustup
    pkgs.cpulimit
    pkgs.ffmpeg
    pkgs.fvm
    pkgs.gh
    pkgs.mkcert
    pkgs.python3
    pkgs.ruby
    pkgs.slack
    pkgs.google-chrome
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yamauz/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = builtins.readFile ./fish/interactive.fish;
    shellInit = builtins.readFile ./fish/init.fish;
    plugins = [
      {
        name = "pure";
        src = pkgs.fishPlugins.pure.src;
      }
    ];
    shellAbbrs = {
      ccd = "claude --dangerously-skip-permissions";
      drs = "sudo darwin-rebuild switch --flake ~/dev/dotfiles";
      ls = "eza";
      cat = "bat --theme=ansi";
    };
    functions = {
      _pure_prompt_node = builtins.readFile ./fish/functions/_pure_prompt_node.fish;
      _pure_prompt_first_line = builtins.readFile ./fish/functions/_pure_prompt_first_line.fish;
    };
  };
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      style = "compact";
      inline_height = 0;
      ctrl_n_shortcuts = true;
      enter_accept = true;
      sync.records = true;
    };
  };
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    settings = {
      manager = {
        show_hidden = true;
      };
    };
  };
}
