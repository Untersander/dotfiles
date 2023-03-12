{
  inputs = {
    # change tag or commit of nixpkgs for your system
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # change main to a tag o git revision
    mk-darwin-system.url = "github:vic/mk-darwin-system/main";
    mk-darwin-system.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = {mk-darwin-system, ...} @ inputs: let
    userName = "jan";
    hostName = "Worker";

    darwinFlake = mk-darwin-system.mkFlake {
      inherit userName hostName inputs;
      flake = ./.;
    };
  in
    darwinFlake;
}
