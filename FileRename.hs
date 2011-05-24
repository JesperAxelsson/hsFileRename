module FileRename where

import Text.Regex(subRegex,mkRegex)
import System.FilePath
import System.Directory as Dir

regx = "([0-9]+)[^0-9]+([0-9]+)"  
tstFile =  "foo_123_456.txt"

regRenameFile from to s = Dir.renameFile s (regReplaceBaseName from to s)

regReplaceBaseName from to s = (replaceBaseName s newName)
    where baseName = takeBaseName s
          newName = (substitute from to baseName)

substitute from to s = makeValid $ (subRegex (mkRegex from) s to)

filterExt ext files = filter (\f -> takeExtension f == ext) files

