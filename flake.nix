{
  description = "My nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Custom plugins
    plugin-treesitter = {
      url = "github:BasileusErwin/nvim-treesitter";
      flake = false;
    };
    plugin-surround = {
      url = "github:ur4ltz/surround.nvim";
      flake = false;
    };
    plugin-tokyodark = {
      url = "github:tiagovla/tokyodark.nvim";
      flake = false;
    };
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
            module = import ./config/basic.nix;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
          work = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = import ./config/work.nix;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
          personal = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = import ./config;
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
