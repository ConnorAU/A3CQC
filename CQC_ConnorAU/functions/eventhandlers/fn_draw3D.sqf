/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

if (player inArea "safezone") then {
	private _draw = [
		"", 
		[1,1,1,1], 
		[0,0,0], 
		1, 
		1, 
		45, 
		"", 
		2, 
		0.025, 
		"PuristaMedium"
	];
	{
		if (_x inArea "safezone") then {
			if (_x == CQC_arsenalContainer) then {
				_draw set [2,_x modelToWorldVisual [0,0,boundingBox _x select 1 select 2]];
				_draw set [6,"Loadout Editor"];
			} else {
				_draw set [2,(_x modelToWorldVisual (_x selectionPosition "head")) vectorAdd [0,0,0.5]];
				_draw set [6,_x getVariable ["CQC_unitName",["","Spawn Selection"] select (_x isEqualTo CQC_spawnSelectNPC)]];
			};
			_draw set [8,linearConversion[5,10,player distance _x,0.04,0.025,true]];
			drawIcon3D _draw;
		};
	} foreach (allUnits + [CQC_arsenalContainer] - allDead - [player]);
};