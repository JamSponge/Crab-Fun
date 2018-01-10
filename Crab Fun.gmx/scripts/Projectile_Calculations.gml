#define Projectile_Calculations


#define ShootAGun
//TIMER BETWEEN SHOTS, MUST RUN EACH FRAME
TimeSinceLastShot = TimeSinceLastShot +1/global.RealGame_Speed

//ONTO THE ACTUAL SHOOTIN'
if mouse_check_button(mb_left)
    {
        //IS IT TIME TO SHOOT?
        if TimeSinceLastShot >= RateOfFire
        {
        
        //DO YOU HAVE AMMO?
            
            //NO
            if CanShoot=(false)
            {
            audio_play_sound(OutOfAmmoSFX,100,false)
            ShotsFiredCount = ShotsFiredCount + 1
            TimeSinceMouseReleased = 0
            TimeSinceLastShot = 0
            }
            else 
                //YES
                {
                //CREATE A PROJECTILE POW POW POW
                ProjectileCreation()
                
                //INCREASE NUMBER OF SHOTS FIRED
                ShotsFiredCount = ShotsFiredCount + 1
                //RESET TIMER
                TimeSinceLastShot = 0
                TimeSinceMouseReleased = 0
                    
                    //Shots Fired Hits Max!
                    if ShotsFiredCount >= ShotsFiredCountMax
                    {
                    ShotsFiredCount = ShotsFiredCountMax
                    CanShoot=false
                    }
                }
        }
    }


    /*Code to stop people from tapping button!
    if !mouse_check_button(mb_left)
    {
    TimeSinceMouseReleased =  TimeSinceMouseReleased +1/global.RealGame_Speed
    }
    if ShotsFiredCount <= 0 {ShotsFiredCount =0}


#define ProjectileCreation
var xx,yy,ShotSound,BulletScale
xx = x + lengthdir_x(50, image_angle)
yy = y + lengthdir_y(50, image_angle)
ShotSound = 0
    
     //PROJECTILE CREATION
    //MUZZLE FLASH
    Particle_Burst(BlastParticle,image_angle-BlastP_Angle,image_angle+BlastP_Angle,xx,yy)
    
    //SCREEN SHAKE
        oCamera.ShakeAmount = WeaponScreenShake
        oCamera.DirShakeChance = DirShakeChance
        with (oCamera) {
        screenshake = true
        alarm[0]=300/global.RealGame_Speed
        if RollD6(DirShakeChance)
            {
            ShakeDirectional = true
            }
        }
    
    //SHOOTING SFX !!!!!FIX add sounds for BIGGER SHOTZ
    
    //INCREASING!! SHOT SIZE & VISUALS AS CLIP EMPTIES
    if ShotsFiredCountMax/1.2 < ShotsFiredCount
    {
    ShotSound = GunShootSFXLow3
    BulletScale = 2
    //RateOfFire = 0.25
    //MyBulletSpeed = MyBulletSpeed/1.2
    
        if ShotsFiredCountMax/1.1 < ShotsFiredCount
        {
        ShotSound = GunShootSFXLow2
        BulletScale = 2.5
        //RateOfFire = 0.3
        //MyBulletSpeed = MyBulletSpeed/1.4
        
            if ShotsFiredCountMax/1.05 < ShotsFiredCount
            {
            ShotSound = GunShootSFXLow1
            BulletScale = 3
            //RateOfFire = 0.35
            //MyBulletSpeed = MyBulletSpeed/1.7
            }
        }
    }
    //BULLETSCALE DEPENDENT ON AUDIO CLIP ABOVE BEING LINKED!
    if ShotSound = 0
    {
    ShotSound = choose(GunShootSFX1,GunShootSFX2,GunShootSFX3,GunShootSFX4)
    BulletScale = 1
    }

        
        //PLAY SHOT SOUND
        audio_play_sound(ShotSound,100,false)
    
    BulletsToFire = WeaponBulletsPerShot
    while 0 < BulletsToFire
    {
    //ACTUAL BULLET
    MyBullet = instance_create(xx,yy,BulletType)
    MyBullet.Owner = self.id
    //ACCURACY STUFF
    if Accuracy = 0 {MyBullet.direction = image_angle}
    else {MyBullet.direction = image_angle + (round(random(Accuracy)) - Accuracy/2)}
    MyBullet.speed = MyBulletSpeed
    MyBullet.image_angle = MyBullet.direction
    MyBullet.image_yscale = BulletScale  
    MyBullet.image_alpha = BulletScale //Using same numbers, so figured make it one variable
    BulletsToFire--
    }

#define ProjectileImpactChecker
var DamageSource = argument0
var ProjectileDamage = argument1
var ProjectileImpact = argument2  //0.8-1 for guns, 1-3 for explosions
var ProjectileType = argument3 //PROJECTILE TYPES: 1 NonPierce, 2 Pierce, 3 Explosion


//DIRECT HIT ON AN ENEMY!
if instance_place(x,y,oEnemyBody) {
EnemyHit = instance_nearest (x,y,oEnemyBody)
   
    //DMG THE FOE
    with EnemyHit 
        {
        if DamageEnemy(ProjectileDamage)
            {
            AttackSource = DamageSource
            YesEnemyIsDead = true
            WeaponImpact = ProjectileImpact
            global.CrabsKilled++
            instance_create(x,y,oMoney)
            break;
            }
            else
            {
            image_index = image_number-4
            }
        }
        
    //DESTROY THE BULLET
    if ProjectileType = 1 
    {
    ShotImpactParticles(image_angle-220,image_angle-140)
    instance_destroy()
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
        CrateToBlowUp = instance_place(x,y,oCrate)
        if CrateToBlowUp.image_index = 0
        {
        HitCrateParticles(image_angle-220,image_angle-140,CrateToBlowUp.CrateColour)
        ShotImpactParticles(image_angle-220,image_angle-140)
        if ProjectileType = 1 {instance_destroy()}    
        
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
                    CrateRotation = CrateRotation + random_range(-CrateRotateFactor,CrateRotateFactor)
                    }
            }
        }
        
}


if instance_place(x,y,oSolidObject) && ProjectileType != 3 {instance_destroy()}
