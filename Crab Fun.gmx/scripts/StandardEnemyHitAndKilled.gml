if HitByProjectileCheck()
{
AttackSource = oPlayer
with IncomingProjectile {instance_destroy()}
EnemyDestroyedSplatter(oSmallBits,oBitsSplat,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)
if DamageEnemy() {instance_destroy() with (Owner) {instance_destroy()}
}
}

//You've been hit! By a bloody explosion!
if instance_place(x,y,oExplosion){
AttackSource = instance_nearest(x,y,oExplosion)
EnemyDestroyedSplatter(oSmallBits,oBitsSplat,oBitsSplat2,EnemySplatR,EnemySplatG,EnemySplatB,AttackSource)
if DamageEnemy() {instance_destroy() with (Owner) {instance_destroy()}
}
}

