{ inputs, pkgs, lib, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./hardware
      ./system
    ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];    
    auto-optimise-store = true;
  };
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;
  nix.gc = { # Delete old generations after some time
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };
  system.stateVersion = "23.11";

}
