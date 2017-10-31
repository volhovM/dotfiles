{ config, pkgs, ... }:
 

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
#    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernel.sysctl = { 
      #"vm.swappiness" = 0; 
      "net.ipv4.ip_default_ttl" = 65;
    };
    initrd.luks.devices = [ { name = "root"; device = "/dev/nvme0n1p2"; preLVM = true; } ];
  };

  hardware = {
    trackpoint = {
      enable = false; 
      emulateWheel = true;
    };
    pulseaudio = {
      enable = true;
#      package = pkgs.pulseaudioFull;
    };
  };

  networking = {
    hostName = "keshet"; 
#    extraHosts = ''
#      127.0.0.1 local.host
#      127.0.0.1 2-ch.ru
#      127.0.0.1 2ch.hk
#      127.0.0.1 2ch.pm
#    '';
    firewall.allowPing = true;
    firewall.enable = false;
    networkmanager.enable = true;
    nameservers = [ "77.88.8.8" "77.88.8.1" "8.8.8.8" "192.168.0.1" ];
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
      gohufont 
   ];
  };

  nix = {
#    useSandbox = false;
    trustedBinaryCaches = [ 
      https://cache.nixos.org 
      https://hydra.serokell.io 
      https://hydra.iohk.io
    ];
    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hydra.serokell.io-1:he7AKwJKKiOiy8Sau9sPcso9T/PmlVNxcnNpRgcFsps="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];
  };

#  nix.binaryCaches = [];
  nixpkgs.config = {
#    permittedInsecurePackages = [ "webkitgtk-2.4.11" ];
#    virtualbox.enableExtensionPack = false;
    allowUnfree = false;
    allowBroken = true;
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
    emacs
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
    #pdftk
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
    teeworlds
    # texLiveFull # Moved to nix-env (rebuilds every time, it hurts)
    thunderbird
    tmux
    torbrowser
    traceroute
    transmission_gtk
    tree
    unetbootin
    unzip
    usbutils
    vim	
    vimPlugins.vim-nix
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
#    gnome3.glade
    gnumake
    gradle
#    haskellPackages.haddock
#    haskellPackages.Agda
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
          zlib
        ]))
    libnotify
    libpng
    nodejs
    # nodePackages.browserify
    nodePackages.webpack
    perl
    python2
    # python3
    stack
    vimPlugins.vim-addon-nix
    wireshark-qt

    # X11 related
    dunst
    dmenu
    feh
    inotify-tools
    haskellPackages.xmobar
    taffybar
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
  programs.ssh.startAgent= true;


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
  
#    physlock = {
#      enable = true;
#      lockOn.extraTargets = [ "display-manager.service" ];
#    };

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
      libinput.enable = false;
      # x270 has synaptics touchpad, so let's use related drivers :shrug:
      synaptics = {
        enable = true;
        twoFingerScroll = true;
        # sadly, palm detection with synaptics doesn't work, so i 
        # just disable touchpad at all.
        additionalOptions = ''
          Option "TouchpadOff" "1"
        '';
      };
      displayManager.sessionCommands = "sh ~/.xinitrc";
      #displayManager.lightdm.enable = true;
      displayManager.slim = {
        enable = true;
        defaultUser = "volhovm";
      };
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = hsPkgs: [ 
          hsPkgs.taffybar 
          hsPkgs.xmobar
          hsPkgs.xmonad-contrib
        ];
      };
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
    ntp.enable = true;

    tor = {
      enable = true;
      client.enable = true; 
      torsocks.enable = true;
    };

    tlp.enable = true;
  };

  users.extraUsers.volhovm = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  users.motd = "Stay noided";


#  systemd.services."screenlocker" = {
#    description = "Automatic screen locker";
##    before = [ "sleep.target" "suspend.target" ];
#    serviceConfig = {
#      User = "volhovm";
#      Type = "oneshot";
#      Environment = ["DISPLAY=:0.0" 
##                     "SLIM_CFGFILE=${pkgs.slim}/etc/slim.conf" 
##                     "SLIM_THEMESDIR=${pkgs.slim}/share/slim/themes"
#                    ];
##      ExecStart = "${pkgs.slim}/bin/slimlock";
#      ExecStart = "${pkgs.xlockmore}/bin/xlock";
#    };
#    wantedBy = [ "suspend.target" "sleep.target" ];
#  };
 
  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";

}
