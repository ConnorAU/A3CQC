/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class CQC {
    class eventhandlers {
		file="functions\eventhandlers";
        class arsenalOpened {};
        class arsenalClosed {};
        class inventoryOpened {};
        class keyDown {};
        class keyUp {};
        class handleDamage {};
        class firedMan {};
        class killed {};
        class respawn {};
        class draw3D {};
    };
    class scripts {
		file="functions\scripts";
        class earplugs {};
        class jump {};
        class holster {};
        class discord {};
        class repackAmmo {};
    };
    class setup {
		file="functions\setup";
        class initClient {postInit=1;};
        class initServer {postInit=1;};
    };
    class ui {
		file="functions\ui";
        class displayHelp {};
        class displayOptions {};
        class displaySpawns {};
        class displayVehicles {};
    };
};