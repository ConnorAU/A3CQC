/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

if (player inArea "safezone") then {
	{
		private _draw = [
			"", 
			[1,1,1,1], 
			[0,0,0], 
			1, 
			1, 
			45, 
			"", 
			2, 
			0.025 max (0.25/(player distance _x)) min 0.04, 
			"PuristaMedium"
		];
		if (_x inArea "safezone") then {
			if (_x == CQC_arsenalContainer) then {
				_draw set [2,_x modelToWorldVisual [0,0,boundingBox _x select 1 select 2]];
				_draw set [6,"Loadout Editor"];
			} else {
				_draw set [2,(_x modelToWorldVisual (_x selectionPosition "head")) vectorAdd [0,0,0.5]];
				_draw set [6,name _x];
			};
			drawIcon3D _draw;
		};
	} foreach (allUnits + [CQC_arsenalContainer] - allDead - [player]);
};