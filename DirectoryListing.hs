module DirectoryListing where

import System.Directory
--import System.IO
--import Text.Regex.Posix
import System.FilePath
import Text.Regex(subRegex,mkRegex)
substitute x y s = subRegex (mkRegex x) s y


--showPath :: FilePath -> String
showPath s = s

data FileInfo = FileInfo { path :: String, name :: String, ext :: String }
--    deriving (Show)

data FileType = Directory FilePath
              | File FilePath
        deriving(Show)

instance Show FileInfo where
    show inf = (path inf) ++ (name inf) ++ (ext inf)

isFile (File a) = True
isFile _ = False

isDirectory a = not $ isFile a


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

filterFile = filter isFile 
        

renameFile files regFrom regTo = "foo"

testRegex files regFrom regTo = files

main = do 
    putStrLn "* Hello Directory *"
    cur <- getCurrentDirectory
    paths <-  getDirectoryContents cur
    cont <- classifyDirContent $ removeFakeDirs paths
    mapM_ (putStrLn . show)  cont
    return ()


cur = getCurrentDirectory

tstFile = dropExtension "foo_123_456.txt"

