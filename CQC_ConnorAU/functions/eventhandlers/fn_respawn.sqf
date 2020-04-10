/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

params ["_unit", "_corpse"];

[
	["UpdateState","Location: Home base"]
] call DiscordRichPresence_fnc_update;

CQC_deathPos = getPos _corpse;
deleteVehicle _corpse;

while {dialog} do {closeDialog 0};
createDialog "CQCDisplaySpawns";

_unit enableStamina false;
_unit setCustomAimCoef 0;
_unit setVariable ["CQC_unitName",name _unit,true];
_unit switchCamera (missionNamespace getVariable ["CQC_cameraView","INTERNAL"]);

if (!isNil "CQC_loadout") then {
	_unit setUnitLoadout CQC_loadout;
	if (missionNamespace getVariable ["CQC_hideBackpack",false]) then {
		(unitBackpack player) setObjectTextureGlobal [0,""];
	};
};