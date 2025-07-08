module Graph ( Graph, fromList, addNode, addNodes, addEdge, addEdges ) where

import Node
import Data.Set (Set)
import qualified Data.Set as Set

data Graph = Graph {
    nodes :: Set Node,
    edges :: Set (Node, Node, Weight)
 }

instance Show Graph where
    show :: Graph -> String
    show g = show (nodes g) ++ show (edges g)

newtype Weight = Intgit remote set-url origin https://github.com/OliverWhitefoot/pubCrawl.git

fromList :: [(Node, Node, Weight)] -> Graph
fromList es = Graph {
    nodes = nodesFromEdges es ,
    edges = Set.fromList es
}

nodesFromEdges :: [(Node, Node, Weight)] -> Set Node
nodesFromEdges edges = Set.fromList $ concatMap (\ (a, b) -> [a, b]) edges

addNode :: Graph -> Node -> Graph
addNode g n = Graph { nodes = Set.insert n (nodes g), edges = edges g }

addNodes :: Graph -> [Node] -> Graph
addNodes = foldl addNode

addEdge :: Graph -> (Node, Node, Int) -> Graph 
addEdge g (n1, n2) = let g' = addNodes g [n1, n2] 
                     in Graph { nodes = nodes g', edges = Set.insert (n1, n2) (edges g') }

addEdges :: Graph -> [(Node, Node)] -> Graph
addEdges = foldl addEdge






