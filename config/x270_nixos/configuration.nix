{ config, options, lib, pkgs, ... }:

let
  rustNightlyNixRepo = pkgs.fetchFromGitHub {
     owner = "solson";
     repo = "rust-nightly-nix";
     rev = "9e09d579431940367c1f6de9463944eef66de1d4";
     sha256 = "03zkjnzd13142yla52aqmgbbnmws7q8kn1l5nqaly22j31f125xy";
  };
  rustPackages = pkgs.callPackage rustNightlyNixRepo { };
  rustcNightly = rustPackages.rustc { date = "2020-08-02"; };
  cargoNightly = rustPackages.cargo { date = "2020-08-02"; };
in {
  imports = [ ./hardware-configuration.nix ./suspend.nix];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernel.sysctl = {
      "vm.swappiness" = 20;
      "net.ipv4.ip_default_ttl" = 65;
      "kernel.sysrq" = 1;
    };
    #kernelPackages = pkgs.linuxPackages_4_19;
    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';
  };

  krb5 = {
    enable = true;
    libdefaults.default_realm = "INF.ED.AC.UK";
  };

  hardware = {
    # It's overriden by libinput anyway.
    #trackpoint = {
    #  enable = true;
    #  speed = 120;
    #  sensitivity = 120;
    #  emulateWheel = true;
    #};
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      daemon.config = { realtime-scheduling = "yes"; };
    };
    bluetooth.enable = true;
    opengl.enable = true;
  };

  networking = {
    hostName = "keshet";
    firewall.allowPing = true;
    firewall.enable = false;
    networkmanager = {
      enable = true;
      logLevel = "DEBUG";
      wifi.powersave = false;
    };
  };

  #time.timeZone = "Europe/Paris";
  time.timeZone = "Europe/London";

  console = {
    font = "cyr-sun16";
    keyMap = "dvorak";
  };
  i18n.defaultLocale = "en_GB.UTF-8";

  fonts = {
    fontDir.enable = true;
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

  nix.trustedUsers = [ "root" "volhovm" ];

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };

  # https://github.com/nix-community/emacs-overlay
  nixpkgs.overlays = [ (import ./emacs-overlay/default.nix) ];
#  nixpkgs.overlays = [
#    (import (builtins.fetchTarball {
#      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
#    }))
#  ];


  environment.systemPackages = (with pkgs; [
    acpi
    alsaUtils
    at
    ag
    audacity
    autocutsel
    bc
    binutils-unwrapped
    bup
    bluedevil
    chromium
    cryptsetup
    deadbeef
    djvulibre
    efibootmgr
    elinks
    electrum
    evince
#    emacs
    emacsGit
    enca
    exiftool
    espeak
    ffmpeg
    file
    firefox
    ffmpeg-full
    gimp
    git
    gitAndTools.git-extras
    gitAndTools.tig
    gitinspector
    gitstats
    git-latexdiff
    gnupg
    gnuplot
    gnutls
    gparted
    gptfdisk
    gtypist
    gqview
    graphviz
    grub2
    grub2_efi
    hledger
    htop
    httpie
    hunspell
    hunspellDicts.en_GB-ize
    hunspellDicts.ru-ru
    hunspellDicts.uk-ua
    imagemagick
    inkscape
    iotop
    iptables
    iw
    jack2
    jq
    ledger
    libjpeg
    libreoffice
    libressl
    lshw
    lsof
    manpages
    mkpasswd
    mplayer
    mosh
    mtr
    nextcloud-client
    ncdu
    ntfs3g
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
    pv
    qjackctl
    rsync
    scrot
    simplescreenrecorder
    signal-desktop
    smartmontools
    socat
    sox
    speedcrunch
    speedtest-cli
    syslinux
    sysstat
    tcpdump
    thunderbird
    tmux
    teams
    teamviewer
    texlive.combined.scheme-full
    #tor-browser-bundle
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
    wirelesstools
    wget
    which
    xournalpp
    zathura
    zip
    zoom-us

    # Nix-related
    nix-prefetch-git
    nixops
    patchelf

    # Development
    cmake
    gcc
    gdb
    gnumake
    #haskellPackages.hindent
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
          #permutation
          random
          random-shuffle
          turtle
          tidal
          unordered-containers
#          universum
          zlib
        ]))
