//WHAT HAVE YOU BEEN HIT BY?

//SHOT BY PLAYER
if HitByProjectileCheck(){ 
with IncomingProjectile {instance_destroy()}
    if DamageEnemy(1){
    AttackSource = oCamera
    YesEnemyIsDead = true
    FrictionRange = choose(0.8,0.9,1)
    oPersistantValues.CrabsKilled++
    }
}

//HIT BY EXPLOSION
if instance_place(x,y,oExplosion){ 
NearestExplosion = instance_nearest(x,y,oExplosion)
//Check frame in explode animation are actually explosive
    if NearestExplosion.image_index > 3 and NearestExplosion.image_index <8 {
        if DamageEnemy(10){
            AttackSource = NearestExplosion
            YesEnemyIsDead = true
            FrictionRange = choose(1,2,3)
            oPersistantValues.CrabsKilled++
        }
    }
}

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
DeadEnemy.speed = 1200/room_speed
DeadEnemy.friction = FrictionRange
DeadEnemy.SpinType = choose (0.5,-0.5,1,-1,)
DeadEnemy.Dead=false
DeadEnemy.alarm[0] = Edeathspeed
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
