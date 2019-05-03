/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class CQCDisplaySpawns {
    INIT_DISPLAY(CQC_fnc_displaySpawns)

    #define DIALOG_W 63
    #define DIALOG_H 45
    #define FOOTER_H (SZ_sizeEx_034)*1.5
    class controlsBackground {
        class title: CQC_ctrlStaticTitle {
            idc=1;

            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H)-(SZ_sizeEx_034);
            w=PX_WA(DIALOG_W);
            h=SZ_sizeEx_034;
        };
        class background: CQC_ctrlStaticBackground {
            idc=-1;

            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H);
            w=PX_WA(DIALOG_W);
            h=PX_HA(DIALOG_H);
        };
        class footer: CQC_ctrlStaticFooter {
            idc=-1;

            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H)+(PX_HA(DIALOG_H))-(FOOTER_H);
            w=PX_WA(DIALOG_W);
            h=FOOTER_H;
        };
    };
    class controls {
        class body: CQC_ctrlListbox {
            idc=2;

            //colorbackground[]={1,0,0,1};

            x=CENTER_XA(DIALOG_W)+(PX_WA(1));
            y=CENTER_YA(DIALOG_H)+(PX_HA(1));
            w=(PX_WA(DIALOG_W))-(PX_WA(2));
            h=(PX_HA(DIALOG_H))-(FOOTER_H)-(PX_HA(2));
        };
        class button1: CQC_ctrlButton {
            idc=3;

            x=CENTER_XA(DIALOG_W)+(PX_WA(2))+(PX_WA(30));
            y=CENTER_YA(DIALOG_H)+(PX_HA(DIALOG_H))-(SZ_sizeEx_034*1.25);
            w=PX_WA(30);
            h=SZ_sizeEx_034;
        };
        class button2: button1 {
            idc=4;

            x=CENTER_XA(DIALOG_W)+(PX_WA(1));
        };
    };
};