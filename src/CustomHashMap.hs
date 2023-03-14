module CustomHashMap
  (
  HashMap,
  insertOrUpdateHashMapKey,
  removeHashMapKey
  )
where

import Data.Char
import Data.Hashable

type HashMap a b = [Bucket a b]
type Bucket a b = [(a,b)]

removeHashMapKey :: (Eq a ) => (Hashable a) => HashMap a b -> a -> HashMap a b
removeHashMapKey hashMap key = hashMap'
  where
    hashMap' = left ++ [bucket'] ++ right
    bucket' = filter (\(existingKey,_) -> existingKey /= key) bucket
    (left, removed:right) = splitAt index hashMap
    bucket = hashMap !! index
    index = getHashMapIndexFromHash hashMap key

insertOrUpdateHashMapKey :: (Eq a ) => (Hashable a) => HashMap a b -> a -> b -> HashMap a b
insertOrUpdateHashMapKey hashMap key value = hashMap'
  where
    hashMap' = case bucket of
                [] -> insertOrUpdateList hashMap index [(key,value)]
                xs -> insertOrUpdateList hashMap index ((key,value):xs)
    bucket = hashMap !! index
    index = getHashMapIndexFromHash hashMap key

insertOrUpdateList :: (Eq a ) => (Hashable a) => HashMap a b -> Int -> Bucket a b -> HashMap a b
insertOrUpdateList hashMap index (element@(key',value'):xs) = hashMap'
  where
    hashMap' = left ++ [bucket'] ++ right
    bucket' = element:uniqueKeys
    uniqueKeys = filter (\(key,_) -> key /= key') xs
    (left, removed:right) = splitAt index hashMap

--lookupHashMapKey :: HashMap a b -> a -> Maybe a
--lookupHashMapKey hashMap key = value
--  where
--    value = case bucket of
--              [] -> Nothing
--              xs -> Just $ findElementInBucket key xs
--    bucket = hashMap !! index
--    index = getHashMapIndexFromHash hashMap key

getHashMapIndexFromHash :: (Hashable a) => HashMap a b -> a -> Int
getHashMapIndexFromHash hashMap key = hash key `mod` length hashMap

--findElementInBucket :: b -> Bucket a b -> a
--findElementInBucket searchKey xs = value
--  where
--    (key,value) = head $ filter (\(bucketKey,value) -> bucketKey == searchKey) xs
