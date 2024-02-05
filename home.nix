{ config, pkgs, ... }:

{
  imports = [];

  home.username = "nakxkri";
  home.homeDirectory = "/home/nakxkri";

  home.packages = with pkgs; [
      # Entertainment
      qutebrowser
      imv
      mpv
      ani-cli
      spotify
      discord
      tdesktop
      brave
 
    ];

  programs = {
    git = {
      enable = true;
      userName = "ShiniShiho";
      userEmail = "nakxkri@shinishiho.cyou";
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}