module Edge where 

import Node (Node)
import UsefulFuncs (uncurry3)

newtype Weight Int = Weight Int
data Edge = Edge (Node, Node, Weight)

getEdge :: Node -> Node -> Weight -> Edge 
getEdge n1 n2 w = Edge (n1, n2, w)

fromList :: [(Node, Node, Weight)] -> [Edge]
fromList = map (uncurry3 getEdge) 



