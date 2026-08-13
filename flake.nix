{
  description = "SCSI Landing Page dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nodejs_22
          ];

          shellHook = ''
            export NPM_CONFIG_PREFIX="$HOME/.npm-global"
            export PATH="$HOME/.npm-global/bin:$PWD/node_modules/.bin:$PATH"
            if ! command -v ng &> /dev/null; then
              npm install -g @angular/cli
            fi
          '';
        };
      });
}
