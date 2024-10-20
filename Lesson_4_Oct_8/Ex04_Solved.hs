-- 1 ----------------------------------------------------------------------
-- Write a recursive function that computes the n-th multiple of an x plus 10 (n*x+10).
f1 :: Int -> Int -> Int
f1 0 x = 10
f1 n x = x + f1 (n - 1) x

main = print (f1 5 2) -- 20



-- 2 ----------------------------------------------------------------------
-- Add 2 to every odd number of a list, and subtract 2 from every even number.
f2 :: [Int] -> [Int]
f2 [] = []
f2 (x : xs)
    | odd x = (x + 2) : f2 xs
    | otherwise = (x - 2) : f2 xs

-- main = print (f2 [1..5]) -- [3,0,5,2,7]



-- 3 ----------------------------------------------------------------------
-- Compute the triple of the negative elements of a list up to the first positive number.
f3 :: [Int] -> [Int]
f3 [] = []
f3 (x : xs)
    | x < 0 = 3 * x : f3 xs
    | otherwise = []

-- main = print (f3 [-1,-3,-5,-5,2,-4,-5]) -- [-3, -9, -15, -15]



-- 4 ----------------------------------------------------------------------
-- Write a function that keeps the non-zero elements of a list and then multiply by 2 every element.
f4 :: [Int] -> [Int]
f4 [] = []
f4 (x : xs)
    | x /= 0 = (x * 2) : f4 xs
    | otherwise = f4 xs

-- main = print (f4 [1,2,3,0,5,0,6,0,0,0,0]) -- [2,4,6,10,12]



-- 5 ----------------------------------------------------------------------
-- Write a function for the square, the cube, and so on up to the n-th power of a number,
-- so that increasing powers of a number are obtained in a list.
f5 :: Int -> Int -> [Int]
f5 1 x = []
f5 n x = f5 (n - 1) x ++ [x ^ n]

-- main = print (f5 5 2)  -- [4,8,16,32]



-- 6 ----------------------------------------------------------------------
-- Replicate n>0 times a list.
f6 :: Int -> [Int] -> [[Int]]
f6 0 x = []
f6 n x = x : f6 (n - 1) x

-- main = print (f6 3 [1..5]) -- [[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]]



-- 7 ----------------------------------------------------------------------
-- Insert 0 at the middle of each sublist.
f7 :: [[Int]] -> [[Int]]
f7 [] = []
f7 (x : xs) = (take (length x `div` 2) x ++ [0] ++ drop (length x `div` 2) x) : f7 xs

-- main = print (f7 [[1..10], [1..11], [], [1], [1,2]]) 
-- [[1,2,3,4,5,0,6,7,8,9,10],[1,2,3,4,5,0,6,7,8,9,10,11],[0],[0,1],[1,0,2]]



-- 8 ----------------------------------------------------------------------
-- Extract the elements smaller then the head element of a list. Assume that the list is not empty.
f8 :: [Int] -> [Int]
f8 [] = []
f8 (h : t) = f8a h t

f8a :: Int -> [Int] -> [Int]
f8a n [] = []
f8a n (x : xs)
    | x < n = x : f8a n xs
    | otherwise = f8a n xs

-- main = print (f8 [5,1,2,3,4,5,3,6,7,1,8]) -- [1,2,3,4,3,1]



-- 9 ----------------------------------------------------------------------
-- Eliminate in a list, the sublists that are longer or equal to 10.
cond9 :: [Int] -> Bool
cond9 x = length x < 10

f9 :: [[Int]] -> [[Int]]
f9 [] = []
f9 (x : xs)
    | cond9 x = x : f9 xs
    | otherwise = f9 xs

-- main = print (f9 [[1..10], [1..11], [1..5], []]) -- [[1,2,3,4,5],[]]



-- 10 ----------------------------------------------------------------------
-- Compute the greatest common divisor in a recursive function.
f10 :: Int -> Int -> Int
f10 a b
    | a > b = f10 (a - b) b
    | b > a = f10 a (b - a)
    | otherwise = a

-- main = print (f10 24 12) -- 12



-- 11 ----------------------------------------------------------------------
-- Given a list of Ints, remove the element at the given position.
remElemAt :: Int -> [Int] -> [Int]
remElemAt i list = take i list ++ drop (i + 1) list

