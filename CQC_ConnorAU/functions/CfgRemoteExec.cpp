/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class CfgRemoteExec {
	class Functions {
		mode = 1;
		jip = 1;

		class bis_fnc_dynamicGroups {allowedTargets = 0;};
		class bis_fnc_debugconsoleexec {allowedTargets = 0;};

		class CAU_xChat_fnc_sendMessage {allowedTargets=0;};
		class CAU_xChat_fnc_log {allowedTargets=2;};
		class CAU_xChat_fnc_radioChannelCustom {allowedTargets=2;};
	};
	class Commands {
		class switchMove {allowedTargets = 0;};
	};
};