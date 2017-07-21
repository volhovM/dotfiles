{ config, pkgs, ... }:
 

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
#   loader.gummiboot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';
    kernel.sysctl = { 
      #"vm.swappiness" = 0; 
      "net.ipv4.ip_default_ttl" = 65;
    };
#   initrd.kernelModules = [ "fbcon" ];
    initrd.luks.devices = [ { name = "root"; device = "/dev/sda2"; preLVM = true; } ];
  };

  hardware = {
    trackpoint = {
      enable = true;
      emulateWheel = true;
    };
    pulseaudio.enable = true;
  };

  networking = {
    hostName = "avishai"; 
    extraHosts = ''
      127.0.0.1 local.host
      127.0.0.1 2-ch.ru
      127.0.0.1 2ch.hk
      127.0.0.1 2ch.pm
    '';
    firewall.allowPing = true;
    firewall.enable = false;
    networkmanager.enable = true;
#    nameservers = [ "77.88.8.8" "77.88.8.1" "8.8.8.8" "192.168.0.1" ];
  };

  time.timeZone = "Europe/Moscow";

  i18n = {
    consoleFont = "cyr-sun16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_US.UTF-8";
  };

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
#    useSandbox = false;
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
#    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
#    virtualbox.enableExtensionPack = false;
    allowUnfree = false;
  };

  environment.systemPackages = with pkgs; [
    acpi
    acpid
    aspell
    aspellDicts.en
    aspellDicts.ru
    at
    ag
    autocutsel
    bc
    bup
    chromium
    clipit
    cryptsetup
    deadbeef
    deluge
    dhcpcd
    ditaa
    djvulibre
    efibootmgr
    elinks    
#    emacs
    enca
    espeak
    ffmpeg
    file
    firefox
    ffmpeg-full
    gimp
    git
    gitAndTools.gitAnnex
    gitAndTools.git-extras
    gitAndTools.tig
    gitinspector
    gitstats
    gnupg
    gnupg1compat
    gnuplot
    gnutls
    gparted
    gptfdisk
    gtypist
    gqview
    grub2
    grub2_efi
    hdparm
    htop
    httpie
    imagemagick
    inkscape
    iotop
    iptables
    iw
    jmtpfs
    ledger
    libjpeg
    libreoffice
    libressl 
    linuxPackages.virtualbox
    lshw
    lsof
    manpages
    microcodeIntel
    mkpasswd
    mplayer
    mr
    mosh
    ms-sys
    mtr
    mutt
    ncdu
    ntfs3g
    openssl
    openvpn
    pandoc
    par2cmdline # needed for bup fsck
    pass
    pavucontrol 
    pciutils
    pdftk
    pkgconfig
    postgresql
    powertop
    ppp
    pptp
    psmisc
    python35Packages.glances
    pv
    qemu
    qtox
    rsync
    scrot
    scudcloud
    simplescreenrecorder
    smartmontools
    socat
    sox
    speechd
    speedcrunch
    speedtest-cli
    sslh
    sshpass
    syslinux
    sysstat
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
    unar
    unetbootin
    unzip
    usbutils
    vim	
    vlc
    webfs
    wesnoth
    wirelesstools
    wget
    which
    zathura
    zip
    zlib

    # Nix-related
    cabal2nix
    nix-repl
    nix-prefetch-git
    nixops
    npm2nix
    patchelf

    # Development
    cabal-install
    gcc
    gmpxx
    gnome3.glade
    gnumake
    gradle
    haskellPackages.haddock
    haskellPackages.hindent
    haskellPackages.hlint
#    haskellPackages.orgstat
#    haskellPackages.purescript
    haskellPackages.stylish-haskell
    (haskellPackages.ghcWithPackages (p: with p;
        [ aeson
          attoparsec  
          base64-bytestring
          Cabal
          Chart 
          Chart-cairo 
          conduit
          file-embed
          generic-deriving
          HTTP
          lens
          lifted-async
          monad-loops
          numbers 
          normaldistribution
          permutation
          random
          random-shuffle
          turtle
          unordered-containers
          universum
          xmonad  
          xmonad-contrib
          zlib
        ]))
    libnotify
    libpng
    ncurses
    nodejs
    # nodePackages.browserify
    nodePackages.webpack
    perl
    python2
    # python3
    stack
    valgrind
    vimPlugins.vim-addon-nix
    wireshark-qt
    yasm

    # X11 related
    dunst
    dmenu
    feh
    inotify-tools
    haskellPackages.xmobar
    kbd
    libnotify
    lightdm
    lightlocker
    rxvt
    rxvt_unicode
    xautolock
    xclip
    xfontsel
    xorg.xmodmap
    xorg.xkbprint
    xorg.xev
    xsel
  ];

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

  programs.light.enable = true;


# ------ SERVICES ------

  services = {
    cron = {
      enable = true;
      systemCronJobs = [
        "0 */2 * * *  volhovm sh /home/volhovm/org/backup.sh > /tmp/bupcron 2> /tmp/bupcron.error"
        "* * * * *  volhovm date > /tmp/crontest"
      ];
    };

    openssh.enable = true;
  
    printing = {
      enable = true;
      browsing = true;
      defaultShared = true;
    };
    
#    avahi = {
#      enable = true;
#      publish.enable = true;
#      publish.userServices = true;
#    };

    xserver = {
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
      displayManager.lightdm.enable = true;
      #slimlock is broken now :(
      #displayManager.slim = {
      #  enable = true;
      #  defaultUser = "volhovm";
      #}; 
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

    logind.extraConfig = ''
      HandleLidSwitch=ignore
      HandleHibernateKey=ignore
      LidSwitchIgnoreInhibited=no
      IdleAction=ignore
    '';
  
    acpid.enable = true;
    tlp.enable = true;
    ntp.enable = true;

    tor = {
      enable = true;
      client.enable = true; 
      torsocks.enable = true;
    };
  };



#  powerManagement = {
#    enable = true;
#    cpuFreqGovernor = "conservative";
#  };

  users.extraUsers.volhovm = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  users.motd = "Stay noided";

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
