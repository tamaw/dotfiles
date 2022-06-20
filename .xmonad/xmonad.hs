import XMonad hiding ((|||))
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (doFullFloat, doCenterFloat, isFullscreen, isDialog)
import qualified Data.Map as M
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W

import XMonad.Layout.MouseResizableTile
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout ((|||))
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.TwoPane
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Layout.Renamed (renamed)
import XMonad.Layout.BoringWindows
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Layout.Decoration
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL))
import XMonad.Layout.MultiToggle (Toggle(Toggle))


main :: IO ()
main = do
    xmonad =<< statusBar myBar myPP toggleStrutsKey (
     ewmh def
        { terminal = myTerminal
        , modMask = myModMask
        , workspaces = myWorkspaces
        , manageHook = myManageHook
        -- handleEventHook = m
        , logHook = myLogHook
        , startupHook = myStartupHook
        , layoutHook = myLayoutHook
        , normalBorderColor = myNormalBorderColour
        , focusedBorderColor = myFocusedBorderColour
        } `additionalKeysP` myAdditionalKeys)
    where
        myConfig = def { modMask  = myModMask }
        myTerminal = "st"
        myModMask = mod4Mask
        myBar ="xmobar"
        myPP = xmobarPP
            { ppCurrent = xmobarColor easyBlue "" . wrap "<" ">"
            , ppVisible = xmobarColor easyBlue"" . wrap "(" ")"
            , ppTitle = xmobarColor easyBlue "" . shorten 60
            , ppUrgent = xmobarColor megenta "" . wrap "!" "!"
            }
        toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)
        myWorkspaces = map show [1..9]
        myLogHook = composeAll [ ]
        myManageHook :: ManageHook
        myManageHook = composeAll
            [ role =? "pop-up" --> doFloat
            , role =? "bubble" --> doFloat
            , isFullscreen --> (doF W.focusDown <+> doFullFloat)
            , isDialog --> doCenterFloat
            , className =? "Xmessage" --> doCenterFloat
            , className =? "Microsoft Teams - Preview" --> doCenterFloat
			, className =? "discord" --> doCenterFloat
            , className =? "Thunar" --> doCenterFloat
            , className =? "feh" --> doFloat
			, className =? "KeePassXC" --> doFloat
			, className =? "Xfce4-power-manager-settings" --> doCenterFloat
		    , className =? "QEMU" --> doFloat
            ]
            where
                role = stringProperty "WM_WINDOW_ROLE"
        myStartupHook = do
            return ()
        myLayoutHook =  tiled
                        ||| threePane
                        ||| tabs
                        ||| bsp
            where
                tiled = mySpacing spacing $ ResizableTall nmaster delta ratio []
                -- twoPane = mySpacing spacing $ TwoPane delta ratio
                threePane = mySpacing spacing $ ThreeCol nmaster delta delta
                bsp = mySpacing spacing emptyBSP
                tabs = noBorders $ tabbed shrinkText def

                nmaster = 1
                ratio = 1/2
                delta = 4/100
                spacing = 3

                mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
                mySpacing i = spacingRaw True (Border i i i i) True (Border i i i i) True

                -- myTabConfig = def { activeColor = lightGray
                --                   , inactiveColor = darkGray
                --                   , urgentColor = lightBlue
                --                   , activeBorderColor = easyBlue
                --                   , inactiveBorderColor = darkGray
                --                   , urgentBorderColor = megenta
                --                   }

        myAdditionalKeys =
            [ ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
            -- , ("M-x", spawn "xmessage 'it works'")
            -- , ("M-<Enter>", spawn "st")
            , ("M-<Space>", spawn "rofi -combi-modi window,drun,ssh -show combi -icon-theme 'Papirus-Dark' -show-icons")
            , ("C-M-<Space>", spawn "rofi -show run" )
            , ("M-S-f", sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts)
            , ("M-S-h", sendMessage MirrorShrink)
            , ("M-S-l", sendMessage MirrorExpand)
            , ("M-<Tab>", sendMessage NextLayout)
            , ("S-M-<Tab>", sendMessage FirstLayout)
            , ("M-;", spawn "rofimoji")
            , ("M-=", spawn "rofi -show calc")
            , ("M-M1-l", spawn "betterlockscreen --lock")
            , ("M-S-s", spawn "~/.local/scripts/screengrab.sh")
		    , ("M-m", spawn "~/.local/scripts/systemtray.sh")
            ]

        myNormalBorderColour = darkBlue
        myFocusedBorderColour = easyBlue

        easyBlue = "#469aff"
        darkBlue = "#0f133c"
        lightBlue = "#f4faff"
        darkGray = "#555555"
        lightGray = "#cccccc"
        megenta = "#ff2eff"