-- main = print (remElemAt 6 [1..7]) -- [1,2,3,4,5,6]
-- main = print (remElemAt 2 [1..7]) -- [1,2,4,5,6,7]
-- main = print (remElemAt 9 [1..7]) -- [1,2,3,4,5,6,7]



-- 12 ----------------------------------------------------------------------
-- Switch places the first and last element of a 3 element list.

reorder :: [String] -> [String]
reorder [t, b, h] = [h, b, t] -- reorder (t:b:h:[]) = h:b:t:[]

-- main = print (reorder ["tail", "body", "head"])              -- ["head", "body", "tail"]
-- main = print (reorder ["tails", "body", "heads"] )           -- ["heads", "body", "tails"]
-- main = print (reorder ["ground", "rainbow", "sky"])          -- ["sky", "rainbow", "ground"]



-- 13 ----------------------------------------------------------------------
-- Write a function to convert a list of a person's names into initials (first letter sepparated by a '.').

initials :: [String] -> String
initials [] = []
initials (x : xs) = head x : '.' : initials xs

-- main = print (initials ["Sam", "Harris"]) -- "S.H."
-- main = print (initials ["Howard", "Phillips", "Lovecraft"]) -- "H.P.L."



-- 14 ----------------------------------------------------------------------
-- Given a list of integers, find the minimum of a list (assume the list is not empty).
minimum1 :: [Int] -> Int
minimum1 [x] = x
minimum1 (x : y : xs)
    | x < y = minimum1 (x : xs)
    | otherwise = minimum1 (y : xs)

-- [1,0,3,4,5]
-- minimum1 [0,3,4,5]
-- minimum1 [0,4,5]
-- minimum1 [0,5]
-- minimum1 [0]

-- main = print (minimum1 [1..5])        -- 1
-- main = print (minimum1 [10,9,8,7,6])  -- 6
-- main = print (minimum1 [8,6,4,10,12]) -- 4

minimum2 :: [Int] -> Int
minimum2 [x] = x
minimum2 (x : xs) = min x (minimum2 xs)

-- minimum2 [1,2,0,-1] -> min 1 (min 2 (min 0 (-1)))
-- minimum2 [1,2,0,-1] -> min 1 (min 2 -1)
-- minimum2 [1,2,0,-1] -> min 1 -1
-- minimum2 [1,2,0,-1] -> -1

-- main = print (minimum2 [1..5])        -- 1
-- main = print (minimum2 [10,9,8,7,6])  -- 6
-- main = print (minimum2 [8,6,4,10,12]) -- 4

minimum3 :: [Int] -> Int
minimum3 x = minimum x

-- main = print (minimum3 [1..5]) -- 1



-- 15 ----------------------------------------------------------------------
-- Print the max and min number of a string

maxmin :: [Int] -> String
maxmin l = auxMaxMin (tail l) (head l) (head l)

auxMaxMin :: [Int] -> Int -> Int -> String
auxMaxMin [] max min = "max = " ++ show max ++ ", min = " ++ show min
auxMaxMin (x : xs) max min
    | x > max = auxMaxMin xs x min
    | x < min = auxMaxMin xs max x
    | otherwise = auxMaxMin xs max min

-- main = print (maxmin [4,6,2,1,9,63,-134,566]) -- "max = 566, min = -134"
-- main = print (maxmin [-52, 56, 30, 29, -54, 0, -110]) -- "max = 56, min = -110"
-- main = print (maxmin [5]) -- "max = 5, min = 5"



-- 16 ----------------------------------------------------------------------
-- Check if a list of Booleans contains a True value.
ifOneTrue :: [Bool] -> Bool
ifOneTrue [] = False
ifOneTrue (x : xs) = x || ifOneTrue xs

--  False || False || False || False

-- main = print (ifOneTrue [False, False, False]) -- False

ifOneTrue' :: [Bool] -> Bool
ifOneTrue' xs = or xs

