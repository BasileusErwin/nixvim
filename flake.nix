{
  description = "My nixvim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, system, ... }:
        let
          nixvim' = nixvim.legacyPackages.${system};
          basic = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
          work = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
          personal = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = import ./config/personal;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
        in
        {
          packages = {
            default = basic;
            inherit basic;
            inherit work;
            inherit personal;
          };
        };
    };
}
