/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

params [["_mode","",[""]],["_params",[]]];

switch _mode do {
	case "onLoad":{
		private _display = _params param [0,displayNull];

		private _title = _display displayCtrl 1;
		private _list = _display displayCtrl 2;
		private _button1 = _display displayCtrl 3;
		private _button2 = _display displayCtrl 4;

		_title ctrlSetText "Options";

		lbClear _list;
		{
			_x params ["_name","_code"];
			_list lbAdd _name;
			_list lbSetData [_forEachIndex,"[] call " + str _code];
		} foreach [
			["Toggle Grass",{
				if (getTerrainGrid != 50) then {
					setTerrainGrid 50;
				} else {
					setTerrainGrid 25;
				};
			}],
			["Toggle Backpack",{
				if (isNil "CQC_hideBackpack") then {CQC_hideBackpack = false};
				CQC_hideBackpack = !CQC_hideBackpack;
				if CQC_hideBackpack then {
					(unitBackpack player) setObjectTextureGlobal [0,""];
				} else {
					player setUnitLoadout getUnitLoadout player;
				};
			}],
			["Add 20Rnd 7.62mm Ammo",{
				player addMagazine "20Rnd_762x51_Mag";
			}],
			["Add 30Rnd 7.62mm Ammo",{
				player addMagazine "30Rnd_762x39_Mag_F";
			}],
			["Add 30Rnd 6.5mm Ammo",{
				player addMagazine "30Rnd_65x39_caseless_mag";
			}],
			["Add 30Rnd 6.5mm Caseless Ammo",{
				player addMagazine "30Rnd_65x39_caseless_green_mag_Tracer";
			}],
			["Add First Aid Kit",{
				player addItem "FirstAidKit";
			}]
		];

		_button1 ctrlSetText "Close";
		_button1 ctrlAddEventHandler ["ButtonClick",{(ctrlParent(_this select 0))closeDisplay 2}];

		_button2 ctrlSetText "Select";
		_button2 ctrlAddEventHandler ["ButtonClick",{["ButtonClick",_this] call CQC_fnc_displayOptions}];
	};
	case "ButtonClick":{
		private _display = ctrlParent (_params param [0,controlNull]);
		private _list = _display displayCtrl 2;
		call compile (_list lbData (lbCurSel _list));
	};
};