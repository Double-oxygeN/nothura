# Copyright 2019 Double-oxygeN
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ====== Begin: Library loading configurations ======
# Only static link is supported now.
const
  headerGlfw = "<GLFW/glfw3.h>"

{.pragma: libglfw, importc, header: headerGlfw.}
{.deadCodeElim: on.}

when defined(windows):
  {.passL: "-lglfw3 -lgdi32".}

when defined(macosx):
  {.passL: "-lglfw3 -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo".}

else:
  {.passL: "-lglfw".}

# ====== End: Library loading configurations ======

# ====== Begin: GLFW type definitions ======
type
  carray*[T] = ptr UncheckedArray[T] # for convenience
  GlfwBool* {.size: sizeof(cint).} = enum
    glfwFalse = 0
    glfwTrue  = 1

  GlfwHat* {.size: sizeof(cuchar).} = enum
    glfwHatCentered = 0
    glfwHatUp = 1
    glfwHatRight = 2
    glfwHatRightUp = 3
    glfwHatDown = 4
    glfwHatRightDown = 6
    glfwHatLeft = 8
    glfwHatLeftUp = 9
    glfwHatLeftDown = 12

  GlfwKey* {.size: sizeof(cint).} = enum
    glfwKeyUnknown      = -1
    glfwKeySpace        = ' '
    glfwKeyApostrophe   = '\''
    glfwKeyComma        = ','
    glfwKeyMinus        = '-'
    glfwKeyPeriod       = '.'
    glfwKeySlash        = '/'
    glfwKey0            = '0'
    glfwKey1            = '1'
    glfwKey2            = '2'
    glfwKey3            = '3'
    glfwKey4            = '4'
    glfwKey5            = '5'
    glfwKey6            = '6'
    glfwKey7            = '7'
    glfwKey8            = '8'
    glfwKey9            = '9'
    glfwKeySemicolon    = ';'
    glfwKeyEqual        = '='
    glfwKeyA            = 'A'
    glfwKeyB            = 'B'
    glfwKeyC            = 'C'
    glfwKeyD            = 'D'
    glfwKeyE            = 'E'
    glfwKeyF            = 'F'
    glfwKeyG            = 'G'
    glfwKeyH            = 'H'
    glfwKeyI            = 'I'
    glfwKeyJ            = 'J'
    glfwKeyK            = 'K'
    glfwKeyL            = 'L'
    glfwKeyM            = 'M'
    glfwKeyN            = 'N'
    glfwKeyO            = 'O'
    glfwKeyP            = 'P'
    glfwKeyQ            = 'Q'
    glfwKeyR            = 'R'
    glfwKeyS            = 'S'
    glfwKeyT            = 'T'
    glfwKeyU            = 'U'
    glfwKeyV            = 'V'
    glfwKeyW            = 'W'
    glfwKeyX            = 'X'
    glfwKeyY            = 'Y'
    glfwKeyZ            = 'Z'
    glfwKeyLeftBracket  = '['
    glfwKeyBackslash    = '\\'
    glfwKeyRightBracket = ']'
    glfwKeyGraveAccent  = '`'
    glfwKeyWorld1       = 161
    glfwKeyWorld2       = 162
    glfwKeyEscape       = 256
    glfwKeyEnter        = 257
    glfwKeyTab          = 258
    glfwKeyBackspace    = 259
    glfwKeyInsert       = 260
    glfwKeyDelete       = 261
    glfwKeyRight        = 262
    glfwKeyLeft         = 263
    glfwKeyDown         = 264
    glfwKeyUp           = 265
    glfwKeyPageUp       = 266
    glfwKeyPageDown     = 267
    glfwKeyHome         = 268
    glfwKeyEnd          = 269
    glfwKeyCapsLock     = 280
    glfwKeyScrollLock   = 281
    glfwKeyNumLock      = 282
    glfwKeyPrintScreen  = 283
    glfwKeyPause        = 284
    glfwKeyF1           = 290
    glfwKeyF2           = 291
    glfwKeyF3           = 292
    glfwKeyF4           = 293
    glfwKeyF5           = 294
    glfwKeyF6           = 295
    glfwKeyF7           = 296
    glfwKeyF8           = 297
    glfwKeyF9           = 298
    glfwKeyF10          = 299
    glfwKeyF11          = 300
    glfwKeyF12          = 301
    glfwKeyF13          = 302
    glfwKeyF14          = 303
    glfwKeyF15          = 304
    glfwKeyF16          = 305
    glfwKeyF17          = 306
    glfwKeyF18          = 307
    glfwKeyF19          = 308
    glfwKeyF20          = 309
    glfwKeyF21          = 310
    glfwKeyF22          = 311
    glfwKeyF23          = 312
    glfwKeyF24          = 313
    glfwKeyF25          = 314
    glfwKeyKp0          = 320
    glfwKeyKp1          = 321
    glfwKeyKp2          = 322
    glfwKeyKp3          = 323
    glfwKeyKp4          = 324
    glfwKeyKp5          = 325
    glfwKeyKp6          = 326
    glfwKeyKp7          = 327
    glfwKeyKp8          = 328
    glfwKeyKp9          = 329
    glfwKeyKpDecimal    = 330
    glfwKeyKpDivide     = 331
    glfwKeyKpMultiply   = 332
    glfwKeyKpSubtract   = 333
    glfwKeyKpAdd        = 334
    glfwKeyKpEnter      = 335
    glfwKeyKpEqual      = 336
    glfwKeyLeftShift    = 340
    glfwKeyLeftControl  = 341
    glfwKeyLeftAlt      = 342
    glfwKeyLeftSuper    = 343
    glfwKeyRightShift   = 344
    glfwKeyRightControl = 345
    glfwKeyRightAlt     = 346
    glfwKeyRightSuper   = 347
    glfwKeyMenu         = 348

  GlfwModKey* {.size: sizeof(cint).} = enum
    glfwModShift
    glfwModControl
    glfwModAlt
    glfwModSuper
    glfwModCapsLock
    glfwModNumLock
  GlfwModKeys* = set[GlfwModKey]

  GlfwMouseButton* {.size: sizeof(cint).} = enum
    glfwMouseButton1 = 0
    glfwMouseButton2 = 1
    glfwMouseButton3 = 2
    glfwMouseButton4 = 3
    glfwMouseButton5 = 4
    glfwMouseButton6 = 5
    glfwMouseButton7 = 6
    glfwMouseButton8 = 7

  GlfwErrorCode* {.size: sizeof(cint).} = enum
    glfwNoError             = 0
    glfwNotInitialized      = 0x0001_0001
    glfwNoCurrentContext    = 0x0001_0002
    glfwInvalidEnum         = 0x0001_0003
    glfwInvalidValue        = 0x0001_0004
    glfwOutOfMemory         = 0x0001_0005
    glfwApiUnavailable      = 0x0001_0006
    glfwVersionUnavailable  = 0x0001_0007
    glfwPlatformError       = 0x0001_0008
    glfwPlatformUnavailable = 0x0001_0009
    glfwNoWindowContext     = 0x0001_000A

  GlfwWindowHint* {.size: sizeof(cint).} = enum
    glfwFocused                 = 0x0002_0001
    glfwIconified               = 0x0002_0002
    glfwResizable               = 0x0002_0003
    glfwVisible                 = 0x0002_0004
    glfwDecorated               = 0x0002_0005
    glfwAutoIconify             = 0x0002_0006
    glfwFloating                = 0x0002_0007
    glfwMaximized               = 0x0002_0008
    glfwCentorCursor            = 0x0002_0009
    glfwTransparentFramebuffer  = 0x0002_000A
    glfwHovered                 = 0x0002_000B
    glfwFocusOnShow             = 0x0002_000C
    glfwRedBits                 = 0x0002_1001
    glfwGreenBits               = 0x0002_1002
    glfwBlueBits                = 0x0002_1003
    glfwAlphaBits               = 0x0002_1004
    glfwDepthBits               = 0x0002_1005
    glfwStencilBits             = 0x0002_1006
    glfwAccumRedBits            = 0x0002_1007
    glfwAccumGreenBits          = 0x0002_1008
    glfwAccumBlueBits           = 0x0002_1009
    glfwAccumAlphaBits          = 0x0002_100A
    glfwAuxBuffers              = 0x0002_100B
    glfwStereo                  = 0x0002_100C
    glfwSamples                 = 0x0002_100D
    glfwSRGBCapable             = 0x0002_100E
    glfwRefreshRate             = 0x0002_100F
    glfwDoubleBuffer            = 0x0002_1010
    glfwClientApi               = 0x0002_2001
    glfwContextVersionMajor     = 0x0002_2002
    glfwContextVersionMinor     = 0x0002_2003
    glfwContextVersionRevision  = 0x0002_2004
    glfwContextRobustness       = 0x0002_2005
    glfwOpenglForwardCompat     = 0x0002_2006
    glfwOpenglDebugContext      = 0x0002_2007
    glfwOpenglProfile           = 0x0002_2008
    glfwContextReleaseBehavior  = 0x0002_2009
    glfwContextNoError          = 0x0002_200A
    glfwContextCreationApi      = 0x0002_200B
    glfwScaleToMonitor          = 0x0002_200C
    glfwCocoaRetinaFrameBuffer  = 0x0002_3001
    glfwCocoaFrameName          = 0x0002_3002
    glfwCocoaGraphicsSwitching  = 0x0002_3003
    glfwX11ClassName            = 0x0002_4001
    glfwX11InstanceName         = 0x0002_4002

  GlfwClientApi* {.size: sizeof(cint).} = enum
    glfwNoApi       = 0
    glfwOpenglApi   = 0x0003_0001
    glfwOpenglEsApi = 0x0003_0002

  GlfwRobustnessStrategy* {.size: sizeof(cint).} = enum
    glfwNoRobustness        = 0
    glfwNoResetNotification = 0x0003_1001
    glfwLoseContextOnReset  = 0x0003_1002

  GlfwOpenglProfile* {.size: sizeof(cint).} = enum
    glfwOpenglAnyProfile    = 0
    glfwOpenglCoreProfile   = 0x0003_2001
    glfwOpenglCompatProfile = 0x0003_2002

  GlfwInputMode* {.size: sizeof(cint).} = enum
    glfwCursor              = 0x0003_3001
    glfwStickyKeys          = 0x0003_3002
    glfwStickyMouseButtons  = 0x0003_3003
    glfwLockKeyMods         = 0x0003_3004
    glfwRawMouseMotion      = 0x0003_3005

  GlfwCursorShape* {.size: sizeof(cint).} = enum
    glfwArrowCursor     = 0x0003_6001
    glfwIBeamCursor     = 0x0003_6002
    glfwCrosshairCursor = 0x0003_6003
    glfwHandCursor      = 0x0003_6004
    glfwHResizeCursor   = 0x0003_6005
    glfwVResizeCursor   = 0x0003_6006

  GlfwDeviceEvent* {.size: sizeof(cint).} = enum
    glfwConnected     = 0x0004_0001
    glfwDisconnected  = 0x0004_0002

  GlfwInitHint* {.size: sizeof(cint).} = enum
    glfwJoystickHatButtons  = 0x0005_0001
    glfwCocoaChdirResources = 0x0005_1001
    glfwCocoaMenubar        = 0x0005_1002

  GlfwKeyAction* {.size: sizeof(cuchar).} = enum
    glfwRelease = 0
    glfwPress   = 1
    glfwRepeat  = 2

  GlfwJoystickId* = cint
  GlfwScancode* = cint

  GlfwGLProc* = (proc () {.cdecl.})
  GlfwMonitor* = distinct pointer
  GlfwWindow* = distinct pointer
  GlfwCursor* = distinct pointer
  GlfwErrorFun* = (proc (error: GlfwErrorCode; description: cstring) {.cdecl.})
  GlfwWindowPosFun* = (proc (window: GlfwWindow; xpos, ypos: cint) {.cdecl.})
  GlfwWindowSizeFun* = (proc (window: GlfwWindow; width, height: cint) {.cdecl.})
  GlfwWindowCloseFun* = (proc (window: GlfwWindow) {.cdecl.})
  GlfwWindowRefreshFun* = (proc (window: GlfwWindow) {.cdecl.})
  GlfwWindowFocusFun* = (proc (window: GlfwWindow; focused: GlfwBool) {.cdecl.})
  GlfwWindowIconifyFun* = (proc (window: GlfwWindow; iconified: GlfwBool) {.cdecl.})
  GlfwWindowMaximizeFun* = (proc (window: GlfwWindow; maximized: GlfwBool) {.cdecl.})
  GlfwFrameBufferSizeFun* = (proc (window: GlfwWindow; width, height: cint) {.cdecl.})
  GlfwWindowContentScaleFun* = (proc (window: GlfwWindow; xscale, yscale: cfloat) {.cdecl.})
  GlfwMouseButtonFun* = (proc (window: GlfwWindow; button: GlfwMouseButton; action: GlfwKeyAction; mods: GlfwModKeys) {.cdecl.})
  GlfwCursorPosFun* = (proc (window: GlfwWindow; xpos, ypos: cdouble) {.cdecl.})
  GlfwCursorEnterFun* = (proc (window: GlfwWindow; entered: GlfwBool) {.cdecl.})
  GlfwScrollFun* = (proc (window: GlfwWindow; xoffset, yoffset: cdouble) {.cdecl.})
  GlfwKeyFun* = (proc (window: GlfwWindow; key: GlfwKey; scancode: GlfwScancode; action: GlfwKeyAction; mods: GlfwModKeys) {.cdecl.})
  GlfwCharFun* = (proc (window: GlfwWindow; codepoint: cuint) {.cdecl.})
  GlfwCharModsFun* {.deprecated.} = (proc (window: GlfwWindow; codepoint: cuint; mods: GlfwModKeys) {.cdecl.})
  GlfwDropFun* = (proc (window: GlfwWindow; count: cint; paths: carray[cstring]) {.cdecl.})
  GlfwMonitorFun* = (proc (monitor: GlfwMonitor; event: GlfwDeviceEvent) {.cdecl.})
  GlfwJoystickFun* = (proc (jid: GlfwJoystickId; event: GlfwDeviceEvent) {.cdecl.})

  GLFWvidmode* {.libglfw, bycopy.} = object
    width*, height*: cint
    redBits*, greenBits*, blueBits*: cint
    refreshRate*: cint
  GlfwVidModePtr* = ptr GlfwVidMode

  GLFWgammaramp* {.libglfw, bycopy.} = object
    red*, green*, blue*: carray[cushort]
    size*: cuint
  GlfwGammaRampPtr* = ptr GlfwGammaRamp

  GLFWimage* {.libglfw, bycopy.} = object
    width*, height*: cint
    pixels*: carray[cuchar]

  GLFWgamepadstate* {.libglfw, bycopy.} = object
    buttons*: array[0..14, GlfwKeyAction]
    axes*: array[6, cfloat]
  GlfwGamepadStatePtr* = ptr GlfwGamepadState

