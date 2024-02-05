{ pkgs, ... }:

{

  home.packages = with pkgs; [
    kitty
    dotacat
    cowsay
    fortune-kind
    starship
  ];

  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      autocd = true;
    };

    tmux = {
      enable = true;
      shell = "\${pkgs.zsh}/bin/zsh";
    }
  }
}