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
      spotify
      discord
      tdesktop
      brave
      zsh-powerlevel10k
      pokemon-colorscripts-mac
    ];
  };

  users.users.root.hashedPassword = "!";
}
