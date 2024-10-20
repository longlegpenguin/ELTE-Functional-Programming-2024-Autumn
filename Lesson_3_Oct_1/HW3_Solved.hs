---------------------------------------------------------------------------------------
---- The middle function takes a non-empty list of integers and returns the middle element.
-- If the list is empty, it should return an error message.

middle :: [Int] -> Int
middle [] = error "Error: Empty list!"
middle x = x !! div (length x) 2

-- main = print (middle [1..5]) -- 3
-- main = print (middle [1..4]) -- 3
-- main = print (middle []) -- Your list is empty

---------------------------------------------------------------------------------------
---- The cut function takes a list of integers and return a list of two lists, 
-- splitting the original list at the middle.
-- If the list is empty, it should return two empty lists.
cut :: [Int] -> [[Int]]
cut [] = [[], []]
cut [a] = [[], [a]]
cut x = [take m x, drop m x]
    where m = div (length x) 2

-- main = print (cut [1..10]) -- [[1,2,3,4,5],[6,7,8,9,10]]
-- main = print (cut [1..11]) -- [[1,2,3,4,5],[6,7,8,9,10,11]]
-- main = print (cut []) -- [[],[]]
-- main = print (cut [1]) -- [[],[1]]

---------------------------------------------------------------------------------------
---- The not_five function will take a list of integers and returns a new list 
-- with all elements equal to 5 removed.
-- This function should not use higher-order functions.

not_five :: [Int] -> [Int]
not_five [] = []
not_five (5:xs) = not_five xs
not_five (x:xs) = x : not_five xs

-- main = print (not_five [5, 4, 5, 4, 3]) -- [4, 4, 3]
-- main = print (not_five [5, 5, 5]) -- []
-- main = print (not_five [1, 2, 3, 4]) -- [1, 2, 3, 4]
-- main = print (not_five []) -- []
-- main = print (not_five [5]) -- []

---------------------------------------------------------------------------------------

-- Write a function sliceList that takes two integers start and end, and a list. 
-- The function should return the sublist that starts at index start and ends at index end.
-- The start index must be non-negative, the end index must not be less than start, 
-- and the end index must not exceed the length of the list. If any of these conditions are violated, 
-- the function should return an error message indicating 'Invalid indices'.

sliceList :: Int -> Int -> [a] -> [a]
sliceList start end lst
    | start < 0 || end < start || end > length lst = error "Invalid indices"
    | otherwise = take (end - start) (drop start lst)

-- main = print (sliceList 1 4 [1, 2, 3, 4, 5, 6])  -- [2, 3, 4]
-- main = print (sliceList 0 3 "haskell")          -- "has"
-- main = print (sliceList 2 4 [10, 20, 30, 40, 50]) -- [30, 40]
-- main = print (sliceList 3 1 [1, 2, 3, 4])       -- Error: Invalid indices
-- main = print (sliceList 0 10 [1, 2, 3])         -- Error: Invalid indices
