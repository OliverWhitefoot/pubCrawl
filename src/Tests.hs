-- src/Tests.hs

module Tests (tests) where

import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests = testGroup "All Tests"
  [ unitTests
  ]

unitTests :: TestTree
unitTests = testGroup "Unit Tests"
  [ testCase "1 + 1 = 2" $
      1 + 1 @?= 2

  , testCase "negate 5 == -5" $
      negate 5 @?= (-5)

  , testCase "head [1,2,3] == 1" $
      head [1,2,3] @?= 1

  , testCase "reverse [1,2,3] == [3,2,1]" $
      reverse [1,2,3] @?= [3,2,1]
  ]
