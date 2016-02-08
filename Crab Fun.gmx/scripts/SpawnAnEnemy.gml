EnemyType = argument0
SpawnX = argument1
SpawnY = argument2
StartingDir = argument3

//STANDARD RED CRAB PLS
if EnemyType = 1
    {
    var SpawnType =oStandardEnemyBody 
    var SpawnTypeLegs =oStandardEnemyLegs 
    var SpawnTypeDeathAnim = oStandardEnemyDead
    var EnemyDeathSpeed = room_speed*2
    var EnemyHealth = 1
    var EnemyWeight = 0
    var EnemySpeed = 300/room_speed
    var EnemyTurnSpeed = choose(0.8,0.9,1.0)
    var EnemyAccuracy = 0.2
    var IceCreamValue = 0
    }

//BLUE EXPLODING CRAB PLS
if EnemyType = 2
    {
    var SpawnType =oExplodeEnemyBody 
    var SpawnTypeLegs =oExplodeEnemyLegs 
    var SpawnTypeDeathAnim = oExplodeEnemyDead
    var EnemyDeathSpeed = room_speed
    var EnemyHealth = 3
    var EnemyWeight = 0
    var EnemySpeed = 300/room_speed
    var EnemyTurnSpeed = choose(0.6,0.7,0.8)
    var EnemyAccuracy = 0.2
    var IceCreamValue = 1
    }
    
    //Choose an enemy type and spawn it, add it to array
    var i = array_height_2d(EnemyArray); {
    NewEnemy = instance_create (SpawnX,SpawnY,SpawnType)
    NewEnemy.image_angle = StartingDir
    EnemyArray[i,0] = NewEnemy
    NewEnemy.EnemyID = i
    NewEnemy.YesEnemyIsDead = false
    NewEnemyLegs = instance_create (SpawnX,SpawnY,SpawnTypeLegs)
    NewEnemyLegs.image_angle = StartingDir
    //ALL EMBEDDED ENEMY ATTRIBUTES ARE HIDDEN IN THE LEGS!
    NewEnemyLegs.IceCreamValue = IceCreamValue
    NewEnemyLegs.EnemyHealth = EnemyHealth 
    NewEnemyLegs.EnemyWeight = EnemyWeight
    NewEnemyLegs.EnemySpeed = EnemySpeed
    NewEnemyLegs.EnemyTurnSpeed = EnemyTurnSpeed
    NewEnemyLegs.EnemyAccuracy = EnemyAccuracy
    
    EnemyArray[i,1] = NewEnemyLegs
    EnemyArray[i,2] = 0 //This relates to collision checks for other crabs
    EnemyArray[i,3] = SpawnTypeDeathAnim
    EnemyArray[i,4] = EnemyDeathSpeed
    }

