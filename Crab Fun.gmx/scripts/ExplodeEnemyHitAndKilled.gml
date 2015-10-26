//FOR IMPACT OF BULLET ANIMATION, SEE INVISIBLE BULLET BAR STEP

if HitByProjectileCheck()
{
AttackSource = oPlayer
with IncomingProjectile {instance_destroy()}

if DamageEnemy(1){
EnemyDestroyedSplatter(oSmallBits,oBitsSplat,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)
with (oEnemyArrayController.EnemyArray[EnemyID,1])
{instance_destroy()}
oEnemyArrayController.EnemyArray[EnemyID,0] = 0
oEnemyArrayController.EnemyArray[EnemyID,1] = 0
oEnemyArrayController.EnemyArray[EnemyID,2] = 0
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
instance_destroy()}
}
}
