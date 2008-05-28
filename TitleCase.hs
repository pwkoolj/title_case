module TitleCase (title_case) where
import Char
import List

enumerate list = zip [0..length list] list
lower string = [toLower c | c <- string]

{- L!!i is same as python's L[i] -}
small = words "a an and as at but by en for if in of on or the to v. via vs. v vs"

title word | (notElem '.' (drop 2 (reverse word))) && isAllLower 
           = [if p==firstNonPunc then toUpper c else c | (p,c) <- enumerate word]
           | otherwise = word
           where {-firstNonPunc = head [p|(p,c) <- enumerate word, isAlphaNum c]-}
                 firstNonPunc = head (findIndices isAlphaNum word)
                 isAllLower = lower (tail word) == tail word

title_test pair | elem (lower word) small
                = if head (reverse prev) == ':' then title word 
                                                else lower word 
                | otherwise = title word
                  where word = fst pair
                        prev = snd pair

title_case title_string = unwords [if elem pos pos_r
                                   then title_test (word, test pos)
                                   else title word | (pos,word) <- word_list]
    where word_list = enumerate(words title_string)
          pos_r = [1.. (length word_list) - 2] 
          test p = if p > 0 then snd(word_list!!(p-1)) else ""