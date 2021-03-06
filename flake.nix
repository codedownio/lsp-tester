{
  description = "lsp-tester";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/051448e41537c3463ae776d46115d01afb6c498d";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }@inputs:
    # flake-utils.lib.eachDefaultSystem (system:
    flake-utils.lib.eachSystem ["x86_64-linux"] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        lsp-tester = pkgs.haskell.packages.ghc8107.callPackage ./lsp-tester.nix {};
      in
        rec {
          packages = rec {
            inherit lsp-tester;
          };

          devShell = lsp-tester.env;
        }
    );
}
