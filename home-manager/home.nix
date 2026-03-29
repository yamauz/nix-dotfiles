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
    functions = {
      _pure_prompt_node = ''
        if test -f package.json; or test -f .nvmrc; or test -f .node-version
          set -l node_version (node --version 2>/dev/null)
          if test -n "$node_version"
            set -l icon (printf '\ue718')
            echo (set_color a6d189)"$icon $node_version"(set_color normal)
          end
        end
      '';
      _pure_prompt_first_line = ''
        set --local prompt_ssh (_pure_prompt_ssh)
        set --local prompt_container (_pure_prompt_container)
        set --local prompt_k8s (_pure_prompt_k8s)
        set --local prompt_git (_pure_prompt_git)
        set --local prompt_command_duration (_pure_prompt_command_duration)
        set --local prompt_node (_pure_prompt_node)
        set --local prompt (_pure_print_prompt \
                                $prompt_ssh \
                                $prompt_container \
                                $prompt_k8s \
                                $prompt_git \
                                $prompt_node \
                                $prompt_command_duration
                            )
        set --local prompt_width (_pure_string_width $prompt)
        set --local current_folder (_pure_prompt_current_folder $prompt_width)

        set --local prompt_components
        if set --query pure_begin_prompt_with_current_directory; and test "$pure_begin_prompt_with_current_directory" = true
            set prompt_components \
                $current_folder \
                $prompt_git \
                $prompt_ssh \
                $prompt_container \
                $prompt_k8s \
                $prompt_node \
                $prompt_command_duration
        else
            set prompt_components \
                $prompt_ssh \
                $prompt_container \
                $prompt_k8s \
                $current_folder \
                $prompt_git \
                $prompt_node \
                $prompt_command_duration
        end

        echo (_pure_print_prompt $prompt_components)
      '';
    };
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
}
