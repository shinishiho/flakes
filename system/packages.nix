{ pkgs, inputs, lib, ... }:

{

  programs.browserpass.enable = true;
  programs.direnv.enable = true;
  services.upower.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
  programs.dconf.enable = true;
  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [
  	xfce.xfconf
  	gnome2.GConf
  ];
  programs.light.enable = true;
  services.mpd.enable = true;
  programs.thunar.enable = true;
  services.tumbler.enable = true; 
  services.fwupd.enable = true;
  services.auto-cpufreq.enable = true;
  security.pam.services.swaylock = {};
  # services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  programs.nm-applet.enable = true;

  programs.firejail = {
    enable = true;
    wrappedBinaries = { 
      mpv = {
        executable = "${lib.getBin pkgs.mpv}/bin/mpv";
        profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
      };
      imv = {
        executable = "${lib.getBin pkgs.imv}/bin/imv";
        profile = "${pkgs.firejail}/etc/firejail/imv.profile";
      };
      zathura = {
        executable = "${lib.getBin pkgs.zathura}/bin/zathura";
        profile = "${pkgs.firejail}/etc/firejail/zathura.profile";
      };
      discord = {
        executable = "${lib.getBin pkgs.discord}/bin/discord";
      };
    };
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Apply the overlay to the package set
  nixpkgs.overlays = [
    inputs.rust-overlay.overlays.default
  ];

  # Override packages
  nixpkgs.config.packageOverrides = pkgs: {
    colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = ["teal"]; };
    catppuccin-gtk = pkgs.catppuccin-gtk.override {
      accents = [ "teal" ]; # You can specify multiple accents here to output multiple themes 
      size = "standard";
      variant = "macchiato";
    };
    discord = pkgs.discord.override {
      withOpenASAR = true;
      withTTS = true;
    };
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # # Enable Hyprland
  programs.hyprland.enable = true;
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    policycoreutils
    mold
    gcc13
    jdk11
    go
    gopls
    delve
    (python311Full.withPackages(ps: with ps; [ pygobject3 gobject-introspection pyqt6-sip ]))
    nodePackages_latest.nodejs
    bun
    lua
    zig
    numbat

    python311Packages.python-lsp-server
    nodePackages_latest.nodemon
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodePackages_latest.dockerfile-language-server-nodejs
    sumneko-lua-language-server
    marksman
    nil
    zls

    libsForQt5.dolphin

    (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)
    evcxr #rust repl
    taplo #toml formatter & lsp
    cargo-watch
    cargo-deny
    cargo-audit
    cargo-update
    cargo-edit
    cargo-outdated
    cargo-license
    cargo-tarpaulin
    cargo-cross
    cargo-zigbuild
    cargo-nextest
    cargo-spellcheck
    cargo-modules
    cargo-bloat
    cargo-unused-features
    bacon
    lldb_16
    upx

    wasmedge
    wasmer
    lunatic
    wasmi
    # wasm3

    # mullvad-closest
    license-generator
    git-ignore
    just
    xh
    tgpt
    kitty
    eza
    parallel
    zellij
    neovim
    git
    chezmoi
    progress
    noti
    topgrade
    ripgrep
    rewrk
    wrk2
    procs
    tealdeer
    # skim #fzf better alternative in rust
    monolith
    aria
    # macchina #neofetch alternative in rust
    sd
    ouch
    duf
    du-dust
    fd
    jq
    gh
    trash-cli
    zoxide
    tokei
    fzf
    bat
    mdcat
    pandoc
    lsd
    gping
    viu
    tre-command
    felix-fm
    chafa

    # nerdctl
    # firecracker
    # firectl
    # flintlock
    distrobox
    qemu
    podman-compose
    podman-tui

    lazydocker
    lazygit
    neofetch
    onefetch
    ipfetch
    cpufetch
    starfetch
    octofetch
    htop
    bottom
    btop
    kmon

    cmatrix
    pipes-rs
    rsclock
    cava
    figlet

    qutebrowser
    zathura
    mpv
    imv

    numix-icon-theme-circle
    colloid-icon-theme
    catppuccin-gtk
    catppuccin-kvantum
    catppuccin-cursors.macchiatoTeal

    at-spi2-atk
    pamixer
    pavucontrol
    qt6.qtwayland
    psi-notify
    poweralertd
    # wlsunset
    gammastep
    greetd.tuigreet
    swaylock-effects
    swayidle
    brightnessctl
    playerctl
    psmisc
    grimblast
    slurp
    imagemagick
    swappy
    ffmpeg_6-full
    # wl-screenrec
    wf-recorder
    wl-clipboard
    cliphist
    clipboard-jh
    xdg-utils
    wtype
    wlrctl
    hyprpicker
    pyprland
    waybar
    rofi-wayland
    dunst
    avizo
    wlogout
    wpaperd
    swww
    gifsicle
    envsubst

    nuspell
    hyphen
    hunspell
    hunspellDicts.en_US

    vulnix       #scan command: vulnix --system
    clamav       #scan command: sudo freshcalm; clamscan [options] [file/directory/-]
    chkrootkit   #scan command: sudo chkrootkit
    glibc

    # passphrase2pgp
    pass-wayland
    pass2csv
    passExtensions.pass-tomb
    passExtensions.pass-update
    passExtensions.pass-otp
    passExtensions.pass-import
    passExtensions.pass-audit
    tomb
    docker-credential-helpers
    pass-git-helper

    # vulkan-tools
    # opencl-info
    # clinfo
    # vdpauinfo
    # libva-utils
    # nvtop
    usbutils
    dig
    speedtest-rs

    # gnome.gnome-tweaks
    # gnome.gnome-shell
    # xsettingsd
    # gnome.gnome-shell-extensions
    # themechanger
  ];

}
