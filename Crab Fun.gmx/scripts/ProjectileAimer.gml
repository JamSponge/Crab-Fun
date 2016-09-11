CurrentGun= argument0

with (oCrossHair)
{
DrawAimingBeam = true
/*var distance;
distance = point_distance(oPlayer.x,oPlayer.y,mouse_x,mouse_y)*/

var aimbarlen, maxaimbarlen, lentoimpactx, lentoimpacty;
aimbarlen = 0
maxaimbarlen = 550
lentoimpactx = oPlayer.x+lengthdir_x(aimbarlen,oPlayer.Facing)
lentoimpacty = oPlayer.y+lengthdir_y(aimbarlen,oPlayer.Facing)

//See where the line hits something
while (aimbarlen < maxaimbarlen && !position_meeting(lentoimpactx,lentoimpacty,oEnemy))
    {
    //Extend the line!
    aimbarlen++
    
        //Shift the laser pointer to that point too, for clarity!
    x = lentoimpactx
    y = lentoimpacty
    }
    
}
