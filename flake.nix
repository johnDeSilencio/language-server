{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs =
    {
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = (import nixpkgs) { inherit system; };
      nodejs = pkgs.nodejs_22;
      node2nixOutput = import ./default.nix {
        inherit
          pkgs
          nodejs
          system
          ;
      };
      cucumber-langauge-server = node2nixOutput.package;
    in
    {
      packages.${system}.default = cucumber-langauge-server;
    };
}
