# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the gummiboot efi boot loader.
  boot = {
    loader.gummiboot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_3_4;
    kernel.sysctl= {
      "vm.swappiness" = 1;
      "vm.vfs_cache_pressure" = 50;
    };
    # sys is created at stage 2 i suppose
    kernelParams = [ "elevator=noop" ];
    initrd = {
      kernelModules = ["fbcon"];
    };
  };

  # Unsorted
  nixpkgs.config = {
     allowUnfree = true; 
     firefox = {
     enableGoogleTalkPlugin = true;
     enableAdobeFlash = true;
    };

    chromium = {
      enablePepperFlash = true;
      enablePepperPDF = true;
    };
  };

  time.timeZone = "Europe/Minsk";
  hardware = {
    opengl.enable = true;
    pulseaudio.enable = true;
  };

  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
#    samba = {
#      enable = true;
#      securityType = "share";
#      extraConfig = ''
#        workgroup = WORKGROUP
#	server string = smbnix
#	netbios name = smbnix
#	security = share 
#	#use sendfile = yes
#	#max protocol = smb2
#  
#	[rw-files]
#	comment = Temporary rw files 
#	path = /home/sambashare
#	read only = no
#	writable = yes
#	public = yes
#      '';
#    };
  };

  systemd.services = {
    acpid = {
      postStart = "chmod 777 /sys/class/leds/asus\:\:kbd_backlight/brightness";
    };
  };
  networking = {
    hostName = "nixos";
    wireless.enable = true;  # Enables wireless.
    extraHosts = "127.0.0.1 nixos";
#    networkmanager.enable = true;
 #   firewall.connectionTrackingModules = [ "ftp" "pptp" ];
   # interfaceMonitor.enable = false;
    useDHCP = true;
   # wicd.enable = true;
  };

  # Select internationalisation properties.
  # It doesn't really work
  # drdos8x16
  # lat9w-16
  # LatArCyrHeb-16
  i18n = {
    consoleFont = "cyr-sun16";
    consoleKeyMap = "dvorak";
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro
      corefonts
#      lmodern
#      lmmath
      inconsolata
      dejavu_fonts
      ubuntu_font_family
      unifont
#      tipa
#      theano
      terminus_font
#      oldstandard
      liberation_ttf
#      junicode
#      dosemu_fonts
#      clearlyU
#      cantarell_fonts
   ];
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
#     autorun = false;
     videoDrivers = [
#	"ati"
	"ati_unfree"
     ];
     exportConfiguration = true;
     enable = true;
     synaptics = {
       enable = true;
       minSpeed = "0.4";
       maxSpeed = "1.2";
       accelFactor = "0.035";
       palmDetect = true;
       horizontalScroll = false;
       twoFingerScroll = true;
#       buttonsMap = [ 1 3 2 ]; # Some bug, default settings doesn't recognize right touchpad button as it is, now it's two-finger-tap to call menu
       additionalOptions = ''
         Option "TapButton3"           "2"
         Option "ClickPad"             "true"
	 Option "SoftButtonAreas"      "50% 0 82% 0 0 0 0 0"
#	 Option "PalmMinWidth"         "6"
#	 Option "PalmMinZ"             "100"
       '';
     };
     layout = "us, ru";
     xkbOptions = "grp:caps_toggle";
     xkbVariant = "dvorak, ";
     desktopManager.default = "none";
     displayManager = {
       sessionCommands = ''
	 sh ~/.xinitrc &
       '';
       # slim.enable = true;
       # lightdm.enable = true;
        kdm.enable = true;
     };
     windowManager = {
       xmonad.enable = true;
       xmonad.enableContribAndExtras = true;
       default = "xmonad";
     };
   };

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.extraUsers.volhovm = {
     name = "volhovm";
     group = "wheel";
     uid = 1000;
     createHome = true;
     home = "/home/volhovm";
     shell = "/run/current-system/sw/bin/bash";
   };

   # Some power management, i haven't mentioned any differences though
   powerManagement = {
     enable = true;
     cpuFreqGovernor = "powersave";
     scsiLinkPolicy = "min_power";
   };
   services.acpid = {
     enable = true;
   };

   environment.systemPackages = [
   #  pkgs.where
     pkgs.libcxx
     pkgs.zlib
     pkgs.scala
     pkgs.git
     pkgs.emacs
     pkgs.links
     pkgs.ppp
     pkgs.pptp
     pkgs.glibc
#     pkgs.dropbox
#     pkgs.dropbox-cli
#     pkgs.chromiumWrapper
#     pkgs.firefoxWrapper
#     pkgs.haskellPackages.haskellPlatform.ghc
#     pkgs.haskellPackages.xmobar
#     pkgs.haskellPackages.xmonad
#     pkgs.haskellPackages.ynclient PalmDetect=1
#     pkgs.haskellPackages.xmonadExtras
   ];
   programs.bash = {
     enableCompletion = true;
     shellAliases = { where = "type -P"; l = "ls -alh"; ll = "ls -l"; ls = "ls --color=tty"; restart = "systemctl restart"; start = "systemctl start"; status = "systemctl status"; stop = "systemctl stop"; which = "type -P"; mv = "mv -v"; rm = "rm -v"; cp = "cp -v"; lock = "xlock -echokeys -echokey 'X'"; };
     shellInit = ''
     # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.nix-profile/lib:~/.nix-profile/lib64
     # export JAVA_HOME=~/.nix-profile/jre/..
     '';
   };
}
