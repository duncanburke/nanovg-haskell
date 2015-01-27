
/* cabal doesn't use "cpp-options" when compiling a .c,
	 for some reason. So we set the DEFINEs inline.
 */

#define NDEBUG
#define NANOVG_GL3_IMPLEMENTATION
#define GL_GLEXT_PROTOTYPES

#include "nanovg_haskell.h"
#include "nanovg_gl.h"

#include <string.h>

NVGcontext* _nvgCreateGL3(int flags){
	return nvgCreateGL3(flags);
}

void _nvgStrokeColor(NVGcontext* ctx, NVGcolor* color){
	return nvgStrokeColor(ctx, *color);
}

void _nvgStrokePaint(NVGcontext* ctx, NVGpaint* paint){
	return nvgStrokePaint(ctx, *paint);
}

void _nvgFillColor(NVGcontext* ctx, NVGcolor* color){
	return nvgFillColor(ctx, *color);
}

void _nvgFillPaint(NVGcontext* ctx, NVGpaint* paint){
	return nvgFillPaint(ctx, *paint);
}
