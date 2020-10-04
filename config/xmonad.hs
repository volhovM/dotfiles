-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import XMonad.Actions.GridSelect
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Layout.NoBorders
import XMonad.Layout.SimpleFloat
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Tabbed

import Data.Monoid
import System.Exit

import qualified Data.Map as M
import qualified XMonad.StackSet as W

myMusPlayerNext = "deadbeef --next"
myMusPlayerPlay = "deadbeef --play-pause"
myMusPlayerPrev = "deadbeef --prev"
myTerminal      = "urxvt"
myBrowser       = "firefox"
myFocusFollowsMouse = False
myClickJustFocuses = False
myBorderWidth   = 1
myModMask       = mod4Mask
myWorkspaces    = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
myNormalBorderColor  = "#555555"
myFocusedBorderColor = "#ee4444"
makeScreen = "scrot -s ~/screen.png"
myDmenu = "dmenu_run -fn \"Terminus-10:normal\""
myLockCmd = "xsecurelock"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
--myKeys :: XConfig Layout -> M.Map (KeyMask, Button) (Window -> X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    --CUSTOM------------------------------------------------------------
    [
          -- touchpad control
      ((0,                 0x1008ffa9), spawn "sh /home/volhovm/programs/touchpadControl.sh")

          -- alsa sound settings
    , ((0,                 0x1008FF11), spawn "amixer set Master 10%-")
    , ((0,                 0x1008FF13), spawn "amixer set Master 10%+")
    , ((0,                 0x1008FF12), spawn "amixer set Master toggle")

         -- music player
    , ((0,                 0x1008ff16), spawn myMusPlayerPrev)
    , ((0,                 0x1008ff14), spawn myMusPlayerPlay)
    , ((0,                 0x1008ff17), spawn myMusPlayerNext)

         -- brightness
    , ((0,                 0x1008ff02), spawn "sh ~/dotfiles/scripts/light.sh inc")
    , ((0,                 0x1008ff03), spawn "sh ~/dotfiles/scripts/light.sh dec")

         -- lock&sleep
    , ((0,                 0x1008ff81), spawn (myLockCmd ++ " & (sleep 0.5 && systemctl suspend)")) -- settings

         -- locking
    , ((0,                 0x1008ff30), spawn myLockCmd)

         -- display
    , ((0,                 0x1008ff59), spawn "sh ~/dotfiles/scripts/xrandr-auto.sh")

          -- org mode files
    , ((modm,              0x6f), spawn "emacs ~/org/private.org")

          -- launch browser
    , ((modm,              0x73), spawn $ myBrowser ++ "&")

          -- make a screenshot
    , ((modm,              0x72), spawn $ makeScreen ++ "&")

          --DEFAULT-----------------------------------------------------------

          -- launch a terminal
    , ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

          -- launch dmenu
    , ((modm,               xK_p     ), spawn myDmenu)

--          -- launch connman_dmenu
--    , ((modm .|. shiftMask, xK_p     ), spawn "/home/volhovm/programs/nmcli-dmenu/nmcli_dmenu")

          -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

           -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

          --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

          -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

          -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

          -- Move focus to the previous window
    , ((modm .|. shiftMask, xK_Tab   ), windows W.focusUp)

          -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

          -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

          -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

          -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

          -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

          -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

          -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

          -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

          -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

          -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

          -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

          -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

          -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

          -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile && xmonad --restart")

          -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
          ]
        ++

        --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
             | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
                                 , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
        ++

        --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
             | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
                                    , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


    ------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
       [
             -- mod-button1, Set the window to floating mode and move by dragging
     ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

             -- mod-button2, Raise the window to the top of the stack
--     ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

             -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                     >> windows W.shiftMaster))

             -- you may also bind events to the mouse scroll wheel (button1 and button5)
    ]

myLayout =
    smartBorders $
        tiled ||| Mirror tiled
              ||| Full
              ||| tabbed shrinkText myTabbedTheme
--              ||| simplestFloat
  where
         -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

          -- The default number of windows in the master pane
     nmaster = 1

          -- Default proportion of screen occupied by master pane
     ratio   = 1/2

          -- Percent of screen to increment by when resizing panes
     delta   = 3/100


myTabbedTheme :: Theme
myTabbedTheme = defaultTheme {
                   --fontName = "-*-terminus-*-*-*-*-12-*-*-*-*-*-*-*"
                   fontName="xft:Terminus:pixelsize=11",
                   inactiveColor="#222C30",
                   --inactiveTextColor="#9FC6CC",
                   activeColor="#9FC6CC",
                   activeTextColor="#222C30",
                   decoHeight=16
                }

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]


------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = setWMName "LG3D"
--myStartupHook = undefined

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad . ewmh =<< statusBar myBar myPP toggleStrutsKey defaults
--main = xmonad . ewmh =<< xmobar defaults

-- Command to launch the bar.
myBar = "xmobar"
--
-- -- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppOutput  = const $ pure ()
                , ppCurrent = const ""
                , ppVisible = const ""
                , ppSep     = ""
                , ppWsSep   = " "
                , ppLayout  = const ""
                , ppHidden  = const ""
                , ppTitle   = const ""}
--
-- -- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
defaults = defaultConfig {
        -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

        -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

        -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        startupHook        = myStartupHook,
        logHook            = dynamicLogWithPP $ myPP
        }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = "Help yourself"
