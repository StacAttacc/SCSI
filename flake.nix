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
            nodejs_26
            azure-cli
            opentofu
          ];

          shellHook = ''
            export AZURE_CORE_COLLECT_TELEMETRY=false
            export OPENTOFU_CLI_NO_TELEMETRY=true
            export NPM_CONFIG_PREFIX="$HOME/.npm-global"

            # Workaround: az CLI 2.89.x crashes when a guest user has no subscription-level
            # access. OpenTofu calls `az account get-access-token --subscription <id>` which
            # fails even though the token itself doesn't need to be subscription-scoped.
            # This wrapper strips --subscription from that call so the token is returned.
            _REAL_AZ="$(which az)"
            mkdir -p "$HOME/.az-wrapper"
            cat > "$HOME/.az-wrapper/az" << WRAPPER
#!/usr/bin/env bash
if [[ "\$*" == *"account get-access-token"* ]] && [[ "\$*" == *"--subscription"* ]]; then
  args=()
  skip_next=false
  for arg in "\$@"; do
    if \$skip_next; then skip_next=false; continue; fi
    if [[ "\$arg" == "--subscription" ]] || [[ "\$arg" == "-s" ]]; then skip_next=true; continue; fi
    args+=("\$arg")
  done
  exec "$_REAL_AZ" "\''${args[@]}"
fi
exec "$_REAL_AZ" "\$@"
WRAPPER
            chmod +x "$HOME/.az-wrapper/az"

            export PATH="$HOME/.az-wrapper:$HOME/.npm-global/bin:$PWD/node_modules/.bin:$PATH"
            if ! command -v ng &> /dev/null; then
              npm install -g @angular/cli
            fi
          '';
        };
      });
}
