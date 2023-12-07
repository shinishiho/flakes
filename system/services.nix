{ pkgs, ... }:

{

  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
      };
      initial_session = {
        command = "Hyprland";
	user = "nakxkri";
      };
    };
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      server_names = [ "cloudflare" "cloudflare-ipv6" "cloudflare-security" "cloudflare-security-ipv6" "adguard-dns-doh" "mullvad-adblock-doh" "mullvad-doh" "nextdns" "nextdns-ipv6" "quad9-dnscrypt-ipv4-filter-pri" "google" "google-ipv6" "ibksturm" ];
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

  # Enable Mullvad VPN
  # services.mullvad-vpn.enable = true;
  # services.mullvad-vpn.package = pkgs.mullvad; # `pkgs.mullvad` only provides the CLI tool, use `pkgs.mullvad-vpn` instead if you want to use the CLI and the GUI.

  # Enable MAC Randomize
  # systemd.services.macchanger = {
  #   enable = true;
  #   description = "Change MAC address";
  #   wantedBy = [ "multi-user.target" ];
  #   after = [ "network.target" ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.macchanger}/bin/macchanger -r wlp0s20f3";
  #     ExecStop = "${pkgs.macchanger}/bin/macchanger -p wlp0s20f3";
  #     RemainAfterExit = true;
  #   };
  # };

  # Enable services
  services.geoclue2 = {
    enable = true;
    appConfig = {
      "gammastep" = {
        isAllowed = true;
        isSystem = false;
        users = [ "1000" ]; # FIXME: set your user id (to get user id use command 'id -u "your_user_name"')
      };
    };
  };
  # services.avahi = {
  #   enable = true;
  #   nssmdns = true;
  # };

  # Systemd services setup
  systemd.package = pkgs.systemd.override { withSelinux = true; };
  systemd.packages = with pkgs; [
    auto-cpufreq
  ];

  # USB Automounting
  services.gvfs.enable = true;
  # services.udisks2.enable = true;
  # services.devmon.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  systemd.services.topgrade = {
  description = "Topgrade";
  serviceConfig = {
    Type = "oneshot";
    ExecStart = "${pkgs.topgrade}/bin/topgrade";
    };
  };

  systemd.timers.topgradeTimer = {
  wantedBy = [ "timers.target" ];
  timerConfig = {
    OnCalendar = "monthly";
    Persistent = true;
    };
  };

}
