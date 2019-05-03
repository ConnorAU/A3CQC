/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

private _colorLink = [
	"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
	"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
	"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
	1
] call BIS_fnc_colorConfigToRGBA call BIS_fnc_colorRGBAtoHTML;

[
	[
		"This mission was written by Connor.",
		"    Steam: <a colorLink='"+_colorLink+"' href='https://steamcommunity.com/id/_connor'>https://steamcommunity.com/id/_connor</a>",
		"    Github: <a colorLink='"+_colorLink+"' href='https://github.com/ConnorAU'>https://github.com/ConnorAU</a>",
		"",
		"This mission makes use of the following open source mods:",
		"<a colorLink='"+_colorLink+"' href='https://github.com/ConnorAU/A3ExtendedChat'>Extended Chat</a>",
		"<a colorLink='"+_colorLink+"' href='https://github.com/ConnorAU/A3UserInputMenus'>User Input Menus</a>",
		"",
		"This mission supports the following optional mods:",
		"<a colorLink='"+_colorLink+"' href='https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159'>Discord Rich Presence</a>",
		"",
		"Controls:",
		"    Shift + H: Holster weapon",
		"    Shift + Space: Jump",
		"    Ctrl + R: Repack Magazines (Inventory must be open)",
		"    U: Groups Menu",
		"    F1: Ear plugs",
		"    F2: Options menu",
		"    F3: Vehicle menu",
		"    F4: This info menu"
	] joinString "<br/>",
	"Welcome to Close Quarters Combat (CQC)"
] call CAU_UserInputMenus_fnc_guiMessage;