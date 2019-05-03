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

		if (player inArea "safezone" || !alive player) exitwith {
			_display closeDisplay 2;
		};

		private _title = _display displayCtrl 1;
		private _list = _display displayCtrl 2;
		private _button1 = _display displayCtrl 3;
		private _button2 = _display displayCtrl 4;

		_title ctrlSetText "Vehicle Selection";

		lbClear _list;
		{
			_list lbAdd getText(configFile >> "CfgVehicles" >> _x >> "displayName");
			_list lbSetData [_foreachindex,_x];
			_list lbSetPicture [_foreachindex,getText(configFile >> "CfgVehicles" >> _x >> "picture")];
		} foreach getArray(missionConfigFile >> "CfgVehicles" >> "list");

		_button1 ctrlSetText "Close";
		_button1 ctrlAddEventHandler ["ButtonClick",{(ctrlParent(_this select 0))closeDisplay 2}];

		_button2 ctrlSetText "Spawn";
		_button2 ctrlAddEventHandler ["ButtonClick",{["ButtonClick",_this] call CQC_fnc_displayVehicles}];
	};
	case "ButtonClick":{
		private _display = ctrlParent (_params param [0,controlNull]);
		private _list = _display displayCtrl 2;

		if (alive player) then {
			private _activeVehicle = missionNamespace getVariable ["CQC_activeVehicle",objNull];
			if (!isNull _activeVehicle) then {
				deleteVehicle _activeVehicle;
			};

			private _class = _list lbData (lbCurSel _list);
			CQC_activeVehicle = createVehicle[_class,player modelToWorld [0,5,0],[],0,"NONE"];
			CQC_activeVehicle setdir (getdir player + 270);

			clearWeaponCargoGlobal CQC_activeVehicle;
			clearMagazineCargoGlobal CQC_activeVehicle;
			clearItemCargoGlobal CQC_activeVehicle;
			clearBackpackCargoGlobal CQC_activeVehicle;

			CQC_activeVehicle setVehicleAmmo 0;
		};

		_display closeDisplay 2;
	};
};