{ pkgs, ... }:

{
  # Enable security services
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };

  services.fail2ban.enable = true;

  # security.polkit.enable = true;
  services.usbguard = {
    enable = false;
    dbus.enable = true;
    implicitPolicyTarget = "block";
    # FIXME: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs
    rules = ''
      allow id {id} # device 1
      allow id {id} # device 2
    '';
  };
}
