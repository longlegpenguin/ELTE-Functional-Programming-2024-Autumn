main :: IO ()


{-
HOMEWORK 1
Given two lists, check whether they have the same length, 
if length is different get teh sam elngth by dropping from the longer list. 
Afterwards, raise the elements in the first list to the power of the second one.
When a list is empty, then resulted list is empty too.

Example: hw1 [1,4,3,2] [1,2,3,2] --> [1^1,4^2,3^3,2^2] --> [1,16,27,4]

Because both lists are of the same length, we are going through both and 
raising the first lists elements to the corresponding element of the second list.
-}

setSameLength :: Int -> [Int] -> [Int]
setSameLength len list = drop ((length list)-len) list

hw1 :: [Int] -> [Int] -> [Int]
hw1 listA listB
    | length listA > length listB = hw1 (setSameLength (length listB) listA) listB
    | length listA < length listB = hw1 listA (setSameLength (length listA) listB)
    | otherwise = powerList listA listB

powerList :: [Int] -> [Int] -> [Int]
powerList [] [] = []
powerList (x:xs) (y:ys) = x^y : powerList xs ys


--main = print (hw1 [] []) --[]
--main = print (hw1 [] [1,3,4]) --[]
--main = print (hw1 [1,4,3,2] [1,2,3,2]) --[1,16,27,4]
--main = print (hw1 [2,3,1] [2,3,5,1]) --[8,243,1]
--main = print (hw1 [3,1,4] [2,1]) --[1,4]


{-
HOMEWORK 2
Given a list, create a new list of lists where each element is replicated as many times as its value
and in as many sublists as its value.
ex. [1,2,3] -> [[1],[2,2],[2,2],[3,3,3],[3,3,3],[3,3,3]]
-}

hw2aux :: Int -> Int -> [Int]
hw2aux 0 _ = []
hw2aux x1 x2 = x2 : hw2aux (x1-1) x2

hw2aux2 :: Int -> [Int] -> [[Int]]
hw2aux2 0 _ = []
hw2aux2 cnt l = l : hw2aux2 (cnt-1) l

hw2 :: [Int] -> [[Int]]
hw2 [] = []
hw2 (x : xs) = l ++ hw2 xs
    where 
        l = hw2aux2 x sl 
        sl = hw2aux x x
        
-- main = print $ s 5
-- main = print (hw2 [1,2,3]) --[[1],[2,2],[2,2],[3,3,3],[3,3,3],[3,3,3]]
-- main = print (hw2 [1,1,1,1]) --[[1],[1],[1],[1]]
-- main = print (hw2 []) --[]
-- main = print (hw2 [1,4,2,2]) --[[1],[4,4,4,4],[4,4,4,4],[4,4,4,4],[4,4,4,4],[2,2],[2,2],[2,2],[2,2]]


{-
HOMEWORK 3
Modify the sublists whose sum of numbers is even to be odd. Do this by attaching 1 to them
at the beginning of the list. If it is [] sublist, stays as it is.
ex. [[1,2,2],     [1,2,3],     [5,4,7]]     -> [[1,2,2], [1,1,2,3], [1,5,4,7]]
sum   5 odd   6 even-gets 1  16 even-gets 1 
-}

modSum :: [Int] -> [Int]
modSum [] = []
modSum list
    | even (sum list) = 1 : list
    | otherwise = list

hw3 :: [[Int]] -> [[Int]]
hw3 [] = []
hw3 (x:xs) = modSum x : hw3 xs

--main = print (hw3 [[1,2,2], [1,2,3], [5,4,7]]) --[[1,2,2],[1,1,2,3],[1,5,4,7]]
--main = print (hw3 [[], [5,3,7,2], [2]]) --[[],[5,3,7,2],[1,2]]
--main = print (hw3 [[5,3,1,7,3], [1,3,8,2], [], [2], []]) --[[5,3,1,7,3],[1,1,3,8,2],[],[1,2],[]]
--main = print (hw3 []) --[]


{-
HOMEWORK 4
Write a function recursiveListSubtraction that takes two lists of integers as input:
a source list and a list of elements to subtract. 

Example:
hw4 [1, 2, 3, 4, 5] [2, 4] -- [1, 3, 5]

The function iterates through the source list [1, 2, 3, 4, 5] and 
deletes the elements [2, 4]. It includes elements that are not 
in the second list, resulting in [1, 3, 5].
I.e. creates the difference of the two lists.
-}

hw4 :: [Int] -> [Int] -> [Int]
hw4 [] y = []
hw4 (x:xs) y
    | elem x y = hw4 xs y
    | otherwise = x : hw4 xs y

--main = print (hw4 [] []) --[]
--main = print (hw4 [1,2,3,4,5] []) --[1,2,3,4,5]
--main = print (hw4 [1,7,9,3,4] [1,4,9]) --[7,3]
--main = print (hw4 [] [1,6,7,4,2])  --[]


{-
HOMEWORK 5
Write your own remove duplicates function, which removes all 
the duplicates from a list and then
replicate each number the amount of times it appears.
ex. hw5 [1,1,2,1,3,2,3] -> [1,2,3] -> [1,2,2,3,3,3]
-}

hw5 :: [Int] -> [Int]
hw5 list = repli (removeDups list)

removeDups :: [Int] -> [Int]
removeDups [] = []
removeDups (x:xs)
    | elem x xs = removeDups xs
    | otherwise = x : removeDups xs

repli :: [Int] -> [Int]
repli [] = []
repli (x:xs) = (take x (repeat x)) ++ repli xs

--main = print (hw5  [1,1,2,1,3,2,3]) --[1,2,2,3,3,3]
--main = print (hw5 []) --[]
--main = print (hw5 [1,2,3,4,1,3]) --[2,2,4,4,4,4,1,3,3,3]
--main = print (hw5 [1,1,1,1,1,1]) --[1]


{-
HOMEWORK 6
Write your own take and reverse function without using any built in functions, 
then demonstrate them on a list.
Apply your take function first and then your reverse function.
-}

hw6 :: [Int] -> Int -> [Int]
hw6 list x = myReverse (myTake x list)

myReverse :: [Int] -> [Int]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

myTake :: Int -> [Int] -> [Int]
myTake _ [] = []
myTake num (x:xs)
    | num > 0 = x : myTake (num-1) xs
    | otherwise = []


--main = print (hw6 [] 2) --[]
--main = print (hw6 [1,2,1,3,2,1] 3) --[1,2,1]
--main = print (hw6 [1..5] 2) --[2,1]
--main = print (hw6 [5,6,7,8,5] 0) --[]


