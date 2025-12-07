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
      npmDepsHash = "sha256-N9VYJ4DLUd/7obneglYHZylKZdwkY4ITUt8tw9ZqbYw=";
      src = ./.;
    in {
      packages.default = pkgs.buildNpmPackage {
        inherit pname version npmDepsHash src;

        postInstall = ''
          mkdir -p $out/bin
          exe="$out/bin/${pname}";
          lib="$out/lib/node_modules/${pname}";
          cp -r ./.next $lib
          echo "#!${pkgs.runtimeShell}" > $exe
          echo "cd $lib" >> $exe
          echo "${pkgs.nodePackages_latest.npm}/bin/npm run start" >> $exe
          chmod +x $exe
        '';
      };
    });
}
