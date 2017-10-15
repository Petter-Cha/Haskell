Functores
-----------------------

Definiremos un funtor como un constructor de tipos con un m�todo asociado que
permite aplicar una funci�n sobre el tipo interno al constructor con ese tipo.
Es decir, un funtor ser� un constructor de tipos, `F :: * -> *`, para el que
se tiene una funci�n asociada `fmap :: (a -> b) -> F a -> F b`.

\begin{code}
class Functor f where
    fmap :: (a -> b) -> f a -> f b
\end{code}

Los funtores deben cumplir las leyes siguientes, heredadas de su definici�n en 
teor�a de categor�as:

~~~ Haskell
 fmap id = id
 fmap (p . q) = (fmap p) . (fmap q)
~~~

Es decir, que respetan la composici�n de funciones y la identidad de la 
categor�a.