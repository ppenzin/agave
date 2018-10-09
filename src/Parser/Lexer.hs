module Parser.Lexer(Token, tokenize) where

import Data.Int
import Basic.Status

data Token =
    Num Int
  | Id String
  | DEFINE
  | FUNCTION
  | RETURNS
  | END
  deriving Show

-- Tokenize input
tokenize :: String -> [(Token, Loc)]
tokenize s = tokenize_ (P {linePos=1, colPos=1} ) s

-- Same with start position
tokenize_ :: Pos -> String -> [(Token, Loc)]
tokenize_ p s = (t, l):ts
  where (t, len) = recognize s
        l = L {lineLoc=linePos p, colLoc=colPos p, lenLoc=len}
        line = linePos p + len
        col = colPos p
        ts = tokenize_ (P {linePos=line, colPos=col}) (drop len s)

-- Recognize a single token (return length as well)
recognize :: String -> (Token, Int)
recognize "define" = (DEFINE, 6)
recognize _ = error "FIXME"
