{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-laptop";

  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };
    inputMethod = {
      enable = true;
      type = "fcitx5";

      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
        ];
      };
    };
  };

  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "jp106";
  };

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    displayManager.lightdm.enable = true;
    windowManager.dwm.enable = true;
    desktopManager.runXdgAutostartIfNone = true;
    xkb.layout = "jp";
  };
  
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.iketk = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    ghostty
    dmenu
    st
    kdePackages.fcitx5-configtool
  ];

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Sans"
        ];

        serif = [
          "Noto Serif CJK JP"
          "Noto Serif"
        ];

        monospace = [
          "Noto Sans Mono CJK JP"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";

}

