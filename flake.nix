{
  description = "A flake for building Hello World";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-23.11;

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "hello-nix";
        src = self ;
        buildPhase = "gcc -o hello-nix ./hello-nix.c";
        installPhase = "mkdir -p $out/bin; install -t $out/bin hello-nix";
      };

  };
}
