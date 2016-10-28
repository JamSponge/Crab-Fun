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
    var EnemyScale = random_range(0.3,0.6)
    var EnemyWeight = EnemyScale*3
    var EnemySpeed = 300/room_speed
    var EnemyMaxSpeed = 600/room_speed
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
    var EnemyScale = random_range(0.6,0.8)
    var EnemyWeight = EnemyScale*2
    var EnemySpeed = 350/room_speed
    var EnemyMaxSpeed = 700/room_speed
    var EnemyTurnSpeed = choose(0.6,0.7,0.8)
    var EnemyAccuracy = 0.2
    var IceCreamValue = 1
    }
    
    //Choose an enemy type and spawn it, add it to array
    var i = array_height_2d(EnemyArray); {
    NewEnemy = instance_create (SpawnX,SpawnY,SpawnType)
    NewEnemy.image_angle = StartingDir
    EnemyArray[i,EnemyBody] = NewEnemy
    NewEnemy.EnemyID = i
    NewEnemy.YesEnemyIsDead = false
    //HEALTH & WEIGHT REMAINS IN THE BODY. MAKES SENSE, SORTA.
    NewEnemy.EnemyHealth = EnemyHealth
    NewEnemy.EnemyWeight = EnemyWeight
    NewEnemy.image_xscale = EnemyScale
    NewEnemy.image_yscale = EnemyScale
    NewEnemyLegs = instance_create (SpawnX,SpawnY,SpawnTypeLegs)
    NewEnemyLegs.image_angle = StartingDir
    NewEnemyLegs.image_xscale = EnemyScale
    NewEnemyLegs.image_yscale = EnemyScale
    //MOVEMENT ATTRIBUTES ARE HIDDEN IN THE LEGS!
    NewEnemyLegs.IceCreamValue = IceCreamValue
    NewEnemyLegs.EnemyHealth = EnemyHealth 
    NewEnemyLegs.EnemySpeed = EnemySpeed
    NewEnemyLegs.EnemyMaxSpeed = EnemyMaxSpeed
    NewEnemyLegs.EnemyTurnSpeed = EnemyTurnSpeed
    NewEnemyLegs.EnemyAccuracy = EnemyAccuracy
    
    EnemyArray[i,EnemyLegs] = NewEnemyLegs
    EnemyArray[i,EnemyCollisionTIMERVALUE] = 0 //This relates to collision checks for other crabs
    EnemyArray[i,EnemyDeathAnimation] = SpawnTypeDeathAnim
    EnemyArray[i,EnemyDeathSpeed] = EnemyDeathSpeed
    }

