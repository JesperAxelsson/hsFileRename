module Main where

import DirectoryListing
import FileRename

regx = "([0-9]+)[^0-9]+([0-9]+)"  

main = do
    files <- getFiles ""
    mapM_ putStrLn $ map (renameFile regx "\\2 \\1") (filterExt ".txt" files)
    
