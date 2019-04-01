{ config, pkgs, ... }:
 
{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernel.sysctl = { 
      #"vm.swappiness" = 0; 
      "net.ipv4.ip_default_ttl" = 65;
    };
    initrd.luks.devices = [ { name = "root"; device = "/dev/nvme0n1p2"; preLVM = true; } ];
    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';
  };

 hardware = {
    # It's overriden by libinput anyway.
    trackpoint = {
      enable = true; 
      speed = 120;
      sensitivity = 120;
      emulateWheel = true;
    };
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      daemon.config = { realtime-scheduling = "yes"; };
    };
    bluetooth.enable = true;
    sane.enable = true;
    sane.brscan4.netDevices = { dimq = { ip = "192.168.0.104"; model="MFP-M17fw-kek"; }; };

    # opengl.extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau  ];
    opengl.enable = true;
  };

  networking = {
    hostName = "keshet"; 
    extraHosts = ''
      127.0.0.1 2-ch.ru
      127.0.0.1 2ch.hk
      127.0.0.1 2ch.pm
    '';
    firewall.allowPing = true;
    firewall.enable = false;
    networkmanager.enable = true;
    #wicd.enable = true;
    nameservers = [ "8.8.8.8" "77.88.8.8" "77.88.8.1" "192.168.0.1" ];
  };

  time.timeZone = "Europe/Paris";

  i18n = {
    consoleFont = "cyr-sun16";
    consoleKeyMap = "dvorak";
    #defaultLocale = "en_GB.UTF-8";
    defaultLocale = "en_IE.UTF-8";
  };

  # virtualisation.virtualbox.host.enable = true;

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
    binaryCaches = [ 
      https://cache.nixos.org 
      https://serokell.cachix.org
    ];
    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "serokell.cachix.org-1:5DscEJD6c1dD1Mc/phTIbs13+iW22AVbx0HqiSb+Lq8="
    ];
    trustedUsers = [ "root" "volhovm" ];
  };

#  nix.binaryCaches = [];
  nixpkgs.config = {
#    virtualbox.enableExtensionPack = false;
    allowUnfree = false;
    allowBroken = false;
  };

  environment.systemPackages = with pkgs; [
    acpi
    acpid
    alsaUtils
    aspell
    aspellDicts.en
    aspellDicts.ru
    at
    ag
    audacity
    autocutsel
    bc
    binutils-unwrapped
    bup
    blueman
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
    electrum
    evince
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
    google-play-music-desktop-player
    gparted
    gptfdisk
    gtypist
    gqview
    graphviz
    grub2
    grub2_efi
    hdparm
    hledger
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
    # linuxPackages.virtualbox
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
    nextcloud-client
    ncdu
    ntfs3g
    openssl
    openvpn
    p7zip
    pandoc
    par2cmdline # needed for bup fsck
    pass
    pavucontrol 
    pciutils
    pdftk
    pkgconfig
    poppler_utils # pdfimages
    postgresql
    powertop
    ppp
    pptp
    psmisc
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
    #tdesktop
    tcpdump
    teeworlds
    thunderbird
    tmux
    #torbrowser
    traceroute
    transmission_gtk
    tree
    tty-clock
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
    nix-prefetch-git
    nixops
    npm2nix
    patchelf

    # Development
    cabal-install
    cmake
    cryptoverif
    coq
    gcc
    gdb
    gmpxx
    gnumake
    haskellPackages.hindent
    haskellPackages.hlint
    haskellPackages.stylish-haskell
    (haskellPackages.ghcWithPackages (p: with p;
        [ aeson
          attoparsec  
          base64-bytestring
          conduit
          file-embed
          generic-deriving
          lens
          lifted-async
          monad-loops
          numbers 
          normaldistribution
          permutation
          random
          random-shuffle
          turtle
 	  tidal
          unordered-containers
#          universum
          zlib
        ]))
    haskellPackages.weeder
    haskellPackages.hpack
    libnotify
    libpng
    nodejs
    nodePackages.webpack
    perl
    proverif
    python3
    sage
    stack
    valgrind
    vimPlugins.vim-addon-nix
    wireshark-qt

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
    xorg.xbacklight
    xorg.xev
    xsel
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
  };

  programs.light.enable = true;
  programs.ssh.startAgent= true;

  security = {
    rtkit.enable = true;
    sudo.enable = true;
    pam.loginLimits = 
      [ { domain = "@realtime"; type = "-"; item = "rtprio"; value = "99"; }
        { domain = "@realtime"; type = "-"; item = "memlock"; value = "unlimited"; }
      ];
  };

# ------ SERVICES ------

  services = {
    cron = {
      enable = true;
      systemCronJobs = [
        "0 */2 * * *  volhovm sh /home/volhovm/org/backup.sh > /tmp/bupcron 2> /tmp/bupcron.error"
        "* * * * *  volhovm date > /tmp/crontest"
      ];
    };

    openvpn.servers = {
      metajoinVPN = { 
        config = '' config /home/volhovm/reps/private/volhovm.ovpn ''; 
        autoStart = false;
      };
    };

    openssh.enable = true;
  
    printing = {
      enable = true;
      browsing = true;
      defaultShared = true;
#      drivers = [ pkgs.hplipWithPlugin ];
    };
   
    xserver = {
      autorun = true;
      enable = true;

      videoDrivers = [ "intel" ];

      layout = "pl,ru";
      xkbOptions = "grp:caps_toggle";
      xkbVariant = "dvorak,ruu"; 

      # Libinput can't handle trackpoint normally, though it works better 
      # with touchpad that synaptics.
      libinput.enable = false;
      # Synaptics is crap. It doesn't support palm detection for touchpad. 
      # It steals middle button. 
      synaptics.enable = false;

      displayManager.sessionCommands = "sh ~/.xinitrc";
      #displayManager.lightdm = {
      displayManager.slim = {
        enable = true;
        defaultUser = "volhovm";
      };
#      config = ''
#        Section "InputClass"
#          Identifier     "Disable libinput for TrackPoint"
#          MatchProduct   "TPPS/2 IBM TrackPoint"
#          Driver         "evdev"
#        EndSection
#      '';
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = hsPkgs: [ 
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

#    thermald.enable = true;
# new nixos seems to work fine w/o it, at 45 degrees fan doesn't work
    thinkfan = {
      enable = true;
#      levels = ''
#        (0,     0,      50)
#        (1,     50,     53)
#        (2,     52,     55)
#        (4,     50,     61)
#        (5,     52,     63)
#        (6,     56,     65)
#        (7,     60,     85)
#        (127,   80,     32767)
#      '';

      levels = ''
        (0, 0, 70)
        (1, 60, 70)
        (3, 68, 77)
        (5, 76, 82)
        (7, 80, 32767)
      '';

      ## Other sensors:
      #  hwmon /sys/devices/virtual/hwmon/hwmon0/temp1_input (0,0,10)
      #  hwmon /sys/devices/virtual/hwmon/hwmon1/temp1_input (0,0,10)
      #hwmon /sys/devices/virtual/thermal/thermal_zone3/hwmon2/temp1_input
      sensors = ''
         hwmon /sys/devices/virtual/thermal/thermal_zone0/hwmon0/temp1_input
         hwmon /sys/devices/virtual/thermal/thermal_zone1/hwmon2/temp1_input
      '';
    };
    
  };

  users = {
    extraUsers.volhovm = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" "disk" "storage" "realtime" ];
    };
    motd = "Stay noided";
    groups = { realtime = { }; };
  };

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
