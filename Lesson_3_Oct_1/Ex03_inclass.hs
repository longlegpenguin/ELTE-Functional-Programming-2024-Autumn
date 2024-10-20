{-
        Overview of lists:
            1. Homogeneity: All elements of list must be of the same type.
            2. Basic functions:
                1. "head list" retrieves the first element.
                2. "tail list" returns all but the first element.
            3. Use "++" to combine two lists.
            4. "length list" gives the number of elements of list
            5. Nested Lists: Lists can contain other lists. [[]]
            6. Indexing: Access elements with (list !! index). (exclamation mark)

            for more information check: https://www.haskelltutorials.com/guides/haskell-lists-ultimate-guide.html

-}


--Generate 2 digits number starting with 9
-- main = print [90 .. 99] -- [90,91,92,93,94,95,96,97,98,99]


--Generate multiples of 5 in the range of 0 to 100
-- main = print [5, 10 .. 100]
-- [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100]


--Generate all the 1-digit negatives
-- main = print [-9, -1] -- [-9,-8,-7,-6,-5,-4,-3,-2,-1]


--Generate an empty list   
-- main = print [3 .. 0] -- [] 


-- Generate positive even numbers from 0 up to 100
-- main = print [0, 2 .. 100]
--[0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]
     
---------------------------------------------------------------------------------------
-- Basic list functions - review

-- main = print (head [101, 20, 33, 43, 51] )    -- 101 first element of the list

-- main = print (head [ [101, 20], [33, 43, 51]] )  -- [101,20]

-- main = print (head [[[101, 20]], [[33]],[[ 43, 51], [1,2,3]]] )  -- [[101,20]]

-- main = print (tail [10, 22, 32, 43, 58] )  -- [22,32,43,58] everything except first element as a list

-- main = print (drop 5 [1, 2, 3, 4, 5, 6, 7] ) -- [6,7] delete first 5 elements

-- main = print (take 4 [1, 2, 3, 4, 5] ) -- [1,2,3,4] take first 4 elements

-- main = print ([1..10] ++ [8, 88] )  -- [1,2,3,4,5,6,7,8,9,10,8,88] concatenation, appends the second to the first

-- main = print (reverse [1..8])  -- [8,7,6,5,4,3,2,1] reverses a list

-- main = print (length [1..100] )   -- 100 number of elements

-- main = print (last [100, 200, 300])   -- 300 last list element

-- main = print (init [100, 200, 300])  -- [100,200] all except the last          

-- main = print ( elem 2 [0..22] ) -- True, check membership

-- main = print ( elem 5 [10..20]) -- False

-- main = print (concat [[1,2,3,4], [5], [6,7,8]] ) -- [1,2,3,4,5,6,7,8] flattens a list of lists

---------------------------------------------------------------------------------------
---- Define two lists. First one should include first 5 positive integers. 
-- Do this by writing them one by one.
-- Second one should include first 101 positive integers. Do this by using .. notation

first :: [Int]
first = [1,2,3,4,5]

-- main = print first

second :: [Int]
second = [1..101]

-- main = print second

---------------------------------------------------------------------------------------
---- Define a list of three strings: "apple", "banana", and "cherry". 
-- Write a function firstFruit that returns the first string from a list,
-- and restFruits function returns all the values except first.
-- remark: head [] and tail [] do not return normally (throw an exception)

fruits :: [String]
fruits = ["apple", "banana", "cherry"]

firstFruit :: [String] -> String
firstFruit x = head x


-- main = print (firstFruit ["apple", "banana", "cherry"]) -- "apple"
-- main = print (firstFruit ["orange"]) -- "orange"
-- main = print (firstFruit ["kiwi", "mango"]) -- "kiwi"

restFruits :: [String] -> [String]
restFruits x = tail x

-- main = print (restFruits ["apple", "banana", "cherry"]) -- ["banana", "cherry"]
-- main = print (restFruits ["orange"]) -- []
-- main = print (restFruits ["kiwi", "mango"]) -- ["mango"]

---------------------------------------------------------------------------------------
---- Write a function that puts the first value of the list as the last one, 
-- i.e. rotates once to the right.
-- Ex : [1,2,3] -> [2,3,1]

transformList :: [a] -> [a]
transformList [] = []
transformList (x:xs) = xs ++ [x]

-- main = print (transformList ["a", "b", "c"]) -- ["b", "c", "a"]
-- main = print (transformList [True, False, True]) -- [False, True, True]
-- main = print (transformList [1]) -- [1]

