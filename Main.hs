module Main (main) where

import CustomHashMap

main :: IO ()
main = do
  let hashMap = [[],[],[],[]]
  let hashMap' = insertOrUpdateHashMapKey hashMap "hello" 4
  let hashMap'' = insertOrUpdateHashMapKey hashMap' "bye" 6
  let hashMap''' = removeHashMapKey hashMap'' "hello"
  print $ show (hashMap''' :: HashMap String Int)