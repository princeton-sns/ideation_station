{ pkgs ? import <nixpkgs> {}, baseDir ? "/" }:

with pkgs;
let
  gems = bundlerEnv {
    name = "sns-site-gems";
    inherit ruby;
    gemdir = ./.;
  };

in stdenv.mkDerivation {
  name = "sns-site";
  nativeBuildInputs = [ gems ruby ];
  builder = writeText "builder.sh" ''
    source ${stdenv}/setup
    mkdir -p $out
    LC_CTYPE=C.UTF-8 JEKYLL_ENV=production jekyll build --source $src --destination $out --safe -b ${baseDir}
    '';
  src = ./.;
}
