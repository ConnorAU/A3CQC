/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

if (currentWeapon player != "") then {
	player action ["SwitchWeapon",player,player,100];
} else {
	private _weapon = switch true do {
		case (primaryWeapon player != ""):{primaryWeapon player};
		case (secondaryWeapon player != ""):{secondaryWeapon player};
		case (handgunWeapon player != ""):{handgunWeapon player};
		default {""};
	};
	if (_weapon != "") then {
		player selectWeapon _weapon;
	};
};