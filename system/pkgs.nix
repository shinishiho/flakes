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
    greetd.tuigreet
  ];
}