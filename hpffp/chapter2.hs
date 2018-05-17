sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

triple x = x * 3

area1 radius = 3.14 * (radius * radius)
area2 radius = pi * (radius * radius)
