module DirectoryListing where

import System.Directory
import System.IO

--showPath :: FilePath -> String
showPath s = s

data FileInfo = FileInfo { path :: String, name :: String, ext :: String }


main = do 
    putStrLn "Hello Directory"
    cur <- getCurrentDirectory
    paths <- getDirectoryContents cur
    mapM_ putStrLn paths
    return ()
