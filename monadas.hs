fmap f m = m >>= (return . f)
join n = n >>= id