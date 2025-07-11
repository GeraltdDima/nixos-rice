{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";  # Ensure home-manager follows nixpkgs input
    };

  };

  outputs = { nixpkgs, home-manager, zen-browser, ... } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; inherit zen-browser; };
      
      modules = [ ./configuration.nix home-manager.nixosModules.home-manager ];  # Path to your NixOS configuration file
    };

    homeConfigurations.dima = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";  # Ensure you are using the correct platform
      modules = [ ./home.nix ];  # Path to your Home Manager configuration file

      extraSpecialArgs = {
      	inherit zen-browser;
      };
    };
  };
}

