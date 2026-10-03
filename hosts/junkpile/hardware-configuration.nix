# Replace this file on junkpile with the output of:
# nixos-generate-config --show-hardware-config
{ lib, ... }: {
  assertions = [
    {
      assertion = false;
      message = ''
        hosts/junkpile/hardware-configuration.nix is still a placeholder.
        Replace it with junkpile's generated hardware configuration before building.
      '';
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
