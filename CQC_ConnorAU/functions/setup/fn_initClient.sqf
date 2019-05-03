/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

if isDedicated exitwith {};

setViewDistance 500;
enableEnvironment false;
enableSentences false;
enableRadio false;
enableSaving [false, false];

[
	["UpdateDetails","Status: Idle"],
	["UpdateState","Location: Home base"]
] call CQC_fnc_discord;

0 spawn {
	waitUntil {!isNull(findDisplay 46)};

	(findDisplay 46) displayAddEventHandler ["keyDown",{_this call CQC_fnc_keyDown}];
	(findDisplay 46) displayAddEventHandler ["keyUp",{_this call CQC_fnc_keyUp}];

	[] call CQC_fnc_displayHelp;
	setCurrentChannel 0;
};
0 spawn {
	waitUntil {player isKindOf "CAManBase"};

	player enableStamina false;
	player setCustomAimCoef 0;

	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

	player addEventHandler ["InventoryOpened",{_this call CQC_fnc_inventoryOpened}];
	player addEventHandler ["handleDamage",{_this call CQC_fnc_handleDamage}];
	player addEventHandler ["firedMan",{_this call CQC_fnc_firedMan}];
	player addEventHandler ["killed",{_this call CQC_fnc_killed}];
	player addEventHandler ["respawn",{_this call CQC_fnc_respawn}];

	addMissionEventHandler ["Draw3D",{[] call CQC_fnc_draw3D}];

	[missionNamespace,"arsenalOpened",{_this call CQC_fnc_arsenalOpened}] call BIS_fnc_addScriptedEventHandler;
	[missionNamespace,"arsenalClosed",{_this call CQC_fnc_arsenalClosed}] call BIS_fnc_addScriptedEventHandler;
};
