-- src/Main.hs

module Main where

import Test.Tasty
import Tests
import Node ()
import Graph ()

main :: IO ()
main = defaultMain tests

