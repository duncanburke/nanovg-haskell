{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE EmptyDataDecls #-}

module Graphics.Rendering.NanoVG.Types where

#include "nanovg_haskell.h"

import Data.Functor ((<$>))
import Data.Int
import Data.Word
import Foreign.C.String
import Foreign.C.Types
import Foreign.Marshal.Array
import Foreign.Ptr
import Foreign.Storable

#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

data CreateFlags =
  CreateFlags {
    antialias :: !Bool,
    stencilStrokes :: !Bool,
    debug :: !Bool}
  deriving (Eq, Show)

data Context

newtype Image = Image CInt deriving (Eq, Show)

data Color =
  Color {
    red :: !CFloat,
    green :: !CFloat,
    blue :: !CFloat,
    alpha :: !CFloat}
  deriving (Eq, Show)

instance Storable Color where
  sizeOf _ = (#size NVGcolor)
  alignment _ = (#alignment NVGcolor)
  peek ptr = do
    r' <- (#peek NVGcolor, r) ptr
    g' <- (#peek NVGcolor, g) ptr
    b' <- (#peek NVGcolor, b) ptr
    a' <- (#peek NVGcolor, a) ptr
    return $! Color r' g' b' a'
  poke ptr (Color r' g' b' a') = do
    (#poke NVGcolor, r) ptr r'
    (#poke NVGcolor, g) ptr g'
    (#poke NVGcolor, b) ptr b'
    (#poke NVGcolor, a) ptr a'

data Paint =
  Paint {
    xform0 :: !CFloat,
    xform1 :: !CFloat,
    xform2 :: !CFloat,
    xform3 :: !CFloat,
    xform4 :: !CFloat,
    xform5 :: !CFloat,
    radius :: !CFloat,
    feather :: !CFloat,
    innerColor :: !Color,
    outerColor :: !Color,
    image :: !Image}
  deriving (Eq, Show)

instance Storable Paint where
  sizeOf _ = (#size NVGpaint)
  alignment = sizeOf
  peek ptr = do
    xform0' <- (#peek NVGpaint, xform[0]) ptr
    xform1' <- (#peek NVGpaint, xform[1]) ptr
    xform2' <- (#peek NVGpaint, xform[2]) ptr
    xform3' <- (#peek NVGpaint, xform[3]) ptr
    xform4' <- (#peek NVGpaint, xform[4]) ptr
    xform5' <- (#peek NVGpaint, xform[5]) ptr
    radius' <- (#peek NVGpaint, radius) ptr
    feather' <- (#peek NVGpaint, feather) ptr
    innerColor' <- (#peek NVGpaint, innerColor) ptr
    outerColor' <- (#peek NVGpaint, outerColor) ptr
    image' <- Image <$> (#peek NVGpaint, image) ptr
    return $! Paint xform0' xform1' xform2' xform3' xform4' xform5' radius' feather' innerColor' outerColor' image'
  poke ptr (Paint xform0' xform1' xform2' xform3' xform4' xform5' radius' feather' innerColor' outerColor' (Image image')) = do
    (#poke NVGpaint, xform[0]) ptr xform0'
    (#poke NVGpaint, xform[1]) ptr xform1'
    (#poke NVGpaint, xform[2]) ptr xform2'
    (#poke NVGpaint, xform[3]) ptr xform3'
    (#poke NVGpaint, xform[4]) ptr xform4'
    (#poke NVGpaint, xform[5]) ptr xform5'
    (#poke NVGpaint, radius) ptr radius'
    (#poke NVGpaint, feather) ptr feather'
    (#poke NVGpaint, innerColor) ptr innerColor'
    (#poke NVGpaint, outerColor) ptr outerColor'
    (#poke NVGpaint, image) ptr image'

type Winding = (#type NVGwinding)
pattern CounterClockwise = (#const NVG_CCW) :: Winding
pattern Clockwise = (#const NVG_CW) :: Winding

type Solidity = (#type NVGsolidity)
pattern Solid = (#const NVG_SOLID) :: Solidity
pattern Hole = (#const NVG_HOLE) :: Solidity


type LineCap = (#type NVGlineCap)
pattern ButtCap = (#const NVG_BUTT) :: LineCap
pattern RoundCap = (#const NVG_ROUND) :: LineCap
pattern SquareCap = (#const NVG_SQUARE) :: LineCap

type LineJoin = (#type NVGlineCap)
pattern MiterJoin = (#const NVG_MITER) :: LineCap
pattern RoundJoin = (#const NVG_ROUND) :: LineCap
pattern BevelJoin = (#const NVG_BEVEL) :: LineCap


data HAlign =
  AlignLeft |
  AlignCenter |
  AlignRight
  deriving (Eq, Show)

data VAlign =
  AlignTop |
  AlignMiddle |
  AlignBottom |
  AlignBaseline
  deriving (Eq, Show)

data Align = Align HAlign VAlign deriving (Eq, Show)

instance Storable Align where
  sizeOf _ = (#size NVGalign)
  alignment = sizeOf
  peek ptr = undefined
  poke ptr = undefined

data GlyphPosition

data TextRow

data ImageFlags
