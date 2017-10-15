Functores
-----------------------

Definiremos un funtor como un constructor de tipos con un método asociado que
permite aplicar una función sobre el tipo interno al constructor con ese tipo.
Es decir, un funtor será un constructor de tipos, `F :: * -> *`, para el que
se tiene una función asociada `fmap :: (a -> b) -> F a -> F b`.

\begin{code}
class Functor f where
    fmap :: (a -> b) -> f a -> f b
\end{code}

Los funtores deben cumplir las leyes siguientes, heredadas de su definición en 
teoría de categorías:

~~~ Haskell
 fmap id = id
 fmap (p . q) = (fmap p) . (fmap q)
~~~

Es decir, que respetan la composición de funciones y la identidad de la 
categoría.