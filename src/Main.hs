module Main where

import System.Environment
import System.Exit

import Basic.Status
import Parser
import Parser.Lexer

main = getArgs >>= args >>= print . agave
 
agave :: String -> [(Token, Loc)]
agave  = tokenize

args ["-h"] = usage   >> exit
args ["-v"] = version >> exit
args []     = getContents
args fs     = concat `fmap` mapM readFile fs

usage   = putStrLn "Usage: agave [-vh] [file ..]"
version = putStrLn "agave 0.1"
exit    = exitWith ExitSuccess
die     = exitWith (ExitFailure 1)