{-
   The following line calls transformList with an empty list.
   Since Haskell cannot infer the type of an empty list ([]), 
   we provide a type annotation (e.g., [Int]) to resolve the ambiguity.
-}

-- main = print (transformList ([] :: [Int])) -- empty list


---------------------------------------------------------------------------------------
----The concatTails function takes two input lists (with length at least 2), 
--removes the first elements from each, and 
--concatenates the remaining lists. 

concatTails :: [a] -> [a] -> [a]
concatTails [] _ = error "input too short"
concatTails _ [] = error "input too short"
concatTails x y = tail x ++ tail y

-- main = print (concatTails [1, 2, 3] [4, 5, 6]) -- [2, 3, 5, 6]
-- main = print (concatTails ["a", "b", "c"] ["d", "e", "f"]) -- ["b", "c", "e", "f"]
-- main = print (concatTails [True, False] [False, True]) -- [False, True]
-- main = print (concatTails [1] []) -- "input too short"

---------------------------------------------------------------------------------------
---- The averageList function takes a list of integers and returns the average of the list as a float.
-- If the list is empty, it should return 0.
-- Note: You can use fromIntegral built in function in order to convert Int to Float

averageList :: [Int] -> Float
averageList x = fromIntegral(sum x) / fromIntegral(length x)

-- main = print (averageList [1, 2, 3, 4, 5]) -- 3.0
-- main = print (averageList [10, 20, 30]) -- 20.0
-- main = print (averageList [7, 14, 21, 28]) -- 17.5
-- main = print (averageList []) -- 0.0

---------------------------------------------------------------------------------------
---- The sim function takes a list of integers and returns True if the list is symmetrical, otherwise False.
-- If the list is empty, it should return True.

sim :: [Int] -> Bool
sim x = x == reverse x


-- main = print (sim [1, 2, 1]) -- True
-- main = print (sim [1, 2, 3, 4, 5]) -- False
-- main = print (sim [1, 2, 2, 1]) -- True
-- main = print (sim []) -- True
-- main = print (sim [1]) -- True

---------------------------------------------------------------------------------------
---- The f1 function takes a list of integers and returns a new list 
-- with 3 added to every element using recursion.

f1 :: [Int] -> [Int]
f1 [] = []
f1 (x:xs) = [x + 3] ++ f1 xs


-- main = print (f1 [1, 5, 3, 1, 6]) -- [4, 8, 6, 4, 9]
-- main = print (f1 [0, -3, 7]) -- [3, 0, 10]
-- main = print (f1 []) -- []
-- main = print (f1 [10]) -- [13]

---------------------------------------------------------------------------------------
-- Write a recursive function that takes a list and returns a new list with the elements in reverse order. 
-- If the list is empty, return an empty list.
-- remark: built-in function is reverse

reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- main = print (reverseList [1, 2, 3, 4]) -- [4, 3, 2, 1]
-- main = print (reverseList ["apple", "banana", "cherry"]) -- ["cherry", "banana", "apple"]
-- main = print (reverseList [True, False]) -- [False, True]

---------------------------------------------------------------------------------------
-- Write a function elementAt that takes an index n and a list and returns the element at the given index. 
-- The function should give an error message if the index is out of bounds.
-- remark: Lists are 0-indexed.

elementAt :: Int -> [a] -> a
elementAt n xs 
    | n < 0 || n >= length xs = error "Error: Index out of bounds"
elementAt n xs = xs !! n

-- main = print( elementAt 2 [1, 2, 3, 4, 5])  -- 3
-- main = print( elementAt 5 [1, 2, 3, 4, 5]) -- Index out of bounds
-- main = print( elementAt 0 [1, 2, 3, 4, 5]) -- 1
-- main = print(elementAt 4 "haskell") -- e
-- main = print (elementAt (-2) [1, 2, 3])  -- Error: Index out of bounds
-- main = print (elementAt 5 [1, 2, 3]) -- Error: Index out of bounds

------------------------------------------------------------------------------------------

-- The firstGreaterThanFive function returns the first element greater than 5 in a list of integers. 
-- If there is no greater than 5 return -1.

firstGreaterThanFive :: [Int] -> Int
firstGreaterThanFive [] = -1
firstGreaterThanFive (x:xs)
    | x > 5 = x 
    | otherwise = firstGreaterThanFive xs

