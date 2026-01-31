{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      mkNixosConfig = name: modules: {
        "${name}" = nixpkgs.lib.nixosSystem {
          inherit modules;
          specialArgs = { inherit inputs outputs; };
        };
      };

      mkHomeConfig = name: modules: {
        "${name}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit modules;
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    in
    {
      packages = import ./pkgs pkgs;
      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations =
        (mkNixosConfig "desktop" [ ./nixos/desktop ]) // (mkNixosConfig "server" [ ./nixos/server ]);

      homeConfigurations =
        (mkHomeConfig "leonhard@desktop" [ ./home-manager/desktop/leonhard.nix ])
        // (mkHomeConfig "leonhard@server" [ ./home-manager/server/leonhard.nix ]);
    };
}
