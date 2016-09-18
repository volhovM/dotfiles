{ config, pkgs, ... }:
 
#let 
#  packageOverrides = super: let self = pkgs; in
#  {
#    haskellPackages = self.haskell.packages.ghc7103.override {
#      overrides = config.haskellPackageOverrides or (self: super: {});
#    };
#  };
#myAndroidSdk = pkgs.androidenv.androidsdk {
#    platformVersions = [ "22" ];
#    abiVersions = [ "armeabi-v7a" ];
#    useGoogleAPIs = true;
#  };
#in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
# boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = { "vm.swappiness" = 0; };
  #boot.initrd.kernelModules = [ "fbcon" ];

  boot.initrd.luks.devices = [
    { 
      name = "root"; device = "/dev/sda2"; preLVM = true;
    }
  ];

  hardware.trackpoint = {
    enable = true;
    emulateWheel = true;
#    fakeButtons = true;
  };

#  services.cron.systemCronJobs = [
#    "* * * * *  root    su -c 'sh /home/volhovm/Dropbox/data/scripts/cron/xautolock.sh  >> /tmp/cronwifi' volhovm"
#    "* * * * *  root    date > /tmp/crontest"
#  ];

  programs.light.enable = true;

  networking = {
    hostName = "avishai"; 
    extraHosts = "127.0.0.1 local.host";
#    wireless.enable = true;  
#    proxy.default = "localhost:9063";
    firewall.allowPing = true;
    firewall.enable = false;
    networkmanager.enable = true;
    nameservers = [ "77.88.8.8" "77.88.8.1" "8.8.8.8" "192.168.0.1" ];
  };

#  services.clamav = {
#    updater.enable = true;
#  };

  services.tor = {
    enable = true;
    client.enable = true; 
    torsocks.enable = true;
  };
  
#  services.i2p.enable = true;
#  services.i2pd.enable = true;

  time.timeZone = "Europe/Moscow";

  i18n = {
    consoleFont = "cyr-sun16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_US.UTF-8";
#    inputMethod = {
#      ibus.engines = with pkgs.ibus-engines; [ anthy mozc ];
#      enabled = "ibus";
#    };
  };

  hardware.pulseaudio.enable = true;

  virtualisation.virtualbox.host.enable = true;

  fonts = {
    enableFontDir = true;
    fontconfig.enable = true;
    fonts = with pkgs; [
      unifont
      terminus_font
      source-code-pro
      fira-mono
      fira-code
   ];
  };

  nix = {
    trustedBinaryCaches = 
      [ https://cache.nixos.org 
        https://hydra.serokell.io ];
    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hydra.serokell.io-1:he7AKwJKKiOiy8Sau9sPcso9T/PmlVNxcnNpRgcFsps="
    ];
  };

