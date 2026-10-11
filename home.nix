{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "qydax";
  home.homeDirectory = "/home/qydax";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing. 


  imports = [
     ];
  
  
  programs.btop = {
    enable = true;
    settings = {
        color_theme = "Default";
        theme_background = false;
        update_ms = 2000;
    };      
  };
  
  programs.fastfetch = {
    enable = true;
  };
  

  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 60;
      };
      color = {
        background = "default";
        gradient = 1;
        gradient_count = 6;
        gradient_color_1 = "'#0284c7'";
        gradient_color_2 = "'#0ea5e9'";
        gradient_color_3 = "'#38bdf8'";
        gradient_color_4 = "'#34d399'";
        gradient_color_5 = "'#10b981'";
        gradient_color_6 = "'#059669'";
      };
      smoothing = {
        monstercat = 1;
        waves = 0;
        gravity = 100;
        decay = 20;
      };
    };
};
    
    home.packages = with pkgs; [
      neo
      ttyper
      unzip
      scrcpy
      android-tools
      tty-clock
  ];

  programs.fish = {
    enable = true;

    # Shell aliases
    shellAliases = {
      la = "ls -a";
      new  = "sudo nixos-rebuild switch";
      gc = "nix-collect-garbage -d";
      cof = "sudo hx /etc/nixos/configuration.nix";
      hod = "sudo hx /etc/nixos/home.nix";
      flad = "sudo hx /etc/nixos/flake.nix";
      hack = "neo -D";
      tab = "cd /etc/nixos";
    };

    # Commands run at interactive shell startup
    interactiveShellInit = ''
      set -g fish_greeting "" # Suppress default greeting
    '';

    # Custom functions
    functions = {
      mkcd = {
        body = "mkdir -p $argv[1]; and cd $argv[1]";
        description = "Create a directory and enter it";
      };
    };
  };
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
  #  /etc/profiles/per-user/qydax/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
}
