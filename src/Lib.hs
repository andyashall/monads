module Lib
    ( run
    ) where

run :: IO ()
run = do
  let p = bind square (bind cube (unit 4))
  print p

-- Unit

unit :: Float -> (Float, [Char])
unit v = (v, "")

-- Bind

bind :: (Float -> (Float, [Char])) -> ((Float, [Char]) -> (Float, [Char]))
bind fun (a1,a2) = let (b1,b2) = fun a1 in (b1,a2++b2)

-- Funcs

square :: Float -> (Float, [Char])
square n = (n * n, "Square was called")

cube :: Float -> (Float, [Char])
cube n = (n * n * n, "Cube was called")