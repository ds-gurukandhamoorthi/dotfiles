import XMonad hiding ( (|||) )
import XMonad.Layout.LayoutCombinators
import XMonad.Util.EZConfig
import XMonad.Util.CustomKeys
import XMonad.Util.XSelection
import qualified XMonad.Util.Paste as UP
import XMonad.Actions.GroupNavigation
import Data.Monoid
import Control.Monad
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import Data.Bits ((.|.))
import XMonad.Actions.Search(lucky, google, selectSearch, promptSearch)
import XMonad.Actions.Submap
import XMonad.Actions.Commands
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
--import XMonad.Layout.MultiToggle
--import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders
import XMonad.Layout.TwoPane
import XMonad.ManageHook
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Scratchpad
import XMonad.Actions.WindowBringer
import XMonad.Layout.WindowNavigation
import XMonad.Layout.Named
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Input
import XMonad.Prompt.AppendFile
import XMonad.Actions.WindowGo


--TODO: understand Scratchpad, and then search engines prompt

super, alt, hyper :: KeyMask
super = mod4Mask
alt = mod1Mask
hyper = mod3Mask

dateCommand = "date +'%a %d/%m/%Y   %T' "

testConsoleFunctiona :: X()
testConsoleFunctiona = spawn "ls /home/guru/testfile* >> /home/guru/testfilexmonada"

testConsoleFunctionb :: X()
testConsoleFunctionb = spawn "ls /home/guru/testfile* >> /home/guru/testfilexmonadb"



ratpoisonEscape = (0, xK_less)

addReminder = do
	spawn(dateCommand ++ ">>"  ++ remindersFile)
	appendFilePrompt defaultXPConfig remindersFile
	where
		remindersFile = "/home/guru/.notes"



--layout = noBorders Full ||| tiled ||| Mirror tiled
--layout = smartBorders $  configurableNavigation (navigateColor "#0000FF") $ Mirror tiled ||| Full ||| tiled
layout = smartBorders $  windowNavigation $ Mirror tiled ||| Full ||| tiled ||| twoCol ||| twoRow
	where
		tiled = Tall nMaster delta ratio
		twoCol = named "2Col" $ TwoPane delta (1/2)
		twoRow = named "2Row" $ Mirror $ TwoPane delta (1/2)
		nMaster = 2
		ratio = 936/1600
		delta = 1/300

myWorkspaces=["1","2","3","4","5","6","7","8","9"]


commands :: X [(String, X ())]
commands = return myListCommands

--myListCommands :: [(String, X())]
myListCommands = [
	("random-wallpaper",randomWallpaper)
	, ("one-above-another",oneAboveAnother)
	, ("book", spawn "zathura /home/guru/Downloads/book")
	, ("reader", bookReader)
	, ("android-studio", androidStudio)
	, ("netbeans", netBeans)
	, ("test-function", referenceCard `seq` showHelpRefBindingsAsTheParenthesesThing )
	, ("e-acute", spawn "xdotool getwindowfocus windowfocus --sync type é")
	, ("n-tilde", spawn "xdotool type gurñ")
	--, ("e-acute", UP.pasteChar noModMask 'é')
	, ("git-user-name", spawn "xdotool type ds-gurukandhamoorthi")
	
	]

-- use <+> ...
myManageHook =  composeAll[
	manageHook defaultConfig
	, manageScratchPad
	--, className =? "Xpdf" --> doApplyKeymap
	--, (className =? "NetBeans IDE 8.2" ) --> doUnfloat
	, (appName =? "Java" ) --> doUnfloat
	]
	where doUnfloat = ask >>= doF . W.sink

manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook(W.RationalRect l t w h)
	where
		h = 0.1
		w = 1
		t = 1-h
		l = 1-w

