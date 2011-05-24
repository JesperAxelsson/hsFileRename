module Main where

import DirectoryListing
import FileRename

--regx = "([0-9]+)[^0-9]+([0-9]+)"  

main = do
    files <- getFiles path
    let fFiles = (filterExt "png" files)
    mapM_ putStrLn files
--    mapM_ putStrLn  (regReplaceBaseName regx "\\1 \\2") fFiles
--    mapM_ (rename regx "\\2 \\1") (filterExt ".txt" files)
    
