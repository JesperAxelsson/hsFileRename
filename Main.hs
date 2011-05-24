module Main where

import DirectoryListing
import FileRename

import Text.Regex(subRegex,mkRegex)
substitute x y s = subRegex (mkRegex x) s y

renameFile files regFrom regTo = "foo"

testRegex files regFrom regTo = files
main = testShite
