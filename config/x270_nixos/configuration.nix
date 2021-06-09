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

  console = {
    font = "cyr-sun16";
    keyMap = "dvorak";
  };
  i18n.defaultLocale = "en_GB.UTF-8";

  environment.systemPackages = (with pkgs; [
    acpi                               # Battery/etc
    ag                                 # Searching
    alsaUtils                          # Audio
    audacity                           # Audio editing
    autocutsel                         # Syncing clibboards
    bluedevil                          # Bluetooth
    bup                                # Backups
    brightnessctl                      # Controlling brightness (light.sh)
    chromium                           # Browser
    cryptsetup                         # LUKS
    deadbeef                           # Audio player
    djvulibre                          # DJVU
    efibootmgr                         # EFI boot manager
    electrum                           # Bitcoin
    elinks                             # Browser
    emacsGit                           # Emacs
    enca                               # Encodings (e.g. subtitles)
    espeak                             # Speech generator
    evince                             # PDFs
    exiftool                           # EXIF data extraction
    ffmpeg                             # Media
    ffmpeg-full                        # Extensions?
    file                               # Determining file type
    firefox                            # Browser
    gimp                               # Image editing
    git                                # Git
    gitAndTools.git-extras             # Extras
    gitAndTools.tig                    # Git ncurses viewer
    gitstats                           # Git stats
    gnupg                              # GPG
    gnuplot                            # Plotting
    gparted                            # Disk partitioning, GUI
    gptfdisk                           # Disk partitioning: `gdisk` et al.
    gqview                             # Viewing photos
    graphviz                           # Graph plotting
    grub2                              # GRUB
    grub2_efi                          # GRUB efi support?
    gtypist                            # Typing drills
    hledger                            # Finances
    htop                               # top+
    httpie                             # `http` command for manual HTTP queries
    hunspell                           # Spelling
    hunspellDicts.en_GB-ize            # Dictionary
    hunspellDicts.ru-ru                # Dictionary
    hunspellDicts.uk-ua                # Dictionary
    imagemagick                        # cli image editing: `mogrify`, `convert`
    inkscape                           # Image editing, vector
    iotop                              # Top for I/O
    iptables                           # Networking
    iw                                 # Networking / wifi
    jq                                 # For ledger-fetch-price script
    ledger                             # Finances
    libreoffice                        # Office
    lshw                               # List hardware
    lsof                               # List open files/who uses file/socket
    manpages                           # Manpages
    mosh                               # Robust SSH over UDP
    motion                             # Web camera alerts
    mplayer                            # Video player
    ncdu                               # Ncurses du
    nextcloud-client                   # Cloud/backup/sync
    ntfs3g                             # NTFS support for `mount`
    obs-studio                         # Recording/streaming
    openvpn                            # VPN
    p7zip                              # ZIP tool; rarely used
    pandoc                             # Converter
    par2cmdline                        # Needed for bup fsck
    pass                               # Passwords
    pavucontrol                        # Audio GUI
    pciutils                           # `lspci`
    pdftk                              # CLI PDF editing
    pitivi                             # Video/audio editing studio
    pkgconfig                          # `pkg-config`, helper for libraries/linking
    poppler_utils                      # Images extraction from PDFs
    powertop                           # Power usage
    pv                                 # CLI progress bar
    rsync                              # Syncing data
    scrot                              # Screenshots
    signal-desktop                     # Signal messaging app
    skypeforlinux                      # Skype, well
    smartmontools                      # `smartctl`
    socat                              # Connecting sockets
    sox                                # Noise/audio generation
    speedcrunch                        # Calculator
    speedtest-cli                      # Networking, speed test
    sysstat                            # CPU/IO/etc stats tool for debugging
    tcpdump                            # TCP analyzer
    teams                              # Microsoft teams desktop client
    teamviewer                         # Controlling windows machines
    texlive.combined.scheme-full       # Tex
    thunderbird                        # Email
    tmux                               # Tmux
    tor-browser-bundle-bin             # Tor
    traceroute                         # Networking: tracing packages
    transmission_gtk                   # Torrents
    tree                               # `ls`, but tree view
    tty-clock                          # Fancy TTY clock
    unetbootin                         # Create bootable USB for Windows
    unzip                              # UnZIP
    unrar                              # UnRAR
    usbutils                           # `lsusb`, `usb-devices`
    vim                                # Vim
    vimPlugins.vim-nix                 # Vim support for nix
    vlc                                # Media player
    webfs                              # Serving files over HTTP
    wget                               # Wget, retrieving content from web
    which                              # Similar to `where` (which uses `type`)
    wirelesstools                      # `iwconfig`
    xournalpp                          # PDF note taking/annotations
    zathura                            # PDF/djvu viewer
    zip                                # ZIP
    zoom-us                            # Audio calls

    # Nix-related
    nix-prefetch-git
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

  krb5 = {
    enable = true;
    libdefaults.default_realm = "INF.ED.AC.UK";
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

  nix.trustedUsers = [ "root" "volhovm" ];

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };

  # https://github.com/nix-community/emacs-overlay
  nixpkgs.overlays = [ (import ./emacs-overlay/default.nix) ];

  # Taken from: https://gist.github.com/ioggstream/8f380d398aef989ac455b93b92d42048
  # To prevent suspend issues I had with USB device 0000:00:14.0 returning -16 code.
  powerManagement = {
    powerDownCommands = ''
      grep XHC.*enable /proc/acpi/wakeup && echo XHC > /proc/acpi/wakeup
      echo enabled > /sys/bus/usb/devices/usb1/power/wakeup
      echo enabled > /sys/bus/usb/devices/usb2/power/wakeup
    '';
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
  };


  services.batteryNotifier = {
    enable = true;
    device = "BAT1";
    notifyCapacity = 15;
    suspendCapacity = 5;
  };

  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 */2 * * *  volhovm sh /home/volhovm/org/backup.sh > /tmp/bupcron 2> /tmp/bupcron.error"
      "* * * * *  volhovm date > /tmp/crontest"
    ];
  };

  # Blocking out distractions, yeah.
  services.dnsmasq = {
    enable = true;
    extraConfig = ''
      #address=/telegram.org/127.0.0.1
    '';
  };

  services.gnome3.gnome-keyring.enable = true;

  services.openvpn.servers = {
    metajoinVPN = {
      config = '' config /home/volhovm/reps/private/volhovm.ovpn '';
      autoStart = false;
    };
  };

  services.openssh.enable = true;

  services.printing = {
    enable = true;
    browsing = true;
    defaultShared = true;
#    drivers = [ pkgs.hplipWithPlugin ];
  };

  services.teamviewer.enable = true;

  services.udev.packages = [ pkgs.yubikey-personalization ];

  # Required for ledger nano
  # https://support.ledger.com/hc/en-us/articles/115005165269-Fix-connection-issues
  services.udev.extraRules = ''
  KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="plugdev", ATTRS{idVendor}=="2c97"

  KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="plugdev", ATTRS{idVendor}=="2581"


  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="2b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="3b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="4b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1807", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1808", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0000", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0004", MODE="0660", TAG+="uaccess", TAG+="udev-acl"


  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="1011", MODE="0660", GROUP="plugdev"

  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="1015", MODE="0660", GROUP="plugdev"

  ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="304a" RUN+="${pkgs.stdenv.shell} -c 'echo enabled > /sys/bus/usb/devices/usb1/power/wakeup'"
  '';

# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
#
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="2b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
#
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="3b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
#
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="4b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
#
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1807", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
#
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1808", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
#
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0000", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
#
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001", MODE="0660", TAG+="uaccess", TAG+="udev-acl”
#
# SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0004", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
#


  services.xserver = {
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

  services.logind.extraConfig = ''
    HandleLidSwitch=ignore
    HandleHibernateKey=ignore
    LidSwitchIgnoreInhibited=no
    IdleAction=ignore
  '';

  services.acpid.enable = true;

  services.ntp.enable = true;

  services.tor = {
    enable = true;
    client.enable = true;
    torsocks.enable = true;
  };

  services.tlp.enable = true;

  services.thinkfan = {
    enable = true;

    # TODO FIX
    levels = [
      [0 0 70]
      [1 60 70]
      [3 68 77]
      [5 76 82]
      [7 80 32767]
    ];

    # Now I seem to have /proc/acpi/ibm/thermal !
    #sensors = ''
    #   hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input
    #   hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp2_input
    #   hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp3_input
    #'';
  };

  services.zerotierone = {
    enable = true;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "20.09";

  #time.timeZone = "Europe/Paris";
  time.timeZone = "Europe/London";
  #time.timeZone = "Europe/Moscow";

  users = {
    extraUsers.volhovm = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" "disk" "storage" "realtime" "plugdev" "docker" ];
    };
    motd = "Stay noided";
    groups = { realtime = { }; plugdev = {}; docker = {}; };
  };

  virtualisation.docker.enable = true;

}
