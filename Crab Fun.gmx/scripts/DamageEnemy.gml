Damage = argument0

EnemyHealth = EnemyHealth - Damage

if EnemyHealth <=0 and instance_exists(oPlayer) {return true} else {return false}