#    haskellPackages.weeder
#    haskellPackages.hpack
    libnotify
    python3
    #sage
    stack
    vimPlugins.vim-addon-nix

    # X11 related
    dunst
    dmenu
    feh
    inotify-tools
    haskellPackages.xmobar
    kbd
    libnotify
    lightdm
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
    xsecurelock
  ]); # ++ [ rustcNightly cargoNightly ];

  # Taken from: https://gist.github.com/ioggstream/8f380d398aef989ac455b93b92d42048
  # To prevent suspend issues I had with USB device 0000:00:14.0 returning -16 code.
  powerManagement = {
    powerDownCommands = "grep XHC.*enable /proc/acpi/wakeup && echo XHC > /proc/acpi/wakeup";
    resumeCommands = "grep XHC.*disable /proc/acpi/wakeup && echo XHC > /proc/acpi/wakeup";
  };

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

  # Otherwise I get this: https://github.com/NixOS/nixpkgs/issues/92319
  programs.dconf.enable = true;

  programs.light.enable = true;
  programs.ssh.startAgent= true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
    pinentryFlavor = "qt";
  };

  security = {
    rtkit.enable = true;
    sudo.enable = true;

    #pam.services = {
    #  login.limits =
    #    [ { domain = "@realtime"; type = "-"; item = "rtprio"; value = "99"; }
    #      { domain = "@realtime"; type = "-"; item = "memlock"; value = "unlimited"; }
    #    ];
    #  #login.text =
    #  #  lib.mkDefault (lib.mkAfter ''
    #  #    auth required pam_exec.so debug log=/var/log/pamexec.log /home/volhovm/dotfiles/scripts/pam_shutdown.sh
    #  #    account required pam_exec.so debug log=/var/log/pamexec.log /home/volhovm/dotfiles/scripts/pam_shutdown.sh
    #  #  '');
    #  #common-auth.text =
    #  #  lib.mkDefault (lib.mkAfter "auth required pam_exec.so debug log=/var/log/pamexec.log /home/volhovm/dotfiles/scripts/pam_shutdown.sh");
    #  #common-account.text =
    #  #  lib.mkDefault (lib.mkAfter "account required pam_exec.so debug log=/var/log/pamexec.log /home/volhovm/dotfiles/scripts/pam_shutdown.sh");
    #};
  };

# ------ SERVICES ------

  services = {
    batteryNotifier = {
      enable = true;
      device = "BAT1";
      notifyCapacity = 15;
      suspendCapacity = 5;
    };

    cron = {
      enable = true;
      systemCronJobs = [
        "0 */2 * * *  volhovm sh /home/volhovm/org/backup.sh > /tmp/bupcron 2> /tmp/bupcron.error"
        "* * * * *  volhovm date > /tmp/crontest"
      ];
    };

    # Blocking out distractions, yeah.
        #address=/facebook.com/127.0.0.1
    dnsmasq = {
      enable = true;
      extraConfig = ''
        address=/2ch.hk/127.0.0.1
        address=/instagram.com/127.0.0.1
        #address=/telegram.org/127.0.0.1
      '';
    };

    gnome3.gnome-keyring.enable = true;

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

    teamviewer.enable = true;

    udev.packages = [ pkgs.yubikey-personalization ];

    xserver = {
      autorun = true;
      enable = true;

      videoDrivers = [ "intel" ];

      layout = "pl,ru";
      xkbOptions = "grp:rshift_toggle,ctrl:swap_lalt_lctl,caps:escape_shifted_capslock";
      xkbVariant = "dvorak,ruu";

      wacom.enable = true;

      autoRepeatDelay = 200;
      autoRepeatInterval = 40;

      # Libinput can't handle trackpoint normally, though it works better
      # with touchpad that synaptics.
      libinput.enable = false;
      # Synaptics is crap. It doesn't support palm detection for touchpad.
      # It steals middle button.
      synaptics.enable = false;

      dpi = 130;

      displayManager.sessionCommands = ''
        sh ~/.xinitrc
      '';
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
      inputClassSections = [''
          Identifier "TPPS/2 IBM TrackPoint"
          Driver "evdev"
          MatchDevicePath "/dev/input/event*"
          Option "ConstantDeceleration" "0.4"
          Option "EmulateWheel" "true"
          Option "EmulateWheelButton" "2"
          Option "Emulate3Buttons" "false"
          Option "XAxisMapping" "6 7"
          Option "YAxisMapping" "4 5"
      ''];
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
    #tlp.settings = ''
    #  USB_BLACKLIST="8087:0a2b"
    #'';

#    thermald.enable = true;
# new nixos seems to work fine w/o it, at 45 degrees fan doesn't work
    thinkfan = {
      enable = true;

      levels = ''
        (0, 0, 70)
        (1, 60, 70)
        (3, 68, 77)
        (5, 76, 82)
        (7, 80, 32767)
      '';

      # Now I seem to have /proc/acpi/ibm/thermal !
      #sensors = ''
      #   hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input
      #   hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp2_input
      #   hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp3_input
      #'';
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

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "20.09";

}
