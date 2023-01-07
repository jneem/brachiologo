let
  nixpkgs = builtins.fetchGit { url = "https://github.com/NixOS/nixpkgs.git"; rev = "384b898d18b0044165b23d19cb9a0b8982d82b11"; };
  rustOverlay = builtins.fetchGit { url = "https://github.com/oxalica/rust-overlay.git"; };
  pkgs = import nixpkgs { overlays = [ (import rustOverlay) ]; };
  rust-toolchain = pkgs.rust-bin.stable.latest.default;
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    rust-toolchain
    rust-analyzer
  ];
}
