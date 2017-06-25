module Lib
    ( run
    ) where

run :: IO ()
run = do
  let d = square 4
  print d

square :: Float -> (Float, [Char])
square n = (n * n, "Square was called")

cube :: Float -> (Float, [Char])
cube n = (n * n * n, "Cube was called")