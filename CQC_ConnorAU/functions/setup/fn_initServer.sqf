/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

if !isServer exitwith {};

0 setFog 0;
0 setRain 0;
0 setOvercast 0;
forceWeatherChange;
setTimeMultiplier 0;
setDate[2035,6,20,8,0];

addMissionEventHandler ["PlayerConnected",{	
	diag_log text format["PlayerConnected: %1",_this];
}];
addMissionEventHandler ["PlayerDisconnected",{	
	diag_log text format["PlayerDisconnected: %1",_this];
}];
addMissionEventHandler ["HandleDisconnect",{
	params ["_unit"];
	deleteVehicle _unit;
}];

["Initialize"] call BIS_fnc_dynamicGroups;

0 spawn {
	scriptName "CQC_vehicleCleanup";
	private ["_tick"];
	while {true} do {
		uisleep 60;
		{
			if (_x isKindOf "LandVehicle" || _x isKindOf "Air") then {
				_tick = _x getVariable ["CQC_lastUsed",-1];
				if (_tick > -1) then {
					if (count crew _x > 0) then {
						_x setVariable ["CQC_lastUsed",time + 5*60];
					} else {
						if (time > _tick) then {
							deleteVehicle _x;
						};
					};
				} else {
					_x setVariable ["CQC_lastUsed",time + 5*60];
				};
			};
		} forEach vehicles;
	};
};