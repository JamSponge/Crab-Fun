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
if ScreenWidth*1.5 < view_wview{
view_wview = ScreenWidth*1.5
}
if ScreenHeight*1.5 < view_hview {
view_hview = ScreenHeight*1.5
}
if view_wview < ScreenWidth/1.8 {
view_wview = ScreenWidth/1.8
}
if view_hview < ScreenHeight/1.8 {
view_hview = ScreenHeight/1.8
}
