{-# LANGUAGE CPP #-}
-- Parse UTF8 strings
module Data.Text.Parse.UTF8 where

import Control.Monad
#if MIN_VERSION_base(4,9,0)
import qualified Control.Monad.Fail as Fail
#endif


-- TODO move to private module?
data ParseStatus = Done | NeedMore | Error

{- TODO
   Inspired by the Get monad, hope is that similar operations can be used on
   UTF8 strings instead of binary data -}

data Parse a = P a -- TODO

{- Need instances for monad composition, plus representation for partial
   parsing -}

