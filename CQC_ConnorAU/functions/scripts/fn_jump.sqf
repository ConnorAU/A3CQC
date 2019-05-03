/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

if (speed player < 10 || {currentWeapon player == "" || {currentWeapon player != primaryWeapon player}}) exitwith {};
if ((missionNamespace getVariable["CQC_fnc_jump_tick",0]) > diag_tickTime) exitWith {};
CQC_fnc_jump_tick = diag_tickTime + 2;

[player,"AovrPercMrunSrasWrflDf"] remoteExec ["switchMove"];
