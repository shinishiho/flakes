{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nakxkri = {
    initialPassword = "1234";
    isNormalUser = true;
    description = "ShiniShiho";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      # Terminal
      kitty
      tmux
      pokemon-colorscripts-mac
      zsh-powerlevel10k

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
  };

  users.users.root.hashedPassword = "!";
}
