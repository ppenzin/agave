module Basic.Status where

data Loc = L { lineLoc :: Int, colLoc :: Int, lenLoc :: Int } deriving Show

data Pos = P { linePos :: Int, colPos :: Int } deriving Show

