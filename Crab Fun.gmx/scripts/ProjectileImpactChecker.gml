var DamageSource = argument0
var ProjectileDamage = argument1
var ProjectileImpact = argument2  //0.8-1 for guns, 1-3 for explosions
var ProjectileType = argument3 //PROJECTILE TYPES: 1 NonPierce, 2 Pierce, 3 Explosion


//DIRECT HIT ON AN ENEMY!
if instance_place(x,y,oEnemyBody) {
EnemyHit = instance_nearest (x,y,oEnemyBody)
    //DESTROY THE BULLET
    if ProjectileType = 1 {instance_destroy()}    
    //DMG THE FOE
    with EnemyHit 
        {
        if DamageEnemy(ProjectileDamage)
            {
            AttackSource = DamageSource
            YesEnemyIsDead = true
            WeaponImpact = ProjectileImpact
            oPersistentValues.CrabsKilled++
            break;
            }
            else
            {
            image_index = image_number-4
            }
    }
}
    
//NUDGE DEAD BODIES
if instance_place(x,y,oDeadEnemy) {
EnemyToNudge = instance_nearest(x,y,oDeadEnemy)
    var xx,yy;
    xx = EnemyToNudge.x
    yy = EnemyToNudge.y
    
    with EnemyToNudge if Nudged = false {
    direction = point_direction (DamageSource.x,DamageSource.y,xx,yy)
    speed = ProjectileImpact
    friction = EnemyWeight
    Nudged = true
    } else {}
}

//DIRECT HIT ON A CRATE
if instance_place(x,y,oCrate)
{
    {
    CrateToBlowUp = instance_place(x,y,oCrate)
    if ProjectileType = 1 {instance_destroy()}    
    }
    with (CrateToBlowUp)
    {
    if DamageEnemy(ProjectileDamage)
        {
        CrateDestroyed(CrateColour,CrateScale,CrateRotation)
        break;
        }
        else
            {
            image_index = image_number-4
            image_speed = 1
            }
    }
}


if instance_place(x,y,oSolidObject) && ProjectileType != 3 {instance_destroy()}

