{ mkDerivation, aeson, aeson-qq, base, data-default, hpack, lib
, lsp-test, string-interpolate
}:
mkDerivation {
  pname = "lsp-tester";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson aeson-qq base data-default lsp-test string-interpolate
  ];
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    aeson aeson-qq base data-default lsp-test string-interpolate
  ];
  testHaskellDepends = [
    aeson aeson-qq base data-default lsp-test string-interpolate
  ];
  prePatch = "hpack";
  homepage = "https://github.com/codedownio/lsp-tester#readme";
  license = lib.licenses.bsd3;
}