const
  glfwMouseButtonLeft* = glfwMouseButton1
  glfwMouseButtonRight* = glfwMouseButton2
  glfwMouseButtonMiddle* = glfwMouseButton3

  glfwDontCare* = -1

converter toBool*(b: GlfwBool): bool = (b == glfwTrue)
converter toCint*(x: GlfwClientApi): cint = cint(x)
converter toCint*(x: GlfwRobustnessStrategy): cint = cint(x)
converter toCint*(x: GlfwOpenGLProfile): cint = cint(x)

proc isNil*(window: GlfwWindow): bool {.borrow.}
proc isNil*(window: GlfwMonitor): bool {.borrow.}
proc isNil*(window: GlfwCursor): bool {.borrow.}

# ====== End: GLFW type definitions ======

# ====== Begin: Procs ======
proc glfwInit*: GlfwBool {.libglfw, cdecl.}
proc glfwTerminate* {.libglfw, cdecl.}
proc glfwInitHint*(hint: GlfwInitHint; value: GlfwBool) {.libglfw, cdecl.}
proc glfwGetVersion*(major, minor, rev: ptr cint) {.libglfw, cdecl.}
proc glfwGetVersionString*: cstring {.libglfw, cdecl.}
proc glfwGetError*(description: ptr cstring): GlfwErrorCode {.libglfw, cdecl.}
proc glfwSetErrorCallback*(cbfun: GlfwErrorFun): GlfwErrorFun {.libglfw, cdecl.}

