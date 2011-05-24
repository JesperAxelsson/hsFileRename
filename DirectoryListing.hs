module DirectoryListing where

import System.Directory
import System.IO

--showPath :: FilePath -> String
showPath s = s

data FileInfo = FileInfo { path :: String, name :: String, ext :: String }
--    deriving (Show)

data FileType = Directory FilePath
              | File FilePath
        deriving(Show)

instance Show FileInfo where
    show inf = (path inf) ++ (name inf) ++ (ext inf)
    
getExt :: FilePath -> String    
getExt s = reverse $ takeWhile (\s -> s /= '.') (reverse s)

getName :: FilePath -> String
getName path = reverse $ dropWhile (\s -> s /= '.') (reverse path)


classifyDirContent content = map classify content

classify f = do
            doesF <- doesFileExist f 
            if doesF then return $ File f
            else do 
                doesD <- doesDirectoryExist f 
                return $ Directory f


removeFakeDirs = filter (\f -> f /= "." && f /= ".." && (head f) /= '.')

main = do 
    putStrLn "* Hello Directory *"
    cur <- getCurrentDirectory
    paths <-  getDirectoryContents cur
--    mapM_ putStrLn $ classifyDirContent $ removeFakeDirs paths
    return ()
