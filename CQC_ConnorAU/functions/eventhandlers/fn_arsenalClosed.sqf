/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

private _virtualItems = CQC_arsenalContainer getVariable ["bis_addvirtualweaponcargo_cargo",[]];
private _permittedItems = [];

{_permittedItems append _x;} foreach _virtualItems;

#define ITEM_VALIDATE(ITEM,REMOVE) if !(ITEM in _permittedItems) then {REMOVE}
#define ARRAY_VALIDATE(LIST,REMOVE) {ITEM_VALIDATE(_x,REMOVE _x)} foreach LIST

ITEM_VALIDATE(uniform player,removeUniform player);
ITEM_VALIDATE(vest player,removeVest player);
ITEM_VALIDATE(backpack player,removeBackpack player);
ITEM_VALIDATE(primaryWeapon player,player removeWeapon primaryWeapon player);
ITEM_VALIDATE(secondaryWeapon player,player removeWeapon secondaryWeapon player);
ITEM_VALIDATE(handgunWeapon player,player removeWeapon handgunWeapon player);
ARRAY_VALIDATE(items player,player removeItem);
ARRAY_VALIDATE(uniformItems player,player removeItem);
ARRAY_VALIDATE(vestItems player,player removeItem);
ARRAY_VALIDATE(backpackItems player,player removeItem);
ARRAY_VALIDATE(primaryWeaponItems player,player removePrimaryWeaponItem);
ARRAY_VALIDATE(secondaryWeaponItems player,player removeSecondaryWeaponItem);
ARRAY_VALIDATE(handgunItems player,player removeHandgunItem);
ARRAY_VALIDATE(primaryWeaponMagazine player,player removeMagazine);
ARRAY_VALIDATE(secondaryWeaponMagazine player,player removeMagazine);
ARRAY_VALIDATE(handgunMagazine player,player removeMagazine);

CQC_loadout = getUnitLoadout player;

[
	["UpdateDetails","Status: Idle"]
] call CQC_fnc_discord;