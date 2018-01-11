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
var ShotSound = choose(GunShootSFX1,GunShootSFX2,GunShootSFX3,GunShootSFX4);
var BulletScale = 1;
var SoundPitch = 8;

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
    
    //SHOOTING SFX
    
    //INCREASING!! SHOT SIZE & VISUALS AS CLIP EMPTIES
    if ShotsFiredCountMax/1.2 < ShotsFiredCount
    {
    SoundPitch = 4
    BulletScale = 2
    //RateOfFire = 0.25
    //MyBulletSpeed = MyBulletSpeed/1.2
    
        if ShotsFiredCountMax/1.1 < ShotsFiredCount
        {
        SoundPitch = 3
        BulletScale = 2.5
        //RateOfFire = 0.3
        //MyBulletSpeed = MyBulletSpeed/1.4
        
            if ShotsFiredCountMax/1.05 < ShotsFiredCount
            {
            SoundPitch = 1
            varBulletScale = 3
            //RateOfFire = 0.35
            //MyBulletSpeed = MyBulletSpeed/1.7
            }
        }
    }
    
    //PLAY CORRECT SOUND EFFECT
    PlaySoundWithCumulativePitch(ShotSound,SoundPitch,0,10,100)

    
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

//COLLISION PRIORITY - ENEMY, SCENERY, AESTHETIC (DEAD ENEMY)

//DIRECT HIT ON AN ENEMY!
if instance_place(x,y,oEnemyBody) 
{
    hit_list = Instance_Place_List(x, y,oEnemyBody);
    if (hit_list != noone) 
    {
   var n = 0;
            
       while (n < ds_list_size(hit_list)) 
       {
          with (hit_list[| n]) 
          {
            
                //DAMAGE THE ENEMY
                {
                        //IS THIS BASTARD DEAD
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
                            //NOT DEAD, JUST ANIMATE BEING HIT
                            {
                            image_index = image_number-4
                            }
                }
          }
          
                    //IS IT A ONE-HIT BULLET? DESTROY IT!
                    if ProjectileType = 1 
                    {
                    ShotImpactParticles(image_angle-220,image_angle-140)
                    instance_destroy()
                    exit
                    } 
          
          n += 1;
       }
   //instance_destroy();
   ds_list_destroy(hit_list);
    }
}

//DIRECT HIT ON A CRATE
if instance_place(x,y,oCrate) 
{
    hit_list = Instance_Place_List(x, y,oCrate);
    if (hit_list != noone) 
    {
   var n = 0;
            
       while (n < ds_list_size(hit_list)) 
       {
                  with (hit_list[| n]) 
                  {
                        if DamageEnemy(ProjectileDamage)
                        {
                        CrateDestroyed(CrateColour,CrateScale,CrateRotation)
                        }
                        else
                        {
                        //NUDGE IT AND MAKE IT FLASH
                        image_index = image_number-4
                        image_speed = 1
                        CrateRotation = CrateRotation + random_range(-CrateRotateFactor,CrateRotateFactor)
                        //RELEASE DELICIOUS WOODY PARTICLES
                        HitCrateParticles(image_angle-220,image_angle-140,CrateColour)
                        }
                  }
                  
            //IS IT A ONE-HIT BULLET? DESTROY IT!
            if ProjectileType = 1 
            {
            ShotImpactParticles(image_angle-220,image_angle-140)
            instance_destroy()
            exit
            } 
              
       n += 1;
       }
   //instance_destroy();
   ds_list_destroy(hit_list);
    }
}

//NUDGE DEAD BODIES
if instance_place(x,y,oDeadEnemy) 
{
    hit_list = Instance_Place_List(x, y,oDeadEnemy);
    if (hit_list != noone) 
    {
   var n = 0;
            
       while (n < ds_list_size(hit_list)) 
       {
                  with (hit_list[| n]) 
                  {
                        if Nudged = false
                        {
                        direction = point_direction (DamageSource.x,DamageSource.y,x,y)
                        speed = ProjectileImpact
                        friction = EnemyWeight
                        Nudged = true
                        }  
                  }
                
       n += 1;
       }
   ds_list_destroy(hit_list);
    }
}

if instance_place(x,y,oSolidObject) && ProjectileType != 3 {instance_destroy()}
