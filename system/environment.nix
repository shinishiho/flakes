{ pkgs, ... }:

{
    environment = {

        variables.GTK_THEME = "Catppuccin-Macchiato-Standard-Teal-Dark";
        variables.XCURSOR_THEME = "Catppuccin-Macchiato-Teal";
        variables.XCURSOR_SIZE = "24";
        variables.SPOTIFY_PATH = "${pkgs.spotify}/";
        variables.JDK_PATH = "${pkgs.jdk11}/";
        variables.NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";

        variables.CI = "1";
# variables.CLIPBOARD_EDITOR = "hx";
        variables.CLIPBOARD_NOAUDIO = "1";
# variables.CLIPBOARD_NOGUI = "1";
# variables.CLIPBOARD_NOPROGRESS = "1";
# variables.CLIPBOARD_NOREMOTE = "1";
        variables.CLIPBOARD_SILENT = "1";

        sessionVariables.NIXOS_OZONE_WL = "1";
        sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    };
}