proc glfwGetMonitors*(count: ptr int): carray[GlfwMonitor] {.libglfw, cdecl.}
proc glfwGetPrimaryMonitor*: GlfwMonitor {.libglfw, cdecl.}
proc glfwGetMonitorPos*(monitor: GlfwMonitor; xpos, ypos: ptr cint) {.libglfw, cdecl.}
proc glfwGetMonitorWorkarea*(monitor: GlfwMonitor; xpos, ypos, width, height: ptr cint) {.libglfw, cdecl.}
proc glfwGetMonitorPhysicalSize*(monitor: GlfwMonitor; widthMM, heightMM: ptr cint) {.libglfw, cdecl.}
proc glfwGetMonitorContentScale*(monitor: GlfwMonitor; xscale, yscale: ptr cfloat) {.libglfw, cdecl.}
proc glfwGetMonitorName*(monitor: GlfwMonitor): cstring {.libglfw, cdecl.}
proc glfwSetMonitorUserPointer*(monitor: GlfwMonitor; p: pointer) {.libglfw, cdecl.}
proc glfwGetMonitorUserPointer*(monitor: GlfwMonitor): pointer {.libglfw, cdecl.}
proc glfwSetMonitorCallback*(cbfun: GlfwMonitorFun): GlfwMonitorFun {.libglfw, cdecl.}
proc glfwGetVideoModes*(monitor: GlfwMonitor; count: ptr cint): carray[GlfwVidMode] {.libglfw, cdecl.}
proc glfwGetVideoMode*(monitor: GlfwMonitor): GlfwVidModePtr {.libglfw, cdecl.}
proc glfwSetGamma*(monitor: GlfwMonitor; gamma: cfloat) {.libglfw, cdecl.}
proc glfwGetGammaRamp*(monitor: GlfwMonitor): GlfwGammaRampPtr {.libglfw, cdecl.}
proc glfwSetGammaRamp*(monitor: GlfwMonitor; ramp: GlfwGammaRampPtr) {.libglfw, cdecl.}

