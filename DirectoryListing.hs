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


classifyDirContent :: [FilePath] -> IO [FileType]
classifyDirContent content = mapM classify content
                             

classify :: FilePath -> IO FileType
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
    cont <- classifyDirContent $ removeFakeDirs paths
    mapM_ (putStrLn . show)  cont
    return ()


cur = getCurrentDirectory


