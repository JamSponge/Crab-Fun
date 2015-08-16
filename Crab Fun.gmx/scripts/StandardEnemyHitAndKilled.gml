if HitByProjectileCheck()
{
AttackSource = oPlayer
with IncomingProjectile {instance_destroy()}
EnemyDestroyedSplatter(oSmallBits,oBitsSplat,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)
if DamageEnemy(1) {instance_destroy() with (Owner) {instance_destroy()}
}
}

//You've been hit! By a bloody explosion!
if instance_place(x,y,oExplosion){ 
AttackSource = instance_nearest(x,y,oExplosion)
//Check frame in explode animation are actually explosive
if AttackSource.image_index > 3 and AttackSource.image_index <8 {
//Make it so splatters go away from the explosion
EnemyDestroyedSplatter(oSmallBits,oBitsSplat,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)
if DamageEnemy(5) {instance_destroy() with (Owner) {instance_destroy()}}
}
}
