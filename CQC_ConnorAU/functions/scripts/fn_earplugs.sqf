/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

private _nextVolume = soundVolume - 0.25;
if (_nextVolume < 0) then {_nextVolume = 1};
0.5 fadeSound _nextVolume;
titleText[format["Sound adjusted to %1%2",_nextVolume*100,"%"],"PLAIN DOWN"];