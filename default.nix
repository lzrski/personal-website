with import <nixpkgs> {}; stdenv.mkDerivation {
  name = "personal-website-development";
  buildInputs = [
    caddy
    nodejs
  ];
  shellHook = ''
    # Start user's preffered shell
    exec ${builtins.getEnv "SHELL"}
  '';
}
