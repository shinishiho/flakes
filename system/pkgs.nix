{ pkgs, inputs, lib, ... }:

{

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services = {
    auto-cpufreq.enable = true;
    fwupd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Prelogin
    greetd.tuigreet

    # Utility
    topgrade
    ripgrep
    skim
    sd
    fd
    jq
    mdcat
    aria

    # Tool
    git
    chezmoi
    macchina
    lazygit
    ipfetch
    cpufetch
    starfetch
    octofetch
    bat
    btop
    brightnessctl
    playerctl
    cliphist
    wl-clipboard
    speedtest-rs

    # Ricing
    waybar
    rofi-wayland
    swww
    wlogout
    swayidle
  ];
}