main = xmonad $ defaultConfig
	{ modMask = super
	, logHook = ewmhDesktopsLogHook <+> historyHook <+> dynamicLog
	, manageHook =  myManageHook
	, handleEventHook = ewmhDesktopsEventHook
	, workspaces = myWorkspaces
	, layoutHook = layout
	, startupHook = welcomeMessage >> spawn "/home/guru/bin/onlyTheLargeMonitor.sh" >> ewmhDesktopsStartup >> setWMName "LG3D" >> spawn "/home/guru/bin/onDasKeyboard.sh" >>browser >>randomWallpaper
	}
	 `additionalKeys`
	[((0 , xK_Print), randomWallpaper)
	,((super , xK_e), commands >>= runCommand)
	--,((super , xK_f), runOrRaisePrompt defaultXPConfig)
	,((0 , xK_F13), rpOther)
	,((0 , xK_Menu), phantomConsole)
	,((0 , xK_F12), phantomConsole)
	,((0 , xK_F5),   testConsoleFunctiona >> testConsoleFunctionb)
	--,((0 , xK_F5),  raiseAndDo referenceCard  (title =? "eph") (\_ -> showHelpRefBindingsAsTheParenthesesThing))
	--,((0 , xK_F7), referenceCard >> showHelpRefBindingsAsTheParenthesesThing)
	--,((0 , xK_F8), showHelpRefBindingsAsTheParenthesesThing >> referenceCard)
	,((hyper , xK_f), selectSearch lucky)
	,((hyper , xK_g), promptSearch greenXPConfig lucky)
	,((hyper , xK_m), addReminder)
	,((hyper , xK_v), spawn "/home/guru/bin/vimNBCurrFile.sh newterminalwindow")
	,((hyper , xK_e), spawn "/home/guru/bin/showErrors.sh")
	--,((0 , xK_F10), inputPromptWithCompl defaultXPConfig "Fire" (mkComplFunFromList' ["1.Tall","2.Wide"]) ?+ \l -> sendMessage $ JumpToLayout $ drop 2 l)
	,((controlMask .|. alt, xK_k), halt)

	, (ratpoisonEscape, submap . M.fromList $ ratpoisonBindings )

	] `additionalMouseBindings` [
	((super, thumbsDown), const rpPrevious)
	,((super, thumbsUp), const rpNext)
	,((super, scrollDown), const rpNext)
	,((super, scrollUp), const rpPrevious)
	,((super, left), const rpOther)
	,((super, right), const $ selectSearch lucky )
	,((super, middle), const kill) --make it more intelligent when in firefox : close tab...
	,((controlMask, thumbsDown), const $ spawn "xdotool key --clearmodifiers ctrl+Prior") -- TODO make it more intelligent depending on whether we are on firefox or not: when in firefox: ctrl pageup else rpPrevious ...
	,((controlMask,thumbsUp), const $ spawn "xdotool key --clearmodifiers ctrl+Next")
	]where
		thumbsDown = 8 --Guru's vertical mouse
		thumbsUp = 9 --Guru's vertical mouse
		left = 1
		middle = 2
		right = 3
		scrollUp = 4
		scrollDown = 5
	

	
	--`additionalKeysP`
	--[("C-t C-t", commands >>= runCommand)]
	


-- some ratpoison actions
rpOther, rpPrevious, rpNext :: X()
rpOther = nextMatch History (return True)
rpNext = windows W.focusUp
rpPrevious = windows W.focusDown

rpOnly, rpSplit, rpHSplit, rpFocusOnVoid:: X()
rpOnly =  sendMessage $ JumpToLayout "Full"
rpSplit =  sendMessage $ JumpToLayout "2Row" --ratpoison continues to split... but we don't
rpHSplit =  sendMessage $ JumpToLayout "2Col"
rpFocusOnVoid = moveTo Next EmptyWS
--rpOnly = setLayout $ XMonad.layoutHook conf


--some actions
browser, launcher,console, speedConsole, batStatus, randomWallpaper, halt, executePrompt, internalCommandsPrompt, externalKeyboard :: X()
browser = runOrRaise "firefox" (className =? "Firefox")
launcher = spawn "dmenu_run"
console = runOrRaise "lxterminal" (className =? "Lxterminal")
androidStudio = runOrRaise "/opt/android-studio/bin/studio.sh" (className =? "jetbrains-studio")
netBeans = runOrRaise "/home/guru/netbeans-8.2/bin/netbeans" (className =? "NetBeans IDE 8.2")

--bookReader = runOrRaise "zathura" (className =? "Zathura")
--bookReader = runOrRaise "zathura /home/guru/Downloads/book" (className =? "Zathura")
bookReader = raiseMaybe (spawn "zathura /home/guru/Downloads/book") (className =? "Zathura")
--speedConsole = spawn "Eterm"
speedConsole = scratchpadSpawnActionCustom "urxvt -e  tail -f /var/lib/tomcat8/logs/catalina.out"
--speedConsole = scratchpadSpawnActionTerminal "urxvt -e 'tail -f /var/lib/tomcat8/logs/catalina.out'"
batStatus = spawn "/home/guru/bin/batStatus.sh" -- battery status
randomWallpaper = spawn "feh --randomize --recursive --bg-scale ~/wp"
halt = spawn "sudo shutdown now"
executePrompt = launcher -- to be modified to have the same functionality as in ratpoison
internalCommandsPrompt = defaultCommands >>= runCommand

dzen2Filter = " dzen2 -p 1 -fn 'Dejavu Sans:size=20'"
oneAboveAnother, welcomeMessage, showDateTime :: X()
oneAboveAnother = spawn "/home/guru/bin/oneAboveAnother.sh" -- battery status
externalKeyboard = spawn "/home/guru/bin/" -- battery status
welcomeMessage = spawn $ "echo 'Guru never fails' | " ++ dzen2Filter
showDateTime = spawn $ dateCommand ++ " | " ++ dzen2Filter

phantomConsole = scratchpadSpawnActionTerminal "urxvt"

referenceCard :: X()
referenceCard = spawn $ "xpdf -title eph -fullscreen " ++ "/home/guru/refs/shortcuts.pdf"

promptAndOpenFile :: X()
promptAndOpenFile = spawn "/home/guru/bin/openFileInNB.sh"


ratpoisonBindings =
	[
	--launching and killing programs
	((0, xK_c), console)
	,((shiftMask, xK_c), speedConsole)
	,((0, xK_k),  kill)
	,((0, xK_period), launcher)
	,((0, xK_f), browser)
	,((0, xK_b), bookReader)
	,((0, xK_o), promptAndOpenFile)
	,((0, xK_i), netBeans)
	,((0, xK_w), gotoMenuArgs ["-l", "25"])
	,((0, xK_minus), rpFocusOnVoid)
	,((0 , xK_Right), sendMessage $ Go R)
	,((0 , xK_Left), sendMessage $ Go L)
	,((0 , xK_Up), sendMessage $ Go U)
	,((0 , xK_Down), sendMessage $ Go D)
	,((controlMask , xK_Right), sendMessage $ Swap R)
	,((controlMask , xK_Left), sendMessage $ Swap L)
	,((controlMask , xK_Up), sendMessage $ Swap U)
	,((controlMask , xK_Down), sendMessage $ Swap D)


	-- execute ...
	,((shiftMask, xK_1), phantomConsole)


	-- move window "stack"
	, (ratpoisonEscape, rpOther)
	,((0, xK_n), rpNext)
	,((0, xK_p), rpPrevious)
	,((shiftMask, xK_q), rpOnly)
	,((0, xK_s), rpSplit)
	,((shiftMask, xK_s), rpHSplit)
	,((0, xK_space), rpNext)
	,((shiftMask, xK_space), rpPrevious)
	,((0, xK_a), showDateTime)
	,((shiftMask, xK_a), spawn "gsimplecal")


	-- resizing
	, ((controlMask, xK_r), spawn "echo resize| osd_cat " >> resizingBindingsAsTheParenthesesThing)

	,((super, xK_F12),  batStatus)

	-- show useful information
	,((super, xK_F1),  batStatus)

	]

resizingBindingsAsTheParenthesesThing :: X()
resizingBindingsAsTheParenthesesThing = submap . M.fromList $ resizingBindings


resizingBindings=
	[
	((0, xK_p), welcomeMessage >> resizingBindingsAsTheParenthesesThing) --recursive thing very powerful
	]

showHelpRefBindingsAsTheParenthesesThing :: X()
showHelpRefBindingsAsTheParenthesesThing = submap . M.fromList $ showHelpRefBindings

showHelpRefBindings = 
	[
	((0, xK_space), spawn "xdotool getwindowfocus windowfocus --sync key space" >> showHelpRefBindingsAsTheParenthesesThing)
	,((0, xK_BackSpace), spawn "xdotool getwindowfocus windowfocus --sync key BackSpace" >> showHelpRefBindingsAsTheParenthesesThing)
	,((0, xK_k), kill)
	]
	



-- ** Mulitmedia ** --
volumeUp, volumeDown :: X() -- amixer -M option is to get the same thing as alsamixser which is "more natural for the human ear"
volumeUp = amixer "5%+" 
volumeDown = amixer "5%-"
volumeToggle = amixer "toggle"
amixer  = spawn . (amixerCmd++)
	where amixerCmd = "amixer -q -M set Master "

--TO DO
-- implement cnext cprev cother ...
--help ... echo guru |xmessage -timeout 20 -buttons "exit:0" -default exit -file -


doNothing :: ManageHook
doNothing = doF id

doApplyKeymap :: ManageHook
--doApplyKeymap = doF  (\_ -> liftX showHelpRefBindingsAsTheParenthesesThing)  =<< ask
doApplyKeymap = ask >>= \_ -> liftX showHelpRefBindingsAsTheParenthesesThing >> doNothing

--applyKeymap :: (Ord a, Eq s, Eq i) -> StackSet i l a s sd -> StackSet i l a s sd



