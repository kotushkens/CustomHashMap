module Main (main) where

import CustomHashMap

main :: IO ()
main = do
  let hashMap = [[],[],[],[]]
  let anotherTypeHashMap = [[],[],[]]
  let hashMap' = insertOrUpdateHashMapKey hashMap "hello" 4
  let hashMap'' = insertOrUpdateHashMapKey hashMap' "bye" 6
  let hashMap''' = removeHashMapKey hashMap'' "hello"
  let searched = lookupHashMapKey hashMap''' "bye"
  let anotherTypeHashMap' = insertOrUpdateHashMapKey anotherTypeHashMap 0.1 221
  print $ show (hashMap''' :: HashMap String Int)
  print $ show (searched :: Maybe Int)
  print $ show (anotherTypeHashMap' :: HashMap Double Int)