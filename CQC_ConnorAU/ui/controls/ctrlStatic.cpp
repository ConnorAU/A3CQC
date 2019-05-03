class CQC_ctrlStatic: CQC_ctrlDefaultText
{
	type = CT_STATIC; // Type

	colorBackground[] = {0,0,0,0}; // Fill color

	text = ""; // Displayed text
	lineSpacing = 1; // When ST_MULTI style is used, this defines distance between lines (1 is text height)
	fixedWidth = 0; // 1 (true) to enable monospace
	colorText[] = {1,1,1,1}; // Text color
	colorShadow[] = {0,0,0,1}; // Text shadow color (used only when shadow is 1)

	moving = 0; // 1 (true) to allow dragging the whole display by the control

	autoplay = 0; // Play video automatically (only for style ST_PICTURE with text pointing to an .ogv file)
	loops = 0; // Number of video repeats (only for style ST_PICTURE with text pointing to an .ogv file)

	tileW = 1; // Number of tiles horizontally (only for style ST_TILE_PICTURE)
	tileH = 1; // Number of tiles vertically (only for style ST_TILE_PICTURE)

	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";

	onVideoStopped = "";
};
class CQC_ctrlStaticPicture: CQC_ctrlStatic
{
	style = ST_PICTURE;
};
class CQC_ctrlStaticPictureKeepAspect: CQC_ctrlStaticPicture
{
	style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};
class CQC_ctrlStaticPictureTile: CQC_ctrlStatic
{
	style = ST_TILE_PICTURE;
};
class CQC_ctrlStaticFrame: CQC_ctrlStatic
{
	style = ST_FRAME;
};
class CQC_ctrlStaticLine: CQC_ctrlStatic
{
	style = ST_LINE;
};
class CQC_ctrlStaticMulti: CQC_ctrlStatic
{
	style = ST_MULTI + ST_NO_RECT;
};
class CQC_ctrlStaticBackground: CQC_ctrlStatic
{
	colorBackground[] = {COLOR_BACKGROUND_RGBA};
};
class CQC_ctrlStaticOverlay: CQC_ctrlStatic
{
	colorBackground[] = {COLOR_OVERLAY_RGBA};
};
class CQC_ctrlStaticTitle: CQC_ctrlStatic
{
	moving = 1;
	//colorBackground[] = {1,1,1,0.1};
	colorBackground[] = {COLOR_ACTIVE_RGBA};
	colorText[] = {1,1,1,1};
	colorShadow[] = {0,0,0,0};
};
class CQC_ctrlStaticFooter: CQC_ctrlStatic
{
	colorBackground[] = {0,0,0,0.3};
};
class CQC_ctrlStaticBackgroundDisable: CQC_ctrlStatic
{
	x = -4;
	y = -2;
	w = 8;
	h = 4;
	colorBackground[] = {1,1,1,0.5};
};
class CQC_ctrlStaticBackgroundDisableTiles: CQC_ctrlStaticPictureTile
{
	x = -4;
	y = -2;
	w = 8;
	h = 4;
	text = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
	tileW = 8 / (32 * pixelW);
	tileH = 4 / (32 * pixelH);
	colorText[] = {1,1,1,0.05};
};
