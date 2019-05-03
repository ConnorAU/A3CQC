/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "dikcodes.inc"

params ["_display","_code","_shift","_ctrl","_alt"];

switch _code do {
	case DIK_SPACE:{
		if (_shift && {stance player == "STAND"}) then {
			[] call CQC_fnc_jump;
		};
	};
	case DIK_H:{
		if _shift then {
			[] call CQC_fnc_holster;
		};
	};
	case DIK_R:{
		if _ctrl then {
			[] call CQC_fnc_repackAmmo;
		};
	};
	case DIK_F1:{
		[] call CQC_fnc_earplugs;
	};
	case DIK_F2:{
		if !dialog then {
			createdialog "CQCDisplayOptions";
		};
	};
	case DIK_F3:{
		if !dialog then {
			createdialog "CQCDisplayVehicles";
		};
	};
	case DIK_F4:{
		if !dialog then {
			[] call CQC_fnc_displayHelp;
		};
	};
	case DIK_SYSRQ:{
		CQC_printScreenPressed = false;
	};
};

false