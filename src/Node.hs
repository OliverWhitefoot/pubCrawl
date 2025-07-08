module Node (Node, makeNode, makeNodes, weight ) where

import UsefulFuncs ( uncurry3 )

data Node = Node {
    x :: Float,
    y :: Float,
    name :: String
 }
 deriving (Eq)

instance Show Node where
    show :: Node -> String
    show n = "Node: " ++ show (name n) ++ " x: " ++ show (x n) ++ " y: " ++ show (y n)

instance Ord Node where
    (<=) :: Node -> Node -> Bool
    n1 <= n2 = weight n1 <= weight n2


makeNode :: Float -> Float -> String -> Node
makeNode x1 y1 name1 = Node { x = x1, y = y1, name = name1 }

makeNodes :: [(Float, Float, String)] -> [Node]
makeNodes = map (uncurry3 makeNode)

weight :: Node -> Float
weight n = x n^(2 :: Integer) + y n^(2 :: Integer)