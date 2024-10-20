{- Progress Task -}

{- Your neptun code : -}

{-
    Given a list of lists of integers and another list of integers, return the number of sublists 
    that have a lower average than the given list.

    Example:
    Input: [[1, 2, 3], [4, 5, 6], [7, 8, 9]], List: [2, 3, 4]
    Output: 1
-}

-- countLowerAverage :: [[Int]] -> [Int] -> Int


-- average :: [Int] -> Double
-- average xs = fromIntegral (sum xs) / fromIntegral (length xs)

-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage sublists list = 
--     let listAvg = average list
--     in length [sublist | sublist <- sublists, average sublist < listAvg]

-- average :: [Int] -> Double
-- average xs = fromIntegral (sum xs) / fromIntegral (length xs)
 
 
-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage [] _ = 0
-- countLowerAverage (x:xs) givenList
--     | average x < average givenList = 1 + countLowerAverage xs givenList
--     | otherwise = countLowerAverage xs givenList

-- average :: [Int] -> Double
-- average xs = fromIntegral (sum xs) / fromIntegral (length xs)
 
-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage sublists lst = length [sublist | sublist <- sublists, average sublist < avgLst]
--   where avgLst = average lst
 
-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage lists ref = length $ filter (\sublist -> sum sublist * length ref < sum ref * length sublist) lists

-- average :: [Int] -> Float
-- average xs = fromIntegral(sum xs) / fromIntegral(length xs)


-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage [] _ = 0
-- countLowerAverage (x:xs) givenlist
--  | average x < average givenlist = 1 + countLowerAverage xs givenlist  
--  | otherwise = countLowerAverage xs givenlist


-- average :: [Int] -> Double
-- average xs = fromIntegral (sum xs) / fromIntegral (length xs)

-- -- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage sublists targetList =
--     length [sublist | sublist <- sublists, average sublist < targetAvg]
--   where
--     targetAvg = average targetList


-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage lists target = length $ filter (\sublist -> avg sublist < avg target) lists
--   where
--     avg xs = fromIntegral (sum xs) / fromIntegral (length xs)


-- average :: [Int] -> Double
-- average xs = fromIntegral (sum xs) / fromIntegral (length xs)


-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage [] _ = 0  
-- countLowerAverage (x:xs) givenList
--   | average x < average givenList = 1 + countLowerAverage xs givenList  
--   | otherwise = countLowerAverage xs givenList

-- average :: [Int] -> Double
-- average xs = fromIntegral (sum xs) / fromIntegral (length xs)

-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage sublists targetList =
--     let targetAverage = average targetList
--     in length $ filter (\sublist -> not (null sublist) && average sublist < targetAverage) sublists

-- average :: [Int] -> Float
-- average [ ] = 0
-- average list = fromIntegral (sum list) / fromIntegral (length list)
 
-- countLowerAverage :: [[Int]] -> [Int] -> Int 
-- countLowerAverage [ ] _ = 0 
-- countLowerAverage (x:xs) targetList     
--     | average x < average targetList = 1 + countLowerAverage xs targetList    
--     | otherwise = countLowerAverage xs targetList

-- average :: [Int] -> Double
-- average xs = fromIntegral (sum xs) / fromIntegral (length xs)

-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage sublists lst = length [sublist | sublist <- sublists, average sublist < avgLst]
--   where avgLst = average lst

-- averagefunc :: [Int] -> Double
-- averagefunc xs = fromIntegral (sum xs) / fromIntegral (length xs)


-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage [] _ = 0  
-- countLowerAverage (x:xs) ls
--   | averagefunc x < averagefunc ls = 1 + countLowerAverage xs ls  
--   | otherwise = countLowerAverage xs ls  

-- averagefunc :: [Int] -> Double
-- averagefunc xs = fromIntegral (sum xs) / fromIntegral (length xs)


-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage [] _ = 0  
-- countLowerAverage (x:xs) ls
--   | averagefunc x < averagefunc ls = 1 + countLowerAverage xs ls  
--   | otherwise = countLowerAverage xs ls  

    
-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage lists ref = length $ filter (\sublist -> sum sublist * length ref < sum ref * length sublist) lists

    
-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage lists ref = length $ filter (\sublist -> sum sublist * length ref < sum ref * length sublist) lists
    
-- countLowerAverage :: [[Int]] -> [Int] -> Int
-- countLowerAverage lists ref = length $ filter (\sublist -> sum sublist * length ref < sum ref * length sublist) lists


countLowerAverage :: [[Int]] -> [Int] -> Int
countLowerAverage lists ref = length $ filter (\sublist -> sum sublist * length ref < sum ref * length sublist) lists


average :: [Int] -> Double
average xs = fromIntegral (sum xs) / fromIntegral (length xs)

countLowerAverage :: [[Int]] -> [Int] -> Int
countLowerAverage sublists refList = 
    let refAvg = average refList
    in length [sublist | sublist <- sublists, average sublist < refAvg]

main = do 
    print(countLowerAverage [[1, 2, 3], [4, 5, 6], [7, 8, 9]] [2, 3, 4]) -- 1
    print(countLowerAverage [[10, 20], [5, 5, 5], [30, 40, 50]] [5, 5, 5, 10, 0]) -- 0
    print(countLowerAverage [[2, 4, 6], [3, 5, 7], [5, 10, 15]] [10, 20, 30]) -- 3
    print(countLowerAverage [[1, 1, 1], [2, 2, 2, 6, 10], [3, 3, 3]] [5, 5, 5, 1]) -- 2