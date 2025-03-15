{
  description = "Portfolio website";
  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      pname = "portfolio";
      version = "0.1.0";
    in {
      packages.default = pkgs.buildNpmPackage {
        inherit pname version;
        src = ./.;
        npmDepsHash = "sha256-xoYxK1KdM9i57hayPs+HEXmwQyQBZQz39ctsje+xTbo=";
        postInstall = ''
          mkdir -p $out/bin
          exe="$out/bin/${pname}";
          lib="$out/lib/node_modules/${pname}";
          cp -r ./.next $lib
          echo "
            #!/usr/bin/env bash
            cd $lib
            ${pkgs.nodePackages_latest.npm}/bin/npm run start
          " > $exe
          chmod +x $exe
        '';
      };
    });
}
