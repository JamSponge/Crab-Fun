EnemyHealth = EnemyHealth - 1

if EnemyHealth <=0 and instance_exists(oPlayer) {return true} else {return false}