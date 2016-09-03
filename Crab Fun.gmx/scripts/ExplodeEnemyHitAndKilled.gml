//FOR IMPACT OF BULLET ANIMATION, SEE INVISIBLE BULLET BAR STEP

if HitByProjectileCheck()
{
AttackSource = oPlayer
with IncomingProjectile {instance_destroy()}

if DamageEnemy(1){
//SPLATTER
EnemyDestroyedSplatter(oSmallBits,oBitsSplat,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)
//CREATE DEAD ENEMY SPRITE
var Eangle, Escale, Edir;
Eangle = oEnemyArrayController.EnemyArray[EnemyID,1].image_angle;
Escale = 0.6
Edir = point_direction(oPlayer.x,oPlayer.y,oEnemyArrayController.EnemyArray[EnemyID,1].x,oEnemyArrayController.EnemyArray[EnemyID,1].y)

DeadEnemy = instance_create(x,y,oEnemyArrayController.EnemyArray[EnemyID,3])
DeadEnemy.image_angle = Eangle + choose(3,6,-3,-6)
DeadEnemy.image_xscale = Escale
DeadEnemy.image_yscale = Escale
DeadEnemy.direction = Edir
DeadEnemy.speed = 3000/room_speed
DeadEnemy.friction = choose(5,6,7,8,9)
DeadEnemy.SpinType = choose (2,-2,5,-5)
DeadEnemy.Dead=false
DeadEnemy.alarm[0] = room_speed

with (oEnemyArrayController.EnemyArray[EnemyID,1])
{instance_destroy()}
oEnemyArrayController.EnemyArray[EnemyID,0] = 0
oEnemyArrayController.EnemyArray[EnemyID,1] = 0
oEnemyArrayController.EnemyArray[EnemyID,2] = 0
oEnemyArrayController.EnemyArray[EnemyID,3] = 0
instance_destroy()}
}

//You've been hit! By a bloody explosion!
if instance_place(x,y,oExplosion){ 
AttackSource = instance_nearest(x,y,oExplosion)
//Check frame in explode animation are actually explosive
if AttackSource.image_index > 3 and AttackSource.image_index <8 {
//Make it so splatters go away from the explosion
EnemyDestroyedSplatter(oSmallBits,oBitsSplat,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)
if DamageEnemy(5){
with (oEnemyArrayController.EnemyArray[EnemyID,1])
{instance_destroy()}
oEnemyArrayController.EnemyArray[EnemyID,0] = 0
oEnemyArrayController.EnemyArray[EnemyID,1] = 0
oEnemyArrayController.EnemyArray[EnemyID,2] = 0
oEnemyArrayController.EnemyArray[EnemyID,3] = 0
instance_destroy()}
}
}
