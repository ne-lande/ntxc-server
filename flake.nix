{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ self, pkgs, ... }:
    let
      myTerraform = pkgs.terraform.withPlugins (p: [
        p.yandex
      ]);
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        {
          devShells = {
            default = pkgs.mkShell {
              nativeBuildInputs = with pkgs; [
                yandex-cloud
                myTerraform
                packwiz
              ];
              DOTNET_BIN = "${pkgs.dotnetCorePackages.sdk_9_0}/bin/dotnet";
            };
          };
        };
    };
}
