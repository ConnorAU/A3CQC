/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

private _projectile = param [6,objNull];

if (player inArea "safezone") then {
	deleteVehicle _projectile;
	hint "You can't do that in the safezone";
};