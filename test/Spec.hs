-- src/Tests.hs 
module Tests (tests) where

import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests = testGroup "Basic Tests"
  [ testCase "Addition" $ 1 + 1 @?= 2
  , testCase "Negation" $ negate 1 @?= -1
  ]