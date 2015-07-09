# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, dataDefaultClass, diagramsCore, diagramsLib, filepath
, FontyFruity, JuicyPixels, lens, mtl, optparseApplicative
, Rasterific, split, statestack, time
}:

cabal.mkDerivation (self: {
  pname = "diagrams-rasterific";
  version = "0.1.0.4";
  sha256 = "0l6072blz56rc4nxr2s7gh5p3zdcyq8cfndbqgzndsfak6wyixgb";
  buildDepends = [
    dataDefaultClass diagramsCore diagramsLib filepath FontyFruity
    JuicyPixels lens mtl optparseApplicative Rasterific split
    statestack time
  ];
  jailbreak = true;
  meta = {
    homepage = "http://projects.haskell.org/diagrams/";
    description = "Rasterific backend for diagrams";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ bergey ];
  };
})