{
  description = "Nixos config flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    
    hyprmod = {
      url = "github:BlueManCZ/hyprmod";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    areofyl-fetch.url = "github:areofyl/fetch";
  };

  outputs = { self, nixpkgs, home-manager,  ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
          ./hardware-configuration.nix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.qydax = import ./home.nix;
          }
        ];
      };
    };
}
