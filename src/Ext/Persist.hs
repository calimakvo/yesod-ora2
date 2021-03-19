{-# LANGUAGE OverloadedStrings #-}

module Ext.Persist
  ( fullUpperCaseSettings
  )
where

import Data.Char
import qualified Data.Text as T
import Database.Persist.Quasi

fullUpperCaseSettings :: PersistSettings
fullUpperCaseSettings = PersistSettings
  { psToDBName =
    let go c
          | isUpper c = T.pack ['_', toUpper c]
          | otherwise = T.singleton (toUpper c)
    in T.dropWhile (=='_') . T.concatMap go
  , psStrictFields = True
  , psIdName = "ID"
  }