-- main = print (ifOneTrue' [False, False, False]) -- False



-- 17 ----------------------------------------------------------------------
-- Check if all elements of a list of Booleans are True.
ifAllTrue :: [Bool] -> Bool
ifAllTrue [] = True
ifAllTrue (x : xs) = x && ifAllTrue xs

--  True && False && True && True

-- main = print (ifAllTrue [True, False, True]) -- False

ifAllTrue' :: [Bool] -> Bool
ifAllTrue' xs = and xs

-- main = print (ifAllTrue' [True, False, True]) -- False



-- 18 ----------------------------------------------------------------------
-- Write a function that checks if at least one of the elements in a list is even.
isOneEven :: [Int] -> Bool
isOneEven [] = False
isOneEven (x : xs) = even x || isOneEven xs

-- main = print (isOneEven [1,1,3])   -- False
-- main = print (isOneEven [1..9])    -- True
-- main = print (isOneEven [2,4..14]) -- True
-- main = print (isOneEven [])        -- False



-- 19 ----------------------------------------------------------------------
-- Write a function that checks if all of the elements in a list are even.
allEven :: [Int] -> Bool
allEven [] = True
allEven (x : xs) = even x && allEven xs

-- main = print (allEven [2,4,6])   -- True -- [2,4,6] -> even 2 && even 4 && even 6 && True
-- main = print (allEven [1..9])    -- False
-- main = print (allEven [2,4..14]) -- True
-- main = print (allEven [])        -- True



-- 20 ----------------------------------------------------------------------
-- Collect the divisors of a number in a list.
divisorsAux :: Int -> Int -> [Int] -> [Int]
divisorsAux inc number list
    | inc > number = list
    | number `rem` inc == 0 = divisorsAux (inc + 1) number (list ++ [inc])
    | otherwise = divisorsAux (inc + 1) number list

divisors :: Int -> [Int]
divisors number = divisorsAux 1 number []

-- main = print (divisors 18) -- [1,2,3,6,9,18]

divisorsAux2 :: Int -> Int -> [Int]
divisorsAux2 inc stop
    | inc > stop = []
    | stop `rem` inc == 0 = inc : divisorsAux2 (inc + 1) stop
    | otherwise = divisorsAux2 (inc + 1) stop

divisors2 :: Int -> [Int]
divisors2 number = divisorsAux2 1 number

-- main = print (divisors2 18) -- [1,2,3,6,9,18]



-- 21 ----------------------------------------------------------------------
-- Delete every second element from a list.
del2 :: [Int] -> [Int]
del2 [] = []
del2 [x] = [x]
del2 (x : y : xs) = x : del2 xs

-- main = print (del2 [1..10]) -- [1,3,5,7,9]
-- main = print (del2 [1..11]) -- [1,3,5,7,9,11]



-- 22 ----------------------------------------------------------------------
-- Delete every third element of the sublists of a list.
delete_3 :: [Int] -> [Int]
delete_3 [] = []
delete_3 [x] = [x]
delete_3 [x, y] = [x, y]
delete_3 (x : y : z : t) = x : y : delete_3 t

-- main = print (delete_3 [1..15]) -- [1,2,4,5,7,8,10,11,13,14]

delete_3' :: [Int] -> [Int]
delete_3' [] = []
delete_3' x = remElemAt 2 x

del3 :: [[Int]] -> [[Int]]
del3 [] = []
del3 (x : xs) = delete_3 x : del3 xs -- delete_3' x : del3 xs

-- main = print (del3 [[1..5],[],[1..4],[1,5],[1],[1..3],[1..10]])
-- [[1,2,4,5],[],[1,2,4],[1,5],[1],[1,2],[1,2,4,5,7,8,10]]



-- 23 ----------------------------------------------------------------------
-- Check if a list contains 2 equal elements one after the other
-- (they can be anywhere in the list) and count such equalitites
-- for [1,2,2,3,4,3,3,2,4,5,5,5] is 4 for [1 .. 5] is 0.

fe :: [Int] -> Int
fe [] = 0
fe [h] = 0
fe (h : x : t)
    | h == x = 1 + fe (x : t)
    | otherwise = fe (x : t)

-- main = print (fe [1,2,2,2,3,4,3,3,2,4,5,5,5,5,5,5,5,5,5]) -- 11



-- 24 ----------------------------------------------------------------------
-- (bonus) Compute the Euler number aproximation in n steps: e = 1/0! + 1/1! + 1/2! + 1/3! + ...
-- do not compute factorial
-- f21 :: Int -> Real

--  main = print (f21 1000)