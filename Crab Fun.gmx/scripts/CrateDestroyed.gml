Colour = argument0
Scale = argument1
Rotation = argument2

CalculatedBaseScale = (Scale/1.5)

AttackSource = instance_nearest(x,y,oExplosion) || instance_nearest(x,y,oPlayer)
AttackSourceDir = point_direction(AttackSource.x,AttackSource.y, x,y)

//ANIMATE DESTRUCTION, DECREASE DEPTH
image_speed = 1
depth = depth -100
     //REPLACE WITH DEAD CRATE
     DeadCrate = instance_create (x,y,oDestroyedCrate)
     DeadCrate.Sprite = sDestroyedCrate
     DeadCrate.image_blend = Colour;
     DeadCrate.image_angle = choose (0,90,180,270) + Rotation
     DeadCrate.image_xscale = Scale
     DeadCrate.image_yscale = Scale
     DeadCrate.BaseScale = CalculatedBaseScale
     DeadCrate.AnimationFrameToUse = 0

DestroyCrateParticles(AttackSourceDir-90,AttackSourceDir+90,Colour,Scale)

//WHAT'S IN THE BOX? WHAT'S IN THE BOX? OH GOD. OH JESUS CHRIST. OH GOD.
    //0 = Nothing, 1 = Ice-cream
if CrateContains !=0 
{
if CrateContains = 1
    {
    var ConeNum = 6;
    
        while 0 < ConeNum
        {
        NewCone = instance_create(x,y,oIceCreamCone)
        NewCone.direction = AttackSourceDir+random_range(2,270)
        NewCone.speed= 2000/global.RealGame_Speed
        ConeNum--
        }
        CrateContains = 0
    }
if CrateContains = 2
    {
    instance_create(x,y,oMachineGunPickup)
    }
}