-- main = print (firstGreaterThanFive [1, 2, 6, 4, 8]) -- 6
-- main = print (firstGreaterThanFive [1, 2, 3, 4]) -- -1
-- main = print (firstGreaterThanFive [5, 5, 7]) -- 7

---------------------------------------------------------------------------------------
-- Write a recursive function that takes a list of lists of integers and 
-- returns a new list containing the count of numbers greater than 3 in each inner list.

countInList :: [Int] -> Int
countInList [] = 0
countInList (x:xs) 
    | x > 3 = 1 + countInList xs
    | otherwise = countInList xs

countGT3 :: [[Int]] -> [Int]
countGT3 [] = []
countGT3 (x:xs) = [countInList x] ++ countGT3 xs

-- main = print (countGT3 [[1, 2, 3], [4, 5, 6], [2, 3, 4]]) -- [0, 3, 1]
-- main = print (countGT3 [[0, 1, 2], [3], [4, 5]]) -- [0, 0, 2]
-- main = print (countGT3 [[5, 6, 7], [8, 9], []]) -- [3, 2, 0]
-- main = print (countGT3 []) -- []


{- ====================================================
TODO INCLASS EXERCISES 
======================================================= -}

---------------------------------------------------------------------------------------
---- The firstLast function takes a list and returns a new list containing 
-- the first and last elements of the input list. Assume the list has at least one element.

-- firstLast :: [a] -> [a]

-- main = print (firstLast "hello") -- "ho"
-- main = print (firstLast [1,2,3,4]) -- [1,4]
-- main = print (firstLast ["cad","adsa","fsafas","aa"]) -- ["cad","aa"]
-- main = print (firstLast [1]) -- [1,1]

---------------------------------------------------------------------------------------
----The concatHeads function takes the heads of both lists and returns them as a new list. 
-- Do error handling using null built-in function for empty lists.

-- concatHeads :: [a] -> [a] -> [a]


-- main = print (concatHeads [1, 2, 3] [4, 5, 6]) -- [1, 4]
-- main = print (concatHeads ["a", "b", "c"] ["d", "e", "f"]) -- ["a", "d"]
-- main = print (concatHeads [True, False] [False, True]) -- [True, False]
-- main = print (concatHeads ([] :: [Int]) ([] :: [Int]) ) -- Null list

---------------------------------------------------------------------------------------
---- The concatTailAndRest function takes a list and returns a new list by concatenating 
-- the tail of the list with the list excluding the last element. Assume the list is not empty.

-- concatTailAndRest :: [a] -> [a]


-- main = print (concatTailAndRest [])
-- main = print (concatTailAndRest [1, 2, 3, 4, 5]) -- [2,3,4,5,1,2,3,4]
-- main = print (concatTailAndRest ["a", "b", "c"]) -- ["b", "c", "a", "b"]
-- main = print (concatTailAndRest [True, False, True]) -- [False, True, True, False]

---------------------------------------------------------------------------------------
---- The f2 function will take a list of integers 
-- and returns a new list with the double of the positive elements.

-- f2 :: [Int] -> [Int]


-- main = print (f2 [1, 2, -2, 3, -4]) -- [2, 4, 6]
-- main = print (f2 [0, -3, 7]) -- [14]
-- main = print (f2 []) -- []

---------------------------------------------------------------------------------------------------

-- The doubleElements function returns a list where even elements are divided by 2 ,and odd element are multiplied by 2.


-- doubleElements :: [Int] -> [Int]


-- main = print (doubleElements [1, 2, 3]) -- [2, 1, 6]
-- main = print (doubleElements [-1, -2, -3]) -- [-2,-1,-6]
-- main = print (doubleElements [0, 10, 5]) -- [0, 5, 10]
-- main = print (doubleElements []) -- []


---------------------------------------------------------------------------------------
---- The sq function will take a list of integers and returns a new list with the square of each element.

-- sq :: [Int] -> [Int]


-- main = print (sq [1..5]) -- [1, 4, 9, 16, 25]
-- main = print (sq [0, -3, 7]) -- [0, 9, 49]
-- main = print (sq []) -- []
-- main = print (sq [10]) -- [100]

---------------------------------------------------------------------------------------
---- The f4 function will take a list of lists of integers and returns a new 
-- list of lists with the square of every element.

-- f4 :: [[Int]] -> [[Int]]


-- main = print (f4 [[1,2],[3,4,5,6],[7,8]]) -- [[1,4],[9,16,25,36],[49,64]]
-- main = print (f4 [[], [1], [2, 3]]) -- [[], [1], [4, 9]]
-- main = print (f4 []) -- []
-- main = print (f4 [[0, -1, -2]]) -- [[0, 1, 4]]

