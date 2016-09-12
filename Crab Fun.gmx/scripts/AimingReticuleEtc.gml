
//AIMING A GRENADE, ETC
if DrawAimingBeam = true
{
/*var distance;
distance = point_distance(oPlayer.x,oPlayer.y,mouse_x,mouse_y)*/

var aimbarlen, maxaimbarlen;
aimbarlen = 0
maxaimbarlen = 700

//See where the line hits something
while (aimbarlen < maxaimbarlen && 
!position_meeting(x+lengthdir_x(aimbarlen,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(aimbarlen,point_direction(x,y,mouse_x,mouse_y)),oEnemy))
    {
    //Draw the line!
    draw_line_width_colour(x,y,x+lengthdir_x(aimbarlen,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(aimbarlen,point_direction(x,y,mouse_x,mouse_y)),5,c_purple,c_fuchsia)
    //Extend the line!
    aimbarlen += 4
    }

    
}
