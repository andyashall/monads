module Lib
    ( run
    ) where

run :: IO ()
run = do
  let d = square 4
  let p = cubeDebug (unit 4)
  print p

-- Unit

unit :: Float -> (Float, [Char])
unit v = (v, "")

-- Funcs

square :: Float -> (Float, [Char])
square n = (n * n, "Square was called")

cube :: Float -> (Float, [Char])
cube n = (n * n * n, "Cube was called")

cubeDebug :: (Float, [Char]) -> (Float, [Char])
cubeDebug (n, s) = (n * n * n, s ++ " " ++ "Cube was called")