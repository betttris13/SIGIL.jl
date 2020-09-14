function __init__()
    cxx""" #include<iostream> """
    if Sys.islinux()
        Libdl.dlopen(joinpath(dirname(pathof(SIGIL)), "include/Linux/libsigil.so"), Libdl.RTLD_GLOBAL)
        cxx""" #include "include/Linux/sl.h" """
    elseif Sys.iswindows()
        Libdl.dlopen(joinpath(dirname(pathof(SIGIL)), "include/Windows/libsigil.dll"), Libdl.RTLD_GLOBAL)
        cxx""" #include "include/Windows/sl.h" """
    end
end

# Initialization commands
function slWindow(width::Int, height::Int, title::String, fullScreen::Int)
    if WINDOW_OPEN == false
        @cxx slWindow(width, height, pointer(title), fullScreen)
        global WINDOW_OPEN = true
    else
        error("slWindow() cannot be called when a window already exists")
    end
    return nothing
end

function slShowCursor(showCursor::Int)
    @cxx slShowCursor(showCursor)
end

function slClose()
    if WINDOW_OPEN == true
        @cxx slClose()
        global WINDOW_OPEN = false
    else
        error("slClose() cannot be called because no window exists")
    end
    return nothing
end

function slShouldClose()
    if WINDOW_OPEN == true
        @cxx slShouldClose()
    else
        error("slShouldClose() cannot be called because no window exists")
    end
    return nothing
end


# Simple input
function slGetKey(key::Int)
    @cxx slGetKey(key)
end

function slGetMouseButton(button::Int)
    @cxx slGetMouseButton(button)
end

function slGetMouseX()
    @cxx slGetMouseX()
end

function slGetMouseY()
    @cxx slGetMouseY()
end

# Simple frame timing
function slGetDeltaTime()
    @cxx slGetDeltaTime()
end

function slGetTime()
    @cxx slGetTime()
end

# Rendering commands
function slRender()
    @cxx slRender()
end

# Color control
function slSetBackColor(red::Real, green::Real, blue::Real)
    @cxx slSetBackColor(red, green, blue)
end

function slSetForeColor(red::Real, green::Real, blue::Real, alpha::Real)
    @cxx slSetForeColor(red, green, blue, alpha)
end

# Blending control
function slSetAdditiveBlend(additiveBlend::Int)
    @cxx slSetAdditiveBlend(additiveBlend)
end

# Transformations
function slPush()
    @cxx slPush()
end

function slPop()
    @cxx slPop()
end

function slTranslate(x::Real, y::Real)
    @cxx slTranslate(x, y)
end

function slRotate(degrees::Real)
    @cxx slRotate(degrees)
end

function slScale(x::Real, y::Real)
    @cxx slScale(x, y)
end

# Texture loading
function slLoadTexture(filename::String)
    if WINDOW_OPEN == true
        @cxx slLoadTexture(pointer(filename))
    else
        error("slLoadTexture() cannot be called before slWindow() is called")
    end
    return nothing
end

# Sound loading and playing
function slLoadWAV(filename::String)
    if WINDOW_OPEN == true
        @cxx slLoadWAV(pointer(filename))
    else
        error("slLoadWAV() cannot be called before slWindow() is called")
    end
    return nothing
end

function slSoundPlay(sound::Int)
    @cxx slSoundPlay(sound)
end

function slSoundLoop(sound::Int)
    @cxx slSoundLoop(sound)
end

function slSoundPause(sound::Int)
    @cxx slSoundPause(sound)
end

function slSoundStop(sound::Int)
    @cxx slSoundStop(sound)
end

function slSoundPauseAll()
    @cxx slSoundPauseAll()
end

function slSoundResumeAll()
    @cxx slSoundResumeAll()
end

function slSoundStopAll()
    @cxx slSoundStopAll()
end

function slSoundPlaying(sound::Int)
    @cxx slSoundPlaying(sound)
end

function slSoundLooping(sound::Int)
    @cxx slSoundLooping(sound)
end

# Simple shape commands
function slTriangleFill(x::Real, y::Real, width::Real, height::Real)
    @cxx slTriangleFill(x, y, width, height)
end

function slTriangleOutline(x::Real, y::Real, width::Real, height::Real)
    @cxx slTriangleOutline(x, y, width, height)
end

function slRectangleFill(x::Real, y::Real, width::Real, height::Real)
    @cxx slRectangleFill(x, y, width, height)
end

function slRectangleOutline(x::Real, y::Real, width::Real, height::Real)
    @cxx slRectangleOutline(x, y, width, height)
end

function slCircleFill(x::Real, y::Real, radius::Real, numVertices::Int)
    @cxx slCircleFill(x, y, radius, numVertices)
end

function slCircleOutline(x::Real, y::Real, radius::Real, numVertices::Int)
    @cxx slCircleOutline(x, y, radius, numVertices)
end

function slSemiCircleFill(x::Real, y::Real, radius::Real, numVertices::Int, degrees::Real)
    @cxx slSemiCircleFill(x, y, radius, numVertices, degrees)
end

function slSemiCircleOutline(x::Real, y::Real, radius::Real, numVertices::Int, degrees::Real)
    @cxx slSemiCircleOutline(x, y, radius, numVertices, degrees)
end

function slPoint(x::Real, y::Real)
    @cxx slPoint(x, y)
end

function slLine(x1::Real, y1::Real, x2::Real, y2::Real)
    @cxx slLine(x1, y1, x2, y2)
end

function slSetSpriteTiling(x::Real, y::Real)
    @cxx slSetSpriteTiling(x, y)
end

function slSetSpriteScroll(x::Real, y::Real)
    @cxx slSetSpriteScroll(x, y)
end

function slSprite(texture::Int, x::Real, y::Real, width::Real, height::Real)
    @cxx slSprite(texture, x, y, width, height)
end

# Text commands
function slSetTextAlign(fontAlign::Int)
    if fontAlign >= 0 && fontAlign <= 2
        @cxx slSetTextAlign(fontAlign)
    else
        error("slSetTextAlign() only accepts SL_ALIGN_CENTER, SL_ALIGN_RIGHT, or SL_ALIGN_LEFT")
    end
    return nothing
end

function slGetTextWidth(text::String)
    @cxx slGetTextWidth(pointer(text))
end

function slGetTextHeight(text::String)
    @cxx slGetTextHeight(pointer(text))
end

function slLoadFont(fontFilename::String)
    if WINDOW_OPEN == true
        @cxx slLoadFont(pointer(fontFilename))
    else
        error("slLoadFont() cannot be called before slWindow() is called")
    end
    return nothing
end

function slSetFont(font::Int, fontSize::Int)
    if WINDOW_OPEN == true
        @cxx slSetFont(font, fontSize)
    else
        error("slSetFont() cannot be called before slWindow() is called")
    end
    return nothing
end

function slSetFontSize(fontSize::Int)
    @cxx slSetFontSize(fontSize)
end

function slText(x::Real, y::Real, text::String)
    @cxx slText(x, y, pointer(text))
end
