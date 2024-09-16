## Basic types
```haskell
-- Int: Bounded, word-sized integers.
x :: Int
x = 42

-- Integer: Unbounded integers.
y :: Integer
y = 12345678901234567890

-- Float: Single-precision floating point numbers.
f :: Float
f = 3.14

-- Double: Double-precision floating point numbers.
d :: Double
d = 2.718281828459045

-- Char: Characters.
c :: Char
c = 'a'

-- String: Strings (which are lists of characters)
s :: String
s = "Hello, Haskell!"
 
-- Bool: Boolean values (True or False)
b :: Bool
b = True

-- (): The unit type, which has only one value, ()
u :: ()
u = ()

-- [a]: Lists of elements of type a.
list :: [Int]
list = [1, 2, 3, 4, 5]

-- (a, b): Tuples of two elements.
tuple :: (Int, String)
tuple = (1, "one")

-- Maybe a: Optional values, which can be Just a or Nothing
maybeValue :: Maybe Int
maybeValue = Just 10

-- Either a b: Represents a value of one of two possible types (a sum type).
eitherValue :: Either String Int
eitherValue = Right 42
```

Check the type of a element.
```bash
ghci> :type 32
32 :: Num a => a
```
Check the info / op of a type
```bash
ghci> :info Integer
type Integer :: *
data Integer
  = GHC.Num.Integer.IS GHC.Prim.Int#
  | GHC.Num.Integer.IP GHC.Prim.ByteArray#
  | GHC.Num.Integer.IN GHC.Prim.ByteArray#
        -- Defined in ‘GHC.Num.Integer’
instance Read Integer -- Defined in ‘GHC.Read’
instance Enum Integer -- Defined in ‘GHC.Enum’
instance Integral Integer -- Defined in ‘GHC.Real’
instance Num Integer -- Defined in ‘GHC.Num’
instance Real Integer -- Defined in ‘GHC.Real’
instance Show Integer -- Defined in ‘GHC.Show’
instance Eq Integer -- Defined in ‘GHC.Num.Integer’
instance Ord Integer -- Defined in ‘GHC.Num.Integer’r
```
## Elementary functions
```haskell
-- 1. Addition
-- Function: + Example:
add :: Int -> Int -> Int
add x y = x + y

main = print (add 3 5)  -- Output: 8

-- 2. Subtraction
-- Function: - Example:
subtract :: Int -> Int -> Int
subtract x y = x - y

main = print (subtract 10 4)  -- Output: 6

-- 3. Multiplication
-- Function: * Example:
multiply :: Int -> Int -> Int
multiply x y = x * y

main = print (multiply 3 4)  -- Output: 12

-- 4. Division
-- Function: / Example:
divide :: Float -> Float -> Float
divide x y = x / y

main = print (divide 10.0 2.0)  -- Output: 5.0

-- 5. Modulus
-- Function: mod Example:
modulus :: Int -> Int -> Int
modulus x y = x `mod` y

main = print (modulus 10 3)  -- Output: 1

-- 6. Exponentiation
-- Function: ^ Example:
power :: Int -> Int -> Int
power x y = x ^ y

main = print (power 2 3)  -- Output: 8

-- 7. Logical AND
-- Function: && Example:
logicalAnd :: Bool -> Bool -> Bool
logicalAnd x y = x && y

main = print (logicalAnd True False)  -- Output: False

-- 8. Logical OR
-- Function: || Example:
logicalOr :: Bool -> Bool -> Bool
logicalOr x y = x || y

main = print (logicalOr True False)  -- Output: True

-- 9. Equality
-- Function: == Example:
isEqual :: Int -> Int -> Bool
isEqual x y = x == y

main = print (isEqual 5 5)  -- Output: True

-- 10. Inequality
-- Function: /= Example:
isNotEqual :: Int -> Int -> Bool
isNotEqual x y = x /= y

main = print (isNotEqual 5 3)  -- Output: True
```

## Recommended resources

- [Learn you a Haskell](http://learnyouahaskell.com/chapters)
- [Haskell wiki](https://en.wikibooks.org/wiki/Haskell)
- [Functional programming at ELTE](http://lambda.inf.elte.hu/Index_en.xml)