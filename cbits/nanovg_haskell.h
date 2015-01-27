
#ifndef NANOVG_HASKELL_H
#define NANOVG_HASKELL_H

#include <GL/gl.h>
#include <GL/glu.h>
#include "nanovg.h"

typedef enum NVGwinding NVGwinding;
typedef enum NVGsolidity NVGsolidity;
typedef enum NVGlineCap NVGlineCap;
typedef enum NVGalign NVGalign;

NVGcontext* _nvgCreateGL3(int flags);

void _nvgStrokeColor(NVGcontext* ctx, NVGcolor* color);
void _nvgStrokePaint(NVGcontext* ctx, NVGpaint* paint);
void _nvgFillColor(NVGcontext* ctx, NVGcolor* color);
void _nvgFillPaint(NVGcontext* ctx, NVGpaint* paint);

#endif
