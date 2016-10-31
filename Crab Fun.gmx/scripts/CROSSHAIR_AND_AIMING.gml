#define CROSSHAIR_AND_AIMING


#define CrossHairDraw
CrossHairSprite0 = argument0
CrossHairSprite1 = argument1

        //THIS IS A DRAW EVENT - SEE NEXT TAB FOR STEP SETUP

if DrawingTheLine = true && instance_exists(oPlayer) && instance_exists(oImpactTracker)
{
//Draw the line!
/*draw_line_width_colour(PlayerX,PlayerY,EndOfLineX,EndOfLineY,aimbarwidth,c_fuchsia,c_purple)  */ 

//Draw the ExplosionEstimater
draw_sprite_ext(sExplosionEstimater,image_index,oImpactTracker.x,oImpactTracker.y,ExplosionSizeVisualiser,ExplosionSizeVisualiser,0,c_white,ImpactTrackerAlpha)

//DRAW THE POWER BAR
draw_sprite_ext(sExplosionEstimaterPart2,image_index,oPlayer.x,oPlayer.y,PowerBarXScale,PowerBarYScale,PowerBarDir,c_white,PowerBarAlpha)


//DEBUG DRAW
//draw_text(oPlayer.x,oPlayer.y,ExplosionSizeVisualiser)

}



//NO WEIRD STUFF, JUST THE NORMAL CROSSHAIR PLS

draw_sprite_ext(CrossHairSprite0,image_index,x,y,CrossHairDotScale,CrossHairDotScale,0,c_white,0.8)
draw_sprite_ext(CrossHairSprite1,image_index,x,y,CrossHairDotScale,CrossHairDotScale,0,c_white,0.8)


#define CrossHairSetup
//STANDARD CROSSHAIR SETUP

//PUT IT PHYSICALLY AT MOUSE POINTER, EVEN IF IT ISN'T ALWAYS *DRAWN* THERE
x = mouse_x
y = mouse_y

    //ALWAYS START BY ASSUMING THE INVISIBLE LINE ISN'T BEING DRAWN, I GUESS?
    DrawingTheLine = false
    
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
    if DrawAimingBeam = true && instance_exists(oPlayer)
    {
    
    //HOW BIG IS THIS "BIG-A-BAD-A-BOOM", EXACTLY?
    ExplosionSizeVisualiserMax = ExplosionSize
    
    //TWEENTWEAKS FOR IMPACT TRACKER ETC (Movement in Impact Tracker)
    AlphaTweenSpeed = 0.2
    ScaleTweenSpeedIn = 0.2
    ScaleTweenSpeedOut = 0.1
    
    var maxaimbarlen;
    aimbarlen = 0
    maxaimbarlen = 1200
    
    //See where the line hits something
    while 
    (aimbarlen < maxaimbarlen && !position_meeting (PlayerX+lengthdir_x(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY)),PlayerY+lengthdir_y(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY)),oGlobalSolid))
        { 
        DrawingTheLine = true
        //Extend the line!
        aimbarlen += 15
        EndOfLineX = PlayerX+lengthdir_x(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY))
        EndOfLineY = PlayerY+lengthdir_y(aimbarlen,point_direction(PlayerX,PlayerY,PointerX,PointerY))
        //GIVE TARGET X AND Y TO TRACKER
        oImpactTracker.TargetX = EndOfLineX
        oImpactTracker.TargetY = EndOfLineY
        }
    
    //IF IMPACT IS AN ENEMY, THEN MAKE THE IMPACT RING SWELL. SWOLLEN RINGS! HAH, FILTH MATE. FILTH.
    
    if maxaimbarlen <= aimbarlen 
    {
    ExplosionSizeVisualiser += (0 - ExplosionSizeVisualiser) *ScaleTweenSpeedOut;
    oImpactTracker.TargetX = x
    oImpactTracker.TargetY = y
    }
    else
    {
    ExplosionSizeVisualiser += (ExplosionSizeVisualiserMax - ExplosionSizeVisualiser) *ScaleTweenSpeedIn;
    }
    //OUTER LIMITS
    if ExplosionSizeVisualiser <= 0.8 {ExplosionSizeVisualiser = 0.8}
    if ExplosionSizeVisualiserMax <= ExplosionSizeVisualiser {ExplosionSizeVisualiser = ExplosionSizeVisualiserMax} 
    //ALPHA FADE
    if ExplosionSizeVisualiser <= ExplosionSizeVisualiserMax*0.75
    {
    ImpactTrackerAlpha += (0.3 - ImpactTrackerAlpha) *AlphaTweenSpeed;
    }
    else
    if ImpactTrackerAlpha <1
    {
    ImpactTrackerAlpha += (1 - ImpactTrackerAlpha) *AlphaTweenSpeed;
    }
    
        //BASIC DIRECTIONAL POWER-BAR, NO FUNNY BUSINESS
        PowerBarDir = point_direction(PlayerX,PlayerY,PointerX,PointerY)
        PowerBarXScale += (ExplosionSize - PowerBarXScale) *ScaleTweenSpeedIn;
        PowerBarYScale += (ExplosionSize - PowerBarXScale) *ScaleTweenSpeedOut;
        PowerBarAlpha += (1 - 0) *0.01;
    
    }

}
else
{
CrossHairDotScale = 1
}

#define ImpactTracker
if instance_exists (oPlayer)
{
    if oCrossHair.DrawingTheLine = false
    {
    TargetX = oPlayer.x
    TargetY = oPlayer.y
    }
    
    if oCrossHair.DrawAimingBeam = true
    {
    x += (TargetX - x) *0.2;
    y += (TargetY - y) *0.2;
    }
}