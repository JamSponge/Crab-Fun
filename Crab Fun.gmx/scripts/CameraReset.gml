//CAMERA CONTROLS V1.4
ZoomLevelW = ScreenWidth/1000*ZoomLevel
ZoomLevelH = ScreenHeight/1000*ZoomLevel

view_wview = ScreenWidth-ZoomLevelW
view_hview = ScreenHeight-ZoomLevelH

//ZOOM OUT
ZoomLevel += (0 - ZoomLevel) *0.1;

//CAM CONTROL PARAMETERS
if  ZoomLevel > ZoomMax{
    ZoomLevel = ZoomMax}
if ZoomLevel <0{
ZoomLevel = 0}

//FIX CAMERA BOUNDS
if view_wview > ScreenWidth {
view_wview = ScreenWidth
}
if view_hview > ScreenHeight {
view_hview = ScreenHeight
}
if view_wview < ScreenWidth/1.8 {
view_wview = ScreenWidth/1.8
}
if view_hview < ScreenHeight/1.8 {
view_hview = ScreenHeight/1.8
}