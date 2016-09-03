//OH BOY HE'S DEAD - SPLATTER!
if YesEnemyIsDead = true {

EnemyDestroyedSplatter(oSmallBits,oBitsSplat,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)

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
