{ config, options, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "scourie";
    #firewall.allowPing = true;
    firewall.enable = false;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";

  i18n = {
    consoleFont = "cyr-sun16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_GB.UTF-8";
  };

  nix.trustedUsers = [ "root" "volhovm" ];
  nixpkgs.config = {
    allowUnfree = false;
    allowBroken = false;
  };

  environment.systemPackages = with pkgs; [
    acpi
    at
    cryptsetup
    efibootmgr
    elinks
    emacs
    file
    git
    gitAndTools.git-extras
    gitAndTools.tig
    gparted
    gptfdisk
    grub2
    grub2_efi
    htop
    iptables
    iw
    lshw
    lsof
    manpages
    microcodeIntel
    mkpasswd
    mosh
    ncdu
    p7zip
    pv
    rsync
    socat
    tmux
    tree
    unzip
    vim
    vimPlugins.vim-nix
    wget
    which
    zip

    cmake
    gcc
    gdb
    gnumake
    python3
  ];

  programs.bash = {
    enableCompletion = true;
    shellAliases = {
      where = "type -P";
      ls = "ls --color=tty --group-directories-first";
      ll = "ls -alh";
      l = "ls --color=tty ";
      restart = "systemctl restart";
      start = "systemctl start";
      status = "systemctl status";
      stop = "systemctl stop";
      mv = "mv -v";
      rm = "rm -v";
      cp = "cp -v";
    };
    shellInit = "set -o vi";
  };
  programs.mosh.enable = true;

  services.openssh.enable = true;

  users.users.volhovm = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "disk" "storage" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRMQ16PB/UvIEF+UIHfy66FNaBUWgviE2xuD5qoq/nXURBsHogGzv1ssdj1uaLdh7pZxmo/cRC+Y5f6dallIHHwdiKKOdRq1R/IWToMxnL/TTre+px6rxq21al9r4lvibelIU9vDn0R6OFZo+pRWyXUm33bQ4DVhwWiSls3Hw+9xRq4Pf2aWy//ey5CUTW+QkVdDIOFQG97kHDO3OdoNuaOMdeS+HBgH25bzSlcMw044T/NV9Cyi3y1eEBCoyqA9ba28GIl3vNADBdoQb5YYhBViFLaFsadzgWv5XWTpXV4Kwnq8ekmTcBkDzoTng/QOrDLsFMLo1nEMvhbFZopAfZ volhovm.cs@gmail.com"
      "sssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuTqU3YRlU5vrUd476T/nZgGHgwgZi3LlhJCN6o4BV4EpYc1za/JFuUTm/Jojep5dElMgUJzuALhgxVkI1nhf248XJqbK4P3MKIO3BtN633fxXaDtxvSIfsPQzF3hhKpSa4VNDEefttPufdRRdRNgtaaI9swbhs9Yobwndl7AyrlgkuH0BzWbPSVFUl6yI8XOv1rydJ7t7uhskaXwY6ls2EBTn09VDmVgfzNADrrXxDvj6O+rRImZWX+1UDadPw9IzZbQk6OpR582weiFjKoj3INl4g07t3MdVRT2Rar20fiRkDpEr632nrsyzXLeJ7K102RUOOTeJpY9jQRl75Ezh volhovm@avishai"
    ];
  };

  system.stateVersion = "19.09";
}
