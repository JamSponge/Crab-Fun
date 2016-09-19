#define CrateDestroyed
Colour = argument0
Scale = argument1
Rotation = argument2

CalculatedBaseScale = (Scale/1.5)

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

//CRATE EXPLODES INTO PIECES! THIS IS ABOUT THE PIECES, YO. SAME LANGUAGE AS SPLATS BECAUSE YOLO

AttackSource = instance_nearest(x,y,oExplosion) || instance_nearest(x,y,oPlayer)
BitsCreated = 0
TotalBits = 4
ExtraChunkChance = random_range(0,10)

while BitsCreated < TotalBits {BitsCreated = BitsCreated+1
NewBitSmall = instance_create(x,y,oDestroyedCrate)
NewBitSmall.Sprite = sCrateShrapnelSmall
NewBitSmall.image_xscale = Scale*2
NewBitSmall.image_yscale = Scale*2
NewBitSmall.BaseScale = CalculatedBaseScale
NewBitSmall.direction = point_direction(AttackSource.x,AttackSource.y, x,y)+random_range(2,270)
NewBitSmall.speed= random_range(1000,3000)/room_speed
NewBitSmall.image_blend=Colour
NewBitSmall.AnimationFrameToUse = random_range(0,4)

NewBitSmall2 = instance_create(x,y,oDestroyedCrate)
NewBitSmall2.Sprite = sCrateShrapnelSmall
NewBitSmall2.image_xscale = Scale*2
NewBitSmall2.image_yscale = Scale*2
NewBitSmall2.BaseScale = CalculatedBaseScale
NewBitSmall2.direction = point_direction(AttackSource.x,AttackSource.y, x,y)-random_range(2,270)
NewBitSmall2.speed= random_range(1000,3000)/room_speed
NewBitSmall2.image_blend=Colour
NewBitSmall2.AnimationFrameToUse = random_range(0,4)
}

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
        NewCone.direction = point_direction(AttackSource.x,AttackSource.y, x,y)+random_range(2,270)
        NewCone.speed= 2000/room_speed
        ConeNum--
        }
        CrateContains = 0
    }

}

//EXTRA BIG CHUNK & SMOKE!
if BitsCreated >= TotalBits {
//PUFF OF SMOKE
NewSmoke = instance_create(x,y,oSmokePuff)
NewSmoke.direction = random_range (0,359)
NewSmoke.image_xscale= random_range(2,3)
NewSmoke.image_yscale=image_xscale

//BIG CHUNK
NewBitBig = instance_create(x,y,oDestroyedCrate)
NewBitBig.Sprite = sCrateShrapnelBig
NewBitBig.image_xscale = Scale
NewBitBig.image_yscale = Scale
NewBitBig.BaseScale = CalculatedBaseScale
NewBitBig.direction = point_direction(AttackSource.x,AttackSource.y, x,y)choose(+random_range(25,45),-random_range(25,45))
NewBitBig.speed= random_range(800,2000)/room_speed
NewBitBig.image_blend=Colour
NewBitBig.AnimationFrameToUse = 0

//EXTRA BIG CHUNK - SOMETIMES
if ExtraChunkChance > 7 {
NewBitBig2 = instance_create(x,y,oDestroyedCrate)
NewBitBig2.Sprite = sCrateShrapnelBig
NewBitBig2.image_xscale = Scale
NewBitBig2.image_yscale = Scale
NewBitBig2.BaseScale = CalculatedBaseScale
NewBitBig2.direction = point_direction(AttackSource.x,AttackSource.y, x,y)choose(+random_range(25,45),-random_range(25,45))
NewBitBig2.speed= random_range(800,2000)/room_speed
NewBitBig2.image_blend=Colour
NewBitBig2.AnimationFrameToUse = 0
}
}

#define ShrapnelCreator


