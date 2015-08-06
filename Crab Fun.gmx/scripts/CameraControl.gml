//CAMERA CONTROLS V1.4
ZoomLevelW = ScreenWidth/1000*ZoomLevel
ZoomLevelH = ScreenHeight/1000*ZoomLevel

view_wview = ScreenWidth-ZoomLevelW
view_hview = ScreenHeight-ZoomLevelH

//ZOOM IN WITH SHOOTING
if mouse_check_button(mb_left){
ZoomLevel += (ZoomMax - ZoomLevel) *0.01;
}

//ZOOM OUT - SPEED RELATIVE TO SHOOTING
if mouse_check_button(mb_right){
ZoomLevel += (0 - ZoomLevel) *0.1;
}
//CAM CONTROL PARAMETERS
if  ZoomLevel >= ZoomMax{
ZoomLevel = ZoomMax}
if ZoomLevel <=0{
ZoomLevel = 0}

//FIX CAMERA BOUNDS
if view_wview >= ScreenWidth {
view_wview = ScreenWidth
}
if view_hview >= ScreenHeight {
view_hview = ScreenHeight
}

    //CLICK CLICK CLICK CLICK ZOOM
    if oPlayer.ShotsFiredCount >= 22 and mouse_check_button(mb_left){
    view_wview = ScreenWidth/1.80
    view_hview = ScreenHeight/1.80
    }
    if oPlayer.ShotsFiredCount >= 23 and mouse_check_button(mb_left){
    view_wview = ScreenWidth/1.90
    view_hview = ScreenHeight/1.90
    }
    if oPlayer.ShotsFiredCount >= 24 and mouse_check_button(mb_left){
    view_wview = ScreenWidth/2.1
    view_hview = ScreenHeight/2.1
    }