#  nix.binaryCaches = [];
  nixpkgs.config = {
#    virtualbox.enableExtensionPack = false;
    allowUnfree = true;
    firefox = {
#     enableGoogleTalkPlugin = true;
#     enableAdobeFlash = true;
    };
  };

  environment.systemPackages = with pkgs; [
    skype
#    teamspeak_client
    acpi
    acpid
    at
    autocutsel
    bc
    calibre
    chromium
    clipit
    cryptsetup
    deadbeef
    deluge
    dhcpcd
    ditaa
    djvulibre
    dropbox-cli
    efibootmgr
    electrum
    elinks    
    emacs
    enca
    espeak
    ffmpeg
    file
    firefox
    gimp
    git
    gitAndTools.gitAnnex
    gitAndTools.git-extras
    gitAndTools.tig
    gitinspector
    gitstats
    gnupg
    gnupg1compat
    gnutls
    gparted
    gptfdisk
    gtypist
    gqview
    grub2
    grub2_efi
    hdparm
    htop
    imagemagick
    inkscape
    iotop
    iptables
    jmtpfs
    ledger
    libjpeg
    libreoffice
    libressl 
    linuxPackages.virtualbox
    lshw
    lsof
    manpages
    mercurial
    microcodeIntel
    minitube
    mplayer
    mr
    mosh
    ms-sys
    mtr
    mutt
    ncdu
    ntfs3g
    openssl
    pandoc
    pass
    pavucontrol 
    pciutils
    pkgconfig
    powertop
    ppp
    pptp
    psmisc
    pv
    qemu
    qtox
    rsync
    scrot
    simplescreenrecorder
    smartmontools
    socat
    sox
    speedcrunch
    speedtest-cli
    sslh
    syslinux
    tabbed
    tdesktop
    tcpdump
    # teeworlds
    # texLiveFull # Moved to nix-env (rebuilds every time, it hurts)
    thunderbird
    tlp
    tmux
    torbrowser
    traceroute
    transmission_gtk
    tree
    unetbootin
    unrar
    unzip
    usbutils
    utox
    vim	
    vimprobable2
    vlc
    w3m
    weechat
    wirelesstools
    wget
    which
    zathura
    zip
    zlib
    zsh

    # Nix-related
    cabal2nix
    nix-repl
    nix-prefetch-git
    npm2nix
    nox
    patchelf

    # Development
    cabal-install
    clang
    coq
    elmPackages.elm
    gcc
    gdb
    gmpxx
#    gnome3_18.glade
    gnumake
    gradle
    haskellPackages.Agda
    haskellPackages.haddock
    haskellPackages.hgettext
#    haskell.packages.ghc7103.hindent_5_0_0
#    haskellPackages.hindent_5_0_0
    haskellPackages.hindent
    haskellPackages.hlint
    haskellPackages.purescript
#    haskellPackages.ghc-mod
#    haskellPackages.idris
    haskellPackages.stylish-haskell
    (haskellPackages.ghcWithPackages (p: with p;
        [ aeson
          generic-deriving
          turtle
          attoparsec  
#          Chart 
#	   Chart-cairo 
#	   Chart-gtk
          conduit
          lens
          pretty-tree
          random
          numbers 
          monad-loops
          ghc
          ghc-mod
          turtle
          xmonad  
          xmonad-contrib
        ]))
    libnotify
    ncurses
    nodejs-6_x
    nodePackages.browserify
#    nodePackages.webpack
#    maven
    openjdk
    perl
    python
    python3
    sbt
    scala
    stack
    valgrind
    vimPlugins.vim-addon-nix
    wireshark-qt
    yasm

    # X11 related
    dunst
    dmenu
    feh
#    (fcitx-with-plugins.override { plugins = [ anthy ]; } )
#    fcitx-configtool
#    ibus-qt
    inotify-tools
    haskellPackages.xmobar
    kbd
    libnotify
    rxvt
    rxvt_unicode
    theme-vertex
    xautolock
    xclip
    xfontsel
    xorg.xmodmap
    xorg.xkbprint
    xorg.xev
  ] 
#  ++ [ myAndroidSdk ]
  ;


  programs.bash = {
    enableCompletion = true;
    shellInit = ''
      set -o vi
    '';
    shellAliases = { 
      where = "type -P"; 
      l = "ls -lh"; 
      ll = "ls -alh"; 
      ls = "ls --color=tty"; 
      restart = "systemctl restart"; 
      start = "systemctl start"; 
      status = "systemctl status";  	
      stop = "systemctl stop"; 
      mv = "mv -v"; 
      rm = "rm -v"; 
      cp = "cp -v"; 
    };
  };

  environment.variables = {
#    ANDROID_HOME = "${myAndroidSdk}/libexec/android-sdk-linux";
  };

  services.openssh.enable = true;
  services.printing.enable = true;
#  services.fprintd.enable = true; 
#  security.pam.services.slimlock = {
#    fprintAuth = true;
#    name = "slimlock";
#  };

  services.xserver = {
    autorun = true;
    enable = true;
    layout = "pl,ru";
    xkbOptions = "grp:caps_toggle";
    xkbVariant = "dvorak,ruu";
    synaptics = {
      enable = false;
      horizontalScroll = false;
      twoFingerScroll = true;
    }; 
    displayManager.sessionCommands = "sh ~/.xinitrc";
    displayManager.slim = {
      enable = true;
      defaultUser = "volhovm";
    };
    windowManager = {
      #bspwm.enable = true;
      xmonad.enable = true;
      xmonad.enableContribAndExtras = true;
    };
    #desktopManager.xfce.enable = true;
    deviceSection = ''
        Option "Backlight" "intel_backlight"
    '';
  };

#  powerManagement = {
#    enable = true;
#    cpuFreqGovernor = "conservative";
#  };

  services.logind.extraConfig = ''
    HandleLidSwitch=ignore
    HandleHibernateKey=ignore
    LidSwitchIgnoreInhibited=no
    IdleAction=ignore
  '';

  services.acpid = {
    enable = true;
  };
  services.tlp.enable = true;

#  services.udev.extraRules = ''
#   SUBSYSTEM=="usb", ATTR{idVendor}="18d1", MODE="0666", GROUP="plugdev"
#  '';

  users.extraUsers.volhovm = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
  users.motd = "Stay noided";

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

}
