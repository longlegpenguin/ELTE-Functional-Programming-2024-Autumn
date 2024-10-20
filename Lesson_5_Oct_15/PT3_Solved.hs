{- Progress Task -}

{- Your neptun code : -}

{-
    Given a list of lists of integers and another list of integers, return the number of sublists 
    that have a lower average than the given list.

    Example:
    Input: [[1, 2, 3], [4, 5, 6], [7, 8, 9]], List: [2, 3, 4]
    Output: 1
-}

average :: [Int] -> Float
average xs = fromIntegral (sum xs) / fromIntegral (length xs)

countLowerAverage :: [[Int]] -> [Int] -> Int
countLowerAverage [] _ = 0
countLowerAverage (x:xs) ys
    | average x < average ys = 1 + countLowerAverage xs ys
    | otherwise = countLowerAverage xs ys


{- 
TODO Solution 2
 -}
countLowerAverage2 :: [[Int]] -> [Int] -> Int
countLowerAverage2 ll l = length (filter (\elem -> average elem < threshold) ll)
    where threshold = average l


-- main = print(countLowerAverage [[1, 2, 3], [4, 5, 6], [7, 8, 9]] [2, 3, 4]) -- 1
-- main = print(countLowerAverage [[10, 20], [5, 5, 5], [30, 40, 50]] [5, 5, 5, 10, 0]) -- 0
-- main = print(countLowerAverage [[2, 4, 6], [3, 5, 7], [5, 10, 15]] [10, 20, 30]) -- 3
-- main = print(countLowerAverage [[1, 1, 1], [2, 2, 2, 6, 10], [3, 3, 3]] [5, 5, 5, 1]) -- 2

-- main = print(countLowerAverage2 [[1, 2, 3], [4, 5, 6], [7, 8, 9]] [2, 3, 4]) -- 1
-- main = print(countLowerAverage2 [[10, 20], [5, 5, 5], [30, 40, 50]] [5, 5, 5, 10, 0]) -- 0
-- main = print(countLowerAverage2 [[2, 4, 6], [3, 5, 7], [5, 10, 15]] [10, 20, 30]) -- 3
-- main = print(countLowerAverage2 [[1, 1, 1], [2, 2, 2, 6, 10], [3, 3, 3]] [5, 5, 5, 1]) -- 2