---------------------------------------------------------------------------------------
---- The del function will take an integer n and a list of integers, 
-- and returns a new list with all occurrences of n removed.

-- del :: Int -> [Int] -> [Int]


-- main = print (del 5 [1, 5, 6, 7, 5, 8, 5]) -- [1, 6, 7, 8]
-- main = print (del 3 [1, 2, 3, 4, 3, 5]) -- [1, 2, 4, 5]
-- main = print (del 0 [0, 0, 0, 0]) -- []
-- main = print (del 1 [2, 3, 4]) -- [2, 3, 4]
-- main = print (del 7 []) -- []

---------------------------------------------------------------------------------------
-- Insert 0 in front of every sublist of a list.
-- E.g. for [[1, 2], [3, 4], [5]] the result is [[0,1,2],[0,3,4],[0,5]]


-- insertZero :: [[Int]] -> [[Int]]


-- main = print (insertZero [[1, 2], [3, 4], [5]]) -- [[0,1,2],[0,3,4],[0,5]]
-- main = print (insertZero [[]]) -- [[0]]
-- main = print (insertZero []) -- []
-- main = print (insertZero [[1]]) -- [[0,1]]

---------------------------------------------------------------------------------------
---- The productf function takes a list of integers and returns the product of all the elements.
-- If the list is empty, it should return 1 (the identity for multiplication).

-- the built in function is product
-- main = print (product [1..7]) -- 5040

-- productf :: [Int] -> Int


-- main = print ( a  [1..5]) -- 120
-- main = print (productf [1, 2, 3, 4, 5]) -- 120
-- main = print (productf [10, 20, 30]) -- 6000
-- main = print (productf []) -- 1
-- main = print (productf [7]) -- 7


---------------------------------------------------------------------------------------
---- Write a function filterEven that takes a list of integers and returns a new list containing only the even numbers.

-- filterEven :: [Int] -> [Int]


-- main = print (filterEven [1, 2, 3, 4, 5, 6]) -- [2, 4, 6]
-- main = print (filterEven [7, 9, 13]) -- []
-- main = print (filterEven [0, -2, 3, -4]) -- [0, -2, -4]
-- main = print (filterEven []) -- []

---------------------------------------------------------------------------------------
---- Write a function wordLengths that takes a list of strings and 
-- returns a list of integers representing the length of each word.

-- wordLengths :: [String] -> [Int]


-- main = print (wordLengths ["apple", "banana", "cherry"]) -- [5, 6, 6]
-- main = print (wordLengths ["hello", "world"]) -- [5, 5]
-- main = print (wordLengths ["a", "abc", ""]) -- [1, 3, 0]
-- main = print (wordLengths []) -- []


---------------------------------------------------------------------------------------
-- Write a recursive function that takes a list of integers and 
-- returns a new list where each odd number is doubled, and each even number is tripled.

-- processList :: [Int] -> [Int]


-- main = print (processList [1, 2, 3, 4, 5]) -- [2, 6, 6, 12, 10]
-- main = print (processList [10, 15, 20, 25]) -- [30, 30, 60, 50]
-- main = print (processList [0, -3, 4, -5]) -- [0, -6, 12, -10]
-- main = print (processList []) -- []

-----------------------------------------------------------------------------------
-- Write a function that takes a list of integers and returns a list where:
-- every even number is replaced by the character 'e' and 
-- every odd number is replaced by the character 'o'
-- 0 is replaced by 'x'. 
-- For example, the list [0,1,2,3,4,5,6] should be transformed into ['x','o','e','o','e','o','e'].

-- replaceInts :: [Int] -> [Char]


-- main = print (replaceInts [0,1,2,3,4,5]) --"xoeoeo"
--main = print (replaceInts [1,5,3,2,0,3,87,1,2,0]) -- "oooexoooex"

--------------------------------------------------------------------------------------------------------
-- The replaceFirst function replaces the first occurrence of an element in the list with a new given value.

-- replaceFirst :: Int -> Int -> [Int] -> [Int]


-- main = print (replaceFirst 3 99 [1, 2, 3, 4, 3]) -- [1, 2, 99, 4, 3]
-- main = print (replaceFirst 5 42 [1, 2, 3, 4]) -- [1, 2, 3, 4] (no change)
-- main = print (replaceFirst 1 0 [1, 1, 1]) -- [0, 1, 1]





