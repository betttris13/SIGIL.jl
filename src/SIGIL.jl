## TODO
# Fix directory to defult to file location

module SIGIL

using Cxx
using Libdl

WINDOW_OPEN = false
include("SIGIL_CORE.jl")

export
# main functions
    slWindow,
    slShowCursor,
    slClose,
    slShouldClose,
    slGetKey,
    slGetMouseButton,
    slGetMouseX,
    slGetMouseY,
    slGetDeltaTime,
    slGetTime,
    slRender,
    slSetBackColor,
    slSetForeColor,
    slSetAdditiveBlend,
    slPush,
    slPop,
    slTranslate,
    slRotate,
    slScale,
    slLoadTexture,
    slLoadWAV,
    slSoundPlay,
    slSoundLoop,
    slSoundPause,
    slSoundStop,
    slSoundPauseAll,
    slSoundResumeAll,
    slSoundStopAll,
    slSoundPlaying,
    slSoundLooping,
    slTriangleFill,
    slTriangleOutline,
    slRectangleFill,
    slRectangleOutline,
    slCircleFill,
    slCircleOutline,
    slSemiCircleFill,
    slSemiCircleOutline,
    slPoint,
    slLine,
    slSetSpriteTiling,
    slSetSpriteScroll,
    slSprite,
    slSetTextAlign,
    slGetTextWidth,
    slGetTextHeight,
    slLoadFont,
    slSetFont,
    slSetFontSize,
    slText

end # module
