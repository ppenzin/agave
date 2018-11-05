module Parser(parse) where

import Data.Text.Parse.UTF8
import Parser.Lexer
import Basic.Status

parse :: String -> [(Token, Loc)]
parse = tokenize
