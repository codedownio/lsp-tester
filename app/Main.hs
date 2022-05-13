module Main where

import Control.Monad.IO.Class
import Data.Aeson (Value)
import Data.Aeson.QQ
import Data.Default
import Data.String.Interpolate
import Language.LSP.Test


config :: Value
config = [aesonQQ|{pylsp: {plugins: {pycodestyle: {ignore: ["E303", "E402"]}}}}|]

main :: IO ()
main = runSessionWithConfig (def { lspConfig = Just config }) "/nix/store/bpa4b6xlnyj7w5zcqx92glpvjy8i31zj-python3-3.8.10-env/bin/python -m pylsp" fullCaps "test/data" $ do
  openDoc "test.py" "python"
  diagnostics <- waitForDiagnostics
  liftIO $ putStrLn [i|Got diagnostics: #{diagnostics}|]
