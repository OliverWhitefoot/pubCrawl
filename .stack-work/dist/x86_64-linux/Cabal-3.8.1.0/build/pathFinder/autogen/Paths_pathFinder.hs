{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_pathFinder (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/dcs/24/u5599048/pubCrawler/pathFinder/.stack-work/install/x86_64-linux/31194de76ce1a309f2305a1c5cb55601f8d8f07919e37fb9d97060b96de670b5/9.4.8/bin"
libdir     = "/dcs/24/u5599048/pubCrawler/pathFinder/.stack-work/install/x86_64-linux/31194de76ce1a309f2305a1c5cb55601f8d8f07919e37fb9d97060b96de670b5/9.4.8/lib/x86_64-linux-ghc-9.4.8/pathFinder-0.1.0.0-4fshTj7hHlVFS4a4H2FxcF-pathFinder"
dynlibdir  = "/dcs/24/u5599048/pubCrawler/pathFinder/.stack-work/install/x86_64-linux/31194de76ce1a309f2305a1c5cb55601f8d8f07919e37fb9d97060b96de670b5/9.4.8/lib/x86_64-linux-ghc-9.4.8"
datadir    = "/dcs/24/u5599048/pubCrawler/pathFinder/.stack-work/install/x86_64-linux/31194de76ce1a309f2305a1c5cb55601f8d8f07919e37fb9d97060b96de670b5/9.4.8/share/x86_64-linux-ghc-9.4.8/pathFinder-0.1.0.0"
libexecdir = "/dcs/24/u5599048/pubCrawler/pathFinder/.stack-work/install/x86_64-linux/31194de76ce1a309f2305a1c5cb55601f8d8f07919e37fb9d97060b96de670b5/9.4.8/libexec/x86_64-linux-ghc-9.4.8/pathFinder-0.1.0.0"
sysconfdir = "/dcs/24/u5599048/pubCrawler/pathFinder/.stack-work/install/x86_64-linux/31194de76ce1a309f2305a1c5cb55601f8d8f07919e37fb9d97060b96de670b5/9.4.8/etc"

getBinDir     = catchIO (getEnv "pathFinder_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "pathFinder_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "pathFinder_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "pathFinder_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pathFinder_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pathFinder_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
