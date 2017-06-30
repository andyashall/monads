module Lib
    ( run
    ) where

import Data.Char (toUpper, toLower, isUpper)

run :: IO ()
run = do
  -- let p = bind square (bind cube (unit 4))
  putStrLn "Enter a String"
  s <- getLine
  let p = unCapitalize (toCamelCase s)
  print p

-- Cammel

split :: (Char -> Bool) -> String -> [String]
split p s = case dropWhile p s of
    "" -> []
    s' -> w : split p s''
          where
            (w, s'') = break p s'

replace :: Eq a => a -> a -> [a] -> [a]
replace a b = map $ \c -> if c == a then b else c

transformFst :: (Char -> Char) -> String -> String
transformFst _ [] = []
transformFst f (x:xs) = (f x):xs

capitalize :: String -> String
capitalize = transformFst toUpper

unCapitalize :: String -> String
unCapitalize = transformFst toLower

toCamelCase :: String -> String
toCamelCase = concat . map' . split (== ' ')
  where
    map' = map capitalize

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