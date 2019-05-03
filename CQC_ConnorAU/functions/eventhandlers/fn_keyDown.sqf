/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "dikcodes.inc"

scopeName "Main";
params ["_display","_code","_shift","_ctrl","_alt"];

private _return = false;
switch _code do {
	case DIK_SPACE:{
		_return = _shift && {stance player == "STAND"};
	};
	case DIK_H:{
		_return = _shift;
	};
	case DIK_R:{
		_return = _ctrl;
	};
	case DIK_F1:{
		_return = true;
	};
	case DIK_F2;
	case DIK_F3;
	case DIK_F4:{
		_return = !dialog;
	};
	case DIK_SYSRQ:{
		CQC_printScreenPressed = true;
		_return = true;
	};
};
switch true do {
	case (inputAction "MoveForward" > 0);
	case (inputAction "MoveBack" > 0);
	case (inputAction "TurnLeft" > 0);
	case (inputAction "TurnRight" > 0):{
		_return = missionNameSpace getvariable ["CQC_printScreenPressed",false];
	};
};

_return