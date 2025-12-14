{
  description = "tcOS flake";

  inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-flatpak, zen-browser, ... }:
		let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
		in {
		nixosConfigurations = {
			tc-os = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
        ];
        specialArgs = {
          inherit inputs;
        };
			};
    };
    homeConfigurations = {
      tc = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [ ./home.nix ];
      };
    };
	};
}