proc glfwDefaultWindowHints* {.libglfw, cdecl.}
proc glfwWindowHint*(hint: GlfwWindowHint; value: cint) {.libglfw, cdecl.}
proc glfwWindowHintString*(hint: GlfwWindowHint; value: cstring) {.libglfw, cdecl.}
proc glfwCreateWindow*(width, height: cint; title: cstring; monitor: GlfwMonitor; share: pointer): GlfwWindow {.libglfw, cdecl.}
proc glfwDestroyWindow*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwWindowShouldClose*(window: GlfwWindow): GlfwBool {.libglfw, cdecl.}
proc glfwSetWindowShouldClose*(window: GlfwWindow; value: GlfwBool) {.libglfw, cdecl.}
proc glfwSetWindowTitle*(window: GlfwWindow; title: cstring) {.libglfw, cdecl.}
proc glfwSetWindowIcon*(window: GlfwWindow; count: cint; images: carray[GlfwImage]) {.libglfw, cdecl.}
proc glfwGetWindowPos*(window: GlfwWindow; xpos, ypos: ptr cint) {.libglfw, cdecl.}
proc glfwSetWindowPos*(window: GlfwWindow; xpos, ypos: cint) {.libglfw, cdecl.}
proc glfwGetWindowSize*(window: GlfwWindow; width, height: ptr cint) {.libglfw, cdecl.}
proc glfwSetWindowSizeLimits*(window: GlfwWindow; minWidth, minHeight, maxWidth, maxHeight: cint) {.libglfw, cdecl.}
proc glfwSetWindowAspectRatio*(window: GlfwWindow; numer, denom: cint) {.libglfw, cdecl.}
proc glfwSetWindowSize*(window: GlfwWindow; width, height: cint) {.libglfw, cdecl.}
proc glfwGetFrameBufferSize*(window: GlfwWindow; width, height: ptr cint) {.libglfw, cdecl.}
proc glewGetWindowFrameSize*(window: GlfwWindow; left, top, right, bottom: ptr cint) {.libglfw, cdecl.}
proc glfwGetWindowContentScale*(window: GlfwWindow; xscale, yscale: ptr cint) {.libglfw, cdecl.}
proc glfwGetWindowOpacity*(window: GlfwWindow): cfloat {.libglfw, cdecl.}
proc glfwSetWindowOpacity*(window: GlfwWindow; opacity: cfloat) {.libglfw, cdecl.}
proc glfwIconifyWindow*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwRestoreWindow*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwMaximizeWindow*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwShowWindow*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwHideWindow*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwFocusWindow*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwRequestWindowAttention*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwGetWindowMonitor*(window: GlfwWindow): GlfwMonitor {.libglfw, cdecl.}
proc glfwSetWindowMonitor*(window: GlfwWindow; monitor: GlfwMonitor; xpos, ypos, width, height, refreshRate: cint) {.libglfw, cdecl.}
proc glfwGetWindowAttrib*(window: GlfwWindow; attrib: GlfwWindowHint): cint {.libglfw, cdecl.}
proc glfwSetWindowAttrib*(window: GlfwWindow; attrib: GlfwWindowHint; value: cint) {.libglfw, cdecl.}
proc glfwSetWindowUserPointer*(window: GlfwWindow; p: pointer) {.libglfw, cdecl.}
proc glfwGetWindowUserPointer*(window: GlfwWindow): pointer {.libglfw, cdecl.}
proc glfwSetWindowPosCallback*(window: GlfwWindow; cbfun: GlfwWindowPosFun): GlfwWindowPosFun {.libglfw, cdecl.}
proc glfwSetWindowSizeCallback*(window: GlfwWindow; cbfun: GlfwWindowSizeFun): GlfwWindowSizeFun {.libglfw, cdecl.}
proc glfwSetWindowCloseCallback*(window: GlfwWindow; cbfun: GlfwWindowCloseFun): GlfwWindowCloseFun {.libglfw, cdecl.}
proc glfwSetWindowRefreshCallback*(window: GlfwWindow; cbfun: GlfwWindowRefreshFun): GlfwWindowRefreshFun {.libglfw, cdecl.}
proc glfwSetWindowFocusCallback*(window: GlfwWindow; cbfun: GlfwWindowFocusFun): GlfwWindowFocusFun {.libglfw, cdecl.}
proc glfwSetWindowIconifyCallback*(window: GlfwWindow; cbfun: GlfwWindowIconifyFun): GlfwWindowIconifyFun {.libglfw, cdecl.}
proc glfwSetWindowMaximizeCallback*(window: GlfwWindow; cbfun: GlfwWindowMaximizeFun): GlfwWindowMaximizeFun {.libglfw, cdecl.}
proc glfwSetFramebufferSizeCallback*(window: GlfwWindow; cbfun: GlfwFrameBufferSizeFun): GlfwFrameBufferSizeFun {.libglfw, cdecl.}
proc glfwSetWindowContentScaleCallback*(window: GlfwWindow; cbfun: GlfwWindowContentScaleFun): GlfwWindowContentScaleFun {.libglfw, cdecl.}
proc glfwPollEvents* {.libglfw, cdecl.}
proc glfwWaitEvents* {.libglfw, cdecl.}
proc glfwWaitEventsTimeout*(timeout: cdouble) {.libglfw, cdecl.}
proc glfwPostEmptyEvent* {.libglfw, cdecl.}

