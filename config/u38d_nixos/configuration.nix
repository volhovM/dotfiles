{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
    ];

  # Booting settings
  boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = [ { name = "luksroot"; device = "/dev/sda2"; preLVM = true; } ];
  boot.initrd.luks.cryptoModules = [ "aes" "sha256" "sha1" "cbc" ]; 
  boot.initrd.kernelModules = [ "fbcon" ];
  boot.blacklistedKernelModules = [ "radeon" "asus_wmi" "asus_nb_wmi" ];

  # Networking 
  networking = {
    firewall.allowPing = true;
    hostName = "simeon";
    wireless.enable = false;
    useDHCP = false;
    interfaces.enp0s16f1u1.ip4 = [ { address = "192.168.0.5"; prefixLength = 24; } ];
    defaultGateway = "192.168.0.1";
    nameservers = [ "77.88.8.8" "77.88.8.1" "8.8.8.8" "192.168.0.1" ];
    extraHosts = "192.168.0.6 avishai";
  };

  # Restore networking if broken
  services.cron.enable = true;
  services.cron.systemCronJobs = [ "* * * * *  root sh /root/restore_eth.sh" ];

  fonts.fonts = with pkgs; [
    terminus_font
  ];

  i18n = {
    consoleFont = "cyr-sun16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_US.UTF-8";
  };

  nix.binaryCaches = [];
  environment.systemPackages = with pkgs ;[
    wget
    vim
    git
    speedtest-cli
    gitAndTools.gitAnnex
    gitAndTools.tig
    emacs
    elinks
    pptp
    ppp
    cryptsetup  
    pass
    gnupg
    gnupg1compat
    htop
    ncdu
    file
    tmux	
    hdparm
    python34Packages.glances
  ];

  programs.bash = {
    enableCompletion = true;
    shellInit = "set -o vi";
  };

  time.timeZone = "Europe/Moscow";

  services.openssh.enable = true;
  services.printing.enable = true;

  # Disable any kind of power management
  services.acpid.enable = false;
  powerManagement.enable = false;
  services.logind.extraConfig = ''
    HandleLidSwitch=ignore
    HandleSuspendKey=ignore
    HandleHibernateKey=ignore
    HandlePowerKey=ignore
    LidSwitchIgnoreInhibited=no
    IdleAction=ignore
  '';

  users.extraUsers = {
    volhovm.isNormalUser = true;
    volhovm.extraGroups = [ "wheel" ];
    borisovav.isNormalUser = true;
  };
  users.motd = "Stay noided";
}


