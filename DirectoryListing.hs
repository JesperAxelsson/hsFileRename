module DirectoryListing where

import System.Directory

--data FileInfo = FileInfo { path :: String, name :: String, ext :: String }
--    deriving (Show)

--instance Show FileInfo where
--    show inf = (path inf) ++ (name inf) ++ (ext inf)

data FileType = Directory FilePath
              | File FilePath
        deriving(Show)

class Get a where
    get :: a -> String

instance Get FileType where
    get (File a) = a
    get (Directory a) = a    
    

isFile (File a) = True
isFile _ = False

isDirectory a = not $ isFile a

--getExt :: FilePath -> String    
--getExt s = reverse $ takeWhile (\s -> s /= '.') (reverse s)

--getName :: FilePath -> String
--getName path = reverse $ dropWhile (\s -> s /= '.') (reverse path)

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


filterFile = filter isFile 
filterDirectory = filter isDirectory 
        

getFiles path = do
    paths <- getDirectoryContents path
    cont <- classifyDirContent $ removeFakeDirs paths
    return $ map get $ filterFile cont

getDirectories path = do
    paths <- getDirectoryContents path
    cont <- classifyDirContent $ removeFakeDirs paths
    return $ map get $ filterDirectory cont

testShite = do 
    putStrLn "* Hello Directory *"
    cur <- getCurrentDirectory
    paths <-  getDirectoryContents cur
    cont <- classifyDirContent $ removeFakeDirs paths
    mapM_ (putStrLn . show)  cont
    return ()


cur = getCurrentDirectory 

