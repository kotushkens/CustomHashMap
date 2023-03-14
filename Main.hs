module Main (main) where

import CustomHashMap

main :: IO ()
main = do
  let hm = [[],[],[],[]]
--  let hm2 = [[],[],[],[]]
--  insertKey 4 "hello"
  print (insertOrUpdateHashMapKey hm "hello" 4)
--  let h6 = removeHashMapKey hm "hello"
 -- print $ show (h6 :: HashMap Int)