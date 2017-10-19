data Arbol a = H
			  | N (Arbol a) a (Arbol a)
			  deriving (Show, Eq)
			  
a2 :: Arbol Integer
a2 = N aI 10 aD
	where
		aI = N aII 15 aID
		aD = N H 18 aDD
		aII = hoja 24
		aID = hoja 27
		aDD = hoja 24

hoja :: a -> Arbol a
hoja x = N H x H
		
raiz :: Arbol a -> a
raiz H =  error "Raiz del arbol vacio"
raiz (N _ x _)   = x


nNodos :: Arbol a -> Int
nNodos H = 0
nNodos (N i r d) = 1 + nNodos i + nNodos d

nHojas :: Arbol a -> Int
nHojas H     = 1
nHojas (N i r d) = nHojas i + nHojas d


size :: Arbol a -> Int
size H     = 0
size (N i _ d) = 1 + (size i) + (size d)
 
profundidad :: Arbol a -> Int
profundidad H    = 0
profundidad (N i _ d) = 1 + max (profundidad i) (profundidad d)

inorden :: Arbol a -> [a]
inorden H = []
inorden (N i r d) = inorden i ++ [r] ++ inorden d

preorden :: Arbol a -> [a]
preorden H  = []
preorden (N i r d) = [r] ++ (preorden i ++ preorden d)

postorden :: Arbol a -> [a]
postorden H = []
postorden (N i r d) = postorden i ++ postorden d ++ [r]
