{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE EmptyDataDecls #-}

module Graphics.Rendering.NanoVG.Internal where

#include "nanovg_haskell.h"

import Data.Functor ((<$>))
import Data.Int
import Data.Word
import Foreign.C.String
import Foreign.C.Types
import Foreign.Marshal.Array
import Foreign.Ptr
import Foreign.Storable

import Graphics.Rendering.NanoVG.Types

foreign import ccall unsafe "nanovg_gl.h nvgCreateGL3" createGL3' :: CInt -> IO (Ptr Context)

foreign import ccall unsafe "nanovg.h nvgBeginFrame" beginFrame' :: Ptr Context -> CInt -> CInt -> CFloat -> IO ()
foreign import ccall unsafe "nanovg.h nvgCancelFrame" cancelFrame' :: Ptr Context -> IO ()
foreign import ccall unsafe "nanovg.h nvgEndFrame" endFrame' :: Ptr Context -> IO ()

foreign import ccall unsafe "nanovg.h nvgSave" save' :: Ptr Context -> IO ()
foreign import ccall unsafe "nanovg.h nvgRestore" restore' :: Ptr Context -> IO ()
foreign import ccall unsafe "nanovg.h nvgReset" reset' :: Ptr Context -> IO ()

foreign import ccall unsafe "nanovg.h _nvgStrokeColor" strokeColor' :: Ptr Context -> Ptr Color -> IO ()
foreign import ccall unsafe "nanovg.h _nvgStrokePaint" strokePaint' :: Ptr Context -> Ptr Paint -> IO ()
foreign import ccall unsafe "nanovg.h _nvgFillColor" fillColor' :: Ptr Context -> Ptr Color -> IO ()
foreign import ccall unsafe "nanovg.h _nvgFillPaint" fillPaint' :: Ptr Context -> Ptr Paint -> IO ()

foreign import ccall unsafe "nanovg.h nvgMiterLimit" miterLimit' :: Ptr Context -> CFloat -> IO ()
foreign import ccall unsafe "nanovg.h nvgStrokeWidth" strokeWidth' :: Ptr Context -> CFloat -> IO ()
foreign import ccall unsafe "nanovg.h nvgLineCap" lineCap' :: Ptr Context -> LineCap -> IO ()
foreign import ccall unsafe "nanovg.h nvgLineJoin" lineJoin' :: Ptr Context -> LineJoin -> IO ()
foreign import ccall unsafe "nanovg.h nvgGlobalAlpha" globalAlpha' :: Ptr Context -> CFloat -> IO ()

