{ pkgs, ... }:

{
    boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        loader.efi.efiSysMountPoint = "/boot";
        loader.timeout = 0;
        initrd.enable = true;
        initrd.systemd.enable = true;
	initrd.verbose = false;
	consoleLogLevel = 0;
        plymouth = {
            enable = true;
            font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
            themePackages = [ pkgs.catppuccin-plymouth ];
            theme = "catppuccin-macchiato";
        };

# Linux Kernel
        kernelPackages = pkgs.linuxKernel.packages.linux_zen;
        kernelParams = [ 
            "quiet"
	    "splash"
	    "loglevel=3"
	    "rd.udev.log_level=3"
	    "rd.udev.log_priority=3"
            "fbcon=nodefer"
            "vt.global_cursor_default=0"
        ];
    };
}
