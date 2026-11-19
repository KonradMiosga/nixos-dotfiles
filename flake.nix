{
  description = "NixOS";
  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      mkHost =
        hostModule:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            hostModule
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.copperplate = import ./home.nix;
                backupFileExtension = "backup";
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        scrappy = mkHost ./hosts/scrappy;
        junkpile = mkHost ./hosts/junkpile;
      };
    };
}
