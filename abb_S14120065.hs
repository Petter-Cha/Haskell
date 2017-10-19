import Test.QuickCheck
import Control.Monad

data Arbol a = H a
             | N a (Arbol a) (Arbol a)
             deriving (Show, Eq)
			 
-- Definir la función  nHojas :: Arbol a -> Int
-- tal que (nHojas x) es el número de hojas del árbol x. Por ejemplo,
--  nHojas (N 9 (N 3 (H 2) (H 4)) (H 7))  ==  3
 
nHojas :: Arbol a -> Int
nHojas (H _)     = 1
nHojas (N x i d) = nHojas i + nHojas d

-- Definir la función nNodos :: Arbol a -> Int
-- tal que (nNodos x) es el número de nodos del árbol x. Por ejemplo,
--    nNodos (N 9 (N 3 (H 2) (H 4)) (H 7))  ==  2
 
nNodos :: Arbol a -> Int
nNodos (H _) = 0
nNodos (N x i d) = 1 + nNodos i + nNodos d


-- Definir la función profundidad(Altura) :: Arbol a -> Int
-- tal que (profundidad x) es la profundidad del árbol x. Por ejemplo,
--    profundidad (N 9 (N 3 (H 2) (H 4)) (H 7))              ==  2
--    profundidad (N 9 (N 3 (H 2) (N 1 (H 4) (H 5))) (H 7))  ==  3
-- ---------------------------------------------------------------------
 
profundidad :: Arbol a -> Int
profundidad (H _)     = 0
profundidad (N x i d) = 1 + max (profundidad i) (profundidad d)
 

inorden :: Arbol a -> [a]
inorden (H x)= [x]
inorden (N x i d) = inorden i ++ [x] ++ inorden d

preorden :: Arbol a -> [a]
preorden (H x)     = [x]
preorden (N x i d) = x : (preorden i ++ preorden d)

postorden :: Arbol a -> [a]
postorden (H x)     = [x]
postorden (N x i d) = postorden i ++ postorden d ++ [x]