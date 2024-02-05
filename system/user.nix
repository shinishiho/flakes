{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nakxkri = {
    initialPassword = "1234";
    isNormalUser = true;
    description = "ShiniShiho";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.zsh;
  };

  users.users.root.hashedPassword = "!";
}
