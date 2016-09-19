#define StandardEnemyHitAndKilled
//OH BOY HE'S DEAD - SPLATTER!
if YesEnemyIsDead = true {

EnemyDestroyedSplatter(oSmallBits,oBitsSplat2,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)

//CREATE DEAD ENEMY SPRITE
var Eangle, Escale, Edir;
Eangle = oEnemyArrayController.EnemyArray[EnemyID,0].Facing;
Escale = oEnemyArrayController.EnemyArray[EnemyID,0].image_xscale;
Edir = point_direction(AttackSource.x,AttackSource.y,oEnemyArrayController.EnemyArray[EnemyID,0].x,oEnemyArrayController.EnemyArray[EnemyID,0].y)
Edeathspeed = oEnemyArrayController.EnemyArray[EnemyID,4]

DeadEnemy = instance_create(x,y,oEnemyArrayController.EnemyArray[EnemyID,3])
DeadEnemy.image_angle = Eangle + choose(3,6,-3,-6)
DeadEnemy.image_xscale = Escale
DeadEnemy.image_yscale = Escale
DeadEnemy.direction = Edir
DeadEnemy.speed = WeaponImpact
DeadEnemy.friction = EnemyWeight
DeadEnemy.SpinType = choose (0.5,-0.5,1,-1,)
DeadEnemy.Dead=false
DeadEnemy.Nudged=false
DeadEnemy.EnemyWeight = EnemyWeight*0.8
DeadEnemy.alarm[0] = 3000/room_speed
//TELL CAMERA TO TRACK DEAD ENEMY
oCamera.KillerTracker = DeadEnemy

//REMOVE ARRAY INFO
with (oEnemyArrayController.EnemyArray[EnemyID,1])
{instance_destroy()}
oEnemyArrayController.EnemyArray[EnemyID,0] = 0
oEnemyArrayController.EnemyArray[EnemyID,1] = 0
oEnemyArrayController.EnemyArray[EnemyID,2] = 0
oEnemyArrayController.EnemyArray[EnemyID,3] = 0
oEnemyArrayController.EnemyArray[EnemyID,4] = 0
instance_destroy()}

else{}

#define EnemyDestroyedSplatter
//SET CACHE LIMIT FOR COLOUR VARIATIONS?!

SmallSplatterUsed = argument0
BigSplatterUsed = argument1
SecondBigSplatterUsed = argument2
SplatterColourR = argument3
SplatterColourG = argument4

SplatterColourB = argument5
AttackSource = argument6

while BitsCreated < TotalBits {BitsCreated = BitsCreated+1
NewBitSmall = instance_create(x,y,SmallSplatterUsed)
NewBitSmall.image_blend = make_colour_rgb (SplatterColourR,SplatterColourG,SplatterColourB)
NewBitSmall.direction = point_direction(AttackSource.x,AttackSource.y, x,y)+random_range(5,35)
NewBitSmall.image_angle=direction
NewBitSmall.speed= 2000/room_speed
NewBitSmall.SecondsUntilFadeStarts = 4

NewBitSmall2 = instance_create(x,y,SmallSplatterUsed)
NewBitSmall2.image_blend = make_colour_rgb (SplatterColourR,SplatterColourG,SplatterColourB)
NewBitSmall2.direction = point_direction(AttackSource.x,AttackSource.y, x,y)-random_range(5,35)
NewBitSmall2.image_angle=direction
NewBitSmall2.speed= 2000/room_speed
NewBitSmall2.SecondsUntilFadeStarts = 4
}

if BitsCreated >= TotalBits{
NewBitSplat = instance_create(x,y,BigSplatterUsed)
NewBitSplat.image_blend = make_colour_rgb (SplatterColourR,SplatterColourG,SplatterColourB)
NewBitSplat.image_angle = point_direction(AttackSource.x,AttackSource.y, x,y)+-random(3)
NewBitSplat.SecondsUntilFadeStarts = 4
NewBitSplat2 = instance_create(x,y,BigSplatterUsed)
NewBitSplat2.image_blend = make_colour_rgb (SplatterColourR,SplatterColourG,SplatterColourB)
NewBitSplat2.image_angle = point_direction(AttackSource.x,AttackSource.y, x,y)+-random(30)
NewBitSplat2.SecondsUntilFadeStarts = 4
audio_play_sound_at(choose(aDeathSplat1,aDeathSplat2,aDeathSplat3,aDeathSplat4,aDeathSplat5,aDeathSplat6,aDeathSplat7,aDeathSplat8,aDeathSplat9),x,y,0,100,300,1,false,1)

}
