{- Progress Task -}

{- Your neptun code : -}

{-
   Write a function countThrees that takes an integer `n` and returns the number of digit `3` in that given number.

   For example:
         countThrees 123 -> 1, because there is only one `3` in the number 123
         countThrees 7 -> 0, because there is no `3` in the number 7
         countThrees 413713 -> 2, because there are two `3`s in the number 413713
         countThrees 33333 -> 5, because there are five `3`s in the number 33333
-}

countThrees :: Int -> Int

{- Test Cases -}

-- main = print (countThrees 123)      -- 1
-- main = print (countThrees 7)        -- 0
-- main = print (countThrees 413713)   -- 2
-- main = print (countThrees 33333)    -- 5