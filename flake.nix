{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pkg = pkgs.buildDartApplication {
          pname = "unsure";
          version = "0.4.0";
          src = ./.;
          autoPubspecLock = ./pubspec.lock;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ just dart yq ];
        };

        packages.default = pkg;
      }
    );
}
