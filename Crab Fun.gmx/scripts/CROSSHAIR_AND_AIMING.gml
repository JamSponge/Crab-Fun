#define CROSSHAIR_AND_AIMING

#define CrossHairDraw
CrossHairSprite0 = argument0
CrossHairSprite1 = argument1

        //THIS IS A DRAW EVENT - SEE NEXT TAB FOR STEP SETUP

if DrawingTheLine = true && instance_exists(oPlayer)
{
//Draw the line!
draw_line_width_colour(PlayerX,PlayerY,EndOfLineX,EndOfLineY,aimbarwidth,c_fuchsia,c_purple)   

//Draw the ExplosionEstimater
draw_sprite_ext(sExplosionEstimater,image_index,EndOfLineX,EndOfLineY,CrossHairDotScale,CrossHairDotScale,0,c_white,1)

}


//NO WEIRD STUFF, JUST THE NORMAL CROSSHAIR PLS

draw_sprite_ext(CrossHairSprite0,image_index,x,y,CrossHairDotScale,CrossHairDotScale,0,c_white,0.8)
draw_sprite_ext(CrossHairSprite1,image_index,x,y,CrossHairDotScale,CrossHairDotScale,0,c_white,0.8)


#define CrossHairSetup
//STANDARD CROSSHAIR SETUP

//PUT IT PHYSICALLY AT MOUSE POINTER, EVEN IF IT ISN'T ALWAYS *DRAWN* THERE
x = mouse_x
y = mouse_y


if instance_exists(oPlayer)
{
    var LaserDistance, LaserDistanceMin, LaserDistanceMax;
    LaserDistance = distance_to_point(oCamera.x,oCamera.y)
    LaserDistanceMin = 100
    LaserDistanceMax = 1000
    CrossHairDotScale = LaserDistance/500
    PointerX = x
    PointerY = y
    PlayerX = oPlayer.x
    PlayerY = oPlayer.y
    
    if LaserDistance <= LaserDistanceMin{LaserDistance = LaserDistanceMin}
    if LaserDistanceMax <= LaserDistance{LaserDistance = LaserDistanceMax}
    if CrossHairDotScale  <= 0.9{CrossHairDotScale =0.9}
    if 1.5 < CrossHairDotScale{CrossHairDotScale =1.5}
    
    
    
    //AIMING A GRENADE, ETC - BRING UP THE BAR!
    DrawingTheLine = false
    if DrawAimingBeam = true && instance_exists(oPlayer)
    {
    
    /*TIGHTEN THE MOUSE AIM WINDOW
    var TightWidth, TightHeight;
    TightWidth = oCamera.TightWidth
    TightHeight = oCamera.TightHeight
    if PointerX < PlayerX - TightWidth {x = PlayerX - TightWidth}
    if PlayerX + TightWidth < PointerX {x = PlayerX + TightWidth}
    if PointerY < PlayerY - TightHeight {y = PlayerX - TightHeight}
    if PlayerY + TightHeight < PointerY {y = PlayerX + TightHeight}
    */
    
    /*var distance;
    distance = point_distance(oPlayer.x,oPlayer.y,PointerX,PointerY)*/
    
    var maxaimbarlen;
    aimbarlen = 0
    maxaimbarlen = 600
    
    //See where the line hits something
    while 
    (aimbarlen < maxaimbarlen && !position_meeting (PlayerX+lengthdir_x(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY)),PlayerY+lengthdir_y(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY)),oEnemy))
        { 
        DrawingTheLine = true
            //CHANGE GIRTH LOL
            aimbarwidth = (aimbarlen-(aimbarlen*2)+ maxaimbarlen) div 60
            if aimbarwidth <= 1 {aimbarwidth = 1}
            if 8 < aimbarwidth {aimbarwidth = 8}
        //Extend the line!
        aimbarlen += 4
        EndOfLineX = PlayerX+lengthdir_x(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY))
        EndOfLineY = PlayerY+lengthdir_y(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY))
        }
    /*draw_sprite_ext(CrossHairSprite0,image_index,PlayerX+lengthdir_x(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY)),PlayerY+lengthdir_y(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY)),CrossHairDotScale,CrossHairDotScale,0,c_white,0.8)
    draw_sprite_ext(CrossHairSprite1,image_index,PlayerX+lengthdir_x(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY)),PlayerY+lengthdir_y(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY)),CrossHairDotScale,CrossHairDotScale,0,c_white,0.8)
    */
    }
}
