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
    pkgs.ngrok
    pkgs.docker
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
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
  programs.zed-editor = {
    enable = true;
    userSettings = {
      assistant = {
        default_model = {
          provider = "zed.dev";
          model = "claude-3-5-sonnet-latest";
        };
        version = "2";
      };
      theme = "Summercamp";
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 12;
      command_aliases = {
        "@" = "V";
      };
      "vim.normalModeKeyBindings" = [
        {
          before = [ "@" ];
          after = [ "<C-v>" ];
        }
      ];
    };
    userKeymaps = [
      {
        context = "Workspace";
        bindings = { };
      }
      {
        context = "Editor";
        bindings = {
          "space w" = "workspace::Save";
          "ctrl-w" = "pane::CloseActiveItem";
        };
      }
      {
        context = "vim_mode == visual";
        bindings = {
          "shift-s" = [
            "vim::PushOperator"
            { "AddSurrounds" = { }; }
          ];
        };
      }
      {
        context = "vim_mode == normal || vim_mode == visual";
        bindings = {
          "@" = "editor::SelectLargerSyntaxNode";
          "ctrl-@" = "editor::SelectSmallerSyntaxNode";
        };
      }
      {
        context = "VimControl && !menu";
        bindings = {
          "ctrl-c" = [ "vim::SwitchMode" "Normal" ];
        };
      }
    ];
  };
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableFishIntegration = true;
    settings = {
      shell-integration = "fish";
      command = "/etc/profiles/per-user/yamauz/bin/fish";
      theme = "vesper";
      background-opacity = 0.9;
      background-blur-radius = 30;
      font-family = "MesloLGS Nerd Font";
      font-size = 12;
      window-padding-x = 15;
      window-padding-y = 5;
      macos-titlebar-proxy-icon = "hidden";
      title = " ";
      keybind = [
        "ctrl+a=reload_config"
        "ctrl+h=new_split:right"
        "ctrl+g=new_split:down"
        "ctrl+t=close_surface"
        "shift+enter=text:\\n"
      ];
    };
  };
}
