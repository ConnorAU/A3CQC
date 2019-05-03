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

		_title ctrlSetText "Spawn Selection";

		lbClear _list;
		{
			private _displayName = _x splitstring "_" joinstring " ";
			_list lbAdd _displayName;
			_list lbSetData [_foreachindex,_x];

			preloadCamera (getMarkerPos(_x + "__combat_zone"));
		} foreach [
			"Agios_Georgios",
			"Capture_Point_1",
			"Capture_Point_2",
			"Capture_Point_3",
			"Factory",
			"Federal_Reserve",
			"Lakka",
			"Quarry",
			"Therisa",
			"Thronos"
		];

		_button1 ctrlSetText "Close";
		_button1 ctrlAddEventHandler ["ButtonClick",{(ctrlParent(_this select 0))closeDisplay 2}];

		_button2 ctrlSetText "Spawn";
		_button2 ctrlAddEventHandler ["ButtonClick",{["ButtonClick",_this] call CQC_fnc_displaySpawns}];

		_display displayAddEventHandler ["MouseHolding",{["LBUpdate",_this] call CQC_fnc_displaySpawns}];
		_display displayAddEventHandler ["MouseMoving",{["LBUpdate",_this] call CQC_fnc_displaySpawns}];

		[
			["UpdateDetails","Status: Choosing a spawn"]
		] call DiscordRichPresence_fnc_update;
	};
	case "onUnload":{
		if (isNil "CQC_spawnSuccess") then {
			[
				["UpdateDetails","Status: Idle"]
			] call CQC_fnc_discord;
		};
		CQC_spawnSuccess = nil;
	};
	case "LBUpdate":{
		private _display = _params param [0,displayNull];
		private _list = _display displayCtrl 2;

		private _units = allPlayers - allDeadMen;
		for "_i" from 0 to (lbSize _list - 1) do {
			private _location = _list lbData _i;

			private _playersNearby = {
				_x distance (getMarkerPos _location) < ((markerSize _location) select 0)*4
			} count _units;

			_list lbSetTextRight [_i,format["%1 players nearby",_playersNearby]]
		};
	};
	case "ButtonClick":{
		private _button = _params param [0,controlNull];
		_button ctrlEnable false;
		private _display = ctrlParent _button;
		private _list = _display displayCtrl 2;

		if ((lbCurSel _list) < 0) exitWith {_button ctrlEnable true;};
		
		private _location = _list lbData (lbCurSel _list);
		private _locationName = _list lbText (lbCurSel _list);

		private _deathPos = missionNamespace getVariable ["CQC_deathPos",[0,0,0]];
		private _zoneCenter = getMarkerPos _location;
		private _zoneSize = markerSize _location;
		_zoneSize = (_zoneSize select 0) max (_zoneSize select 1);
		private _spawnPos = [];

		for "_i" from 1 to 1000 do {
			scopeName "findSpawnLoop";
			private _thisPos = ATLtoASL(([_zoneCenter,0,(0.75 max (_i/20) min 1)*_zoneSize,1,0,0.35] call BIS_fnc_findSafePos) + [0]);
			if (_thisPos inArea _location) then {
				private _isHidden = true;
				{
					private _eyePos = eyePos _x;

					private _eyeIntersect = lineIntersects[_eyePos,_thisPos vectorAdd [0,0,1.8],_x,player];
					private _bodyIntersect = lineIntersects[_eyePos,_thisPos vectorAdd [0,0,0.9],_x,player];
					private _footIntersect = lineIntersects[_eyePos,_thisPos,_x,player];

					if (false in [_eyeIntersect,_bodyIntersect,_footIntersect]) exitwith {
						_isHidden = false;
					};
				} foreach (allPlayers-allDeadMen);
				if _isHidden then {
					private _nearUnits = nearestObjects[ASLtoAGL _thisPos,["CAManBase"],25] select {alive _x};
					if (count _nearUnits < 1 && {ASLtoAGL _thisPos distance _deathPos > 40}) then {
						_spawnPos = +_thisPos;
						breakOut "findSpawnLoop";
					};
				};
			};
		};

		if (count _spawnPos > 0) then {
			player setPosASL _spawnPos;
			player setDir (getDir player + (player getRelDir markerPos _location));
			["systemChat",[format["%1 spawned at %2",profileName,_locationName]]] remoteExecCall ["CAU_xChat_fnc_sendMessage",0];
			[
				["UpdateDetails","Status: In Combat"],
				["UpdateState","Location: " + _locationName]
			] call CQC_fnc_discord;
			CQC_spawnSuccess = true;
			_display closeDisplay 2;
		} else {
			hint "No safe spawn point could be found.";
			_button ctrlEnable true;
		};
	};
};