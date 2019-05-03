/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

if (isNull(findDisplay 602)) exitwith {};
private _repacked = []; 
{
	private _type = _x;
	if !(_type in _repacked) then {
		private _maxCapacity = getNumber(configFile >> "CfgMagazines" >> _type >> "count");
		private _totalRounds = 0;
		if (_maxCapacity > 1) then {
			{
				if (_x select 0 == _type) then {
					_totalRounds = _totalRounds + (_x select 1);
				};
			} forEach magazinesAmmo player;
			player removeMagazines _type;
			while {_totalRounds > 0} do {
				private _magRounds = _totalRounds min _maxCapacity;
				player addMagazine[_type, _magRounds];
				_totalRounds = _totalRounds - _magRounds;
			};
		};
		_repacked pushBack _type;
	};
} forEach magazines player;
["systemChat",["Magazines repacked"]] call CAU_xChat_fnc_sendMessage;
