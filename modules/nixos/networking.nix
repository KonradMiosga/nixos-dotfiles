{ ... }: {
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.allowedUDPPorts = [ 24727 ];

}
