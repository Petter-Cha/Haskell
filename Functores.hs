instance Functor ((->) r) where
    fmap f g = (\x -> f (g x))