proc glfwGetInputMode*(window: GlfwWindow; mode: GlfwInputMode): cint {.libglfw, cdecl.}
proc glfwSetInputMode*(window: GlfwWindow; mode: GlfwInputMode; value: cint) {.libglfw, cdecl.}
proc glfwRawMouseMotionSupported*: GlfwBool {.libglfw, cdecl.}
proc glfwGetKeyName*(key: GlfwKey, scancode: GlfwScancode): cstring {.libglfw, cdecl.}
proc glfwGetKeyScancode*(key: GlfwKey): GlfwScancode {.libglfw, cdecl.}
proc glfwGetKey*(window: GlfwWindow; key: GlfwKey): GlfwKeyAction {.libglfw, cdecl.}
proc glfwGetMouseButton*(window: GlfwWindow; button: GlfwMouseButton): GlfwKeyAction {.libglfw, cdecl.}
proc glfwGetCursorPos*(window: GlfwWindow; xpos, ypos: ptr cdouble) {.libglfw, cdecl.}
proc glfwSetCursorPos*(window: GlfwWindow; xpos, ypos: cdouble) {.libglfw, cdecl.}
proc glfwCreateCursor*(image: GlfwImage; xhot, yhot: cint): GlfwCursor {.libglfw, cdecl.}
proc glfwCreateStandardCursor*(shape: GlfwCursorShape): GlfwCursor {.libglfw, cdecl.}
proc glfwDestroyCursor*(cursor: GlfwCursor) {.libglfw, cdecl.}
proc glfwSetCursor*(window: GlfwWindow; cursor: GlfwCursor) {.libglfw, cdecl.}
proc glfwSetKeyCallback*(window: GlfwWindow; cbfun: GlfwKeyFun): GlfwKeyFun {.libglfw, cdecl.}
proc glfwSetCharCallback*(window: GlfwWindow; cbfun: GlfwCharFun): GlfwCharFun {.libglfw, cdecl.}
{.push warning[Deprecated]:off.}
proc glfwSetCharModsCallback*(window: GlfwWindow; cbfun: GlfwCharModsFun): GlfwCharModsFun {.libglfw, cdecl, deprecated.}
{.pop.}
proc glfwSetMouseButtonCallback*(window: GlfwWindow; cbfun: GlfwMouseButtonFun): GlfwMouseButtonFun {.libglfw, cdecl.}
proc glfwSetCursorPosCallback*(window: GlfwWindow; cbfun: GlfwCursorPosFun): GlfwCursorPosFun {.libglfw, cdecl.}
proc glfwSetCursorEnterCallback*(window: GlfwWindow; cbfun: GlfwCursorEnterFun): GlfwCursorEnterFun {.libglfw, cdecl.}
proc glfwSetScrollCallback*(window: GlfwWindow; cbfun: GlfwScrollFun): GlfwScrollFun {.libglfw, cdecl.}
proc glfwSetDropCallback*(window: GlfwWindow; cbfun: GlfwDropFun): GlfwDropFun {.libglfw, cdecl.}
proc glfwJoystickPresent*(jid: GlfwJoystickId): GlfwBool {.libglfw, cdecl.}
proc glfwGetJoystickAxes*(jid: GlfwJoystickId; count: ptr cint): carray[cfloat] {.libglfw, cdecl.}
proc glfwGetJoystickButtons*(jid: GlfwJoystickId; count: ptr cint): carray[GlfwKeyAction] {.libglfw, cdecl.}
proc glfwGetJoystickHats*(jid: GlfwJoystickId; count: ptr cint): carray[GlfwHat] {.libglfw, cdecl.}
proc glfwGetJoystickName*(jid: GlfwJoystickId): cstring {.libglfw, cdecl.}
proc glfwGetJoystickGuid*(jid: GlfwJoystickId): cstring {.libglfw, cdecl.}
proc glfwSetJoystickUserPointer*(jid: GlfwJoystickId; p: pointer) {.libglfw, cdecl.}
proc glfwGetJoystickUserPointer*(jid: GlfwJoystickId): pointer {.libglfw, cdecl.}
proc glfwJoystickIsGamepad*(jid: GlfwJoystickId): GlfwBool {.libglfw, cdecl.}
proc glfwSetJoystickCallback*(cbfun: GlfwJoystickFun): GlfwJoystickFun {.libglfw, cdecl.}
proc glfwUpdateGamepadMappings*(str: cstring): GlfwBool {.libglfw, cdecl.}
proc glfwGetGamepadName*(jid: GlfwJoystickId): cstring {.libglfw, cdecl.}
proc glfwGetGamepadState*(jid: GlfwJoystickId; state: GlfwGamepadStatePtr): GlfwBool {.libglfw, cdecl.}
proc glfwSetClipboardString*(window: GlfwWindow; str: cstring) {.libglfw, cdecl.}
proc glfwGetClipboardString*(window: GlfwWindow): cstring {.libglfw, cdecl.}
proc glfwGetTime*: cdouble {.libglfw, cdecl.}
proc glfwSetTime*(time: cdouble) {.libglfw, cdecl.}
proc glfwGetTimerValue*: uint64 {.libglfw, cdecl.}
proc glfwGetTimerFrequency*: uint64 {.libglfw, cdecl.}

proc glfwMakeContextCurrent*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwGetCurrentContext*: GlfwWindow {.libglfw, cdecl.}
proc glfwSwapBuffers*(window: GlfwWindow) {.libglfw, cdecl.}
proc glfwSwapInterval*(interval: cint) {.libglfw, cdecl.}
proc glfwExtensionSupported*(extension: cstring): GlfwBool {.libglfw, cdecl.}
proc glfwGetProcAddress*(procname: cstring): GlfwGLProc {.libglfw, cdecl.}

# ====== End: Procs ======

when isMainModule:
  import ../glad/gl
  echo "Start GLFW API test"
  echo ord(glfwKeySpace)
  if not glfwInit():
    echo "GLFW: Initialization failed!"
    quit QuitFailure

  discard glfwSetErrorCallback do (error: GlfwErrorCode; description: cstring) {.cdecl.}:
    stderr.writeLine $description

  var monitorCount: int
  let monitors = glfwGetMonitors(addr monitorCount)

  echo "Monitor(s): ", monitorCount
  for i in 0..<monitorCount:
    let monitor = monitors[i]
    echo $glfwGetMonitorName(monitor)

    let vidmode = glfwGetVideoMode(monitor)
    if not vidmode.isNil:
      echo "  width: ", vidmode.width
      echo "  height: ", vidmode.height
      echo "  RGB bits: ", vidmode.redBits, ", ", vidmode.greenBits, ", ", vidmode.blueBits
      echo "  refresh rate: ", vidmode.refreshRate

  glfwWindowHint(glfwContextVersionMajor, 3)
  glfwWindowHint(glfwContextVersionMinor, 3)
  glfwWindowHint(glfwOpenglForwardCompat, glfwTrue.cint)
  glfwWindowHint(glfwOpenglProfile, glfwOpenglCoreProfile)
  glfwWindowHint(glfwSamples, 4)
  glfwWindowHint(glfwDoubleBuffer, glfwTrue.cint)

  let window = glfwCreateWindow(800, 600, "Hello, World!", nil, nil)
  if window.isNil:
    glfwTerminate()
    quit QuitFailure

  glfwMakeContextCurrent(window)
  if not gladLoadGL(glfwGetProcAddress):
    stderr.writeLine "Could not load OpenGL!"
    glfwTerminate()
    quit QuitFailure
  glfwSwapInterval(1)

  discard window.glfwSetKeyCallback do (window: auto; key: auto; scancode: auto; action: auto; mods: auto) {.cdecl.}:
    if key == glfwKeyQ and action == glfwPress and mods.contains(glfwModShift):
      window.glfwSetWindowShouldClose(glfwTrue)

  glClearColor(0.4, 0.8, 1.0, 1.0) # color #66CCFF

  while not window.glfwWindowShouldClose:
    glClear(GlColorBufferBit)

    window.glfwSwapBuffers()

    glfwPollEvents()

  glfwDestroyWindow window

  glfwTerminate()
