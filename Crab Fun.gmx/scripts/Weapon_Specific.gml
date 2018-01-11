#define Weapon_Specific


#define Pistol_Stuff
//MAXED GUN, THROW TO EXPLODE!
    if BombGunThrown = false
    {
    
    if mouse_check_button_pressed(mb_right)
    {
    GunBombCharging = true
    //PASS DATA ONTO CROSSHAIR, IN CASE PISTOL GOES AWAY FOR SOME REASON??
    //HOW BIG IS THIS "BIG BOOM" GOING TO BE, SIR?
    ExplosionSize = ShotsFiredCount/ShotsFiredCountMax; if ExplosionSize <WeaponMinExplodeSize {ExplosionSize = WeaponMinExplodeSize}
    //SWITCH ON BEAM GRAPHICS & PREP IT ETC
    oCrossHair.DrawAimingBeam = true
    //PUT IMPACT TRACKER IN ROUGHLY THE RIGHT PLACE
    oImpactTracker.x = x
    oImpactTracker.y = y
    }
    
    //HOLD DOWN, INCREASE BOMB SIZE
    if mouse_check_button(mb_right) 
    {
        if GunBombCharging = true
        {
        ExplosionSize += (WeaponMaxExplodeSize - ExplosionSize) *WeaponExplodeSizeGrowthRate;
        if WeaponMaxExplodeSize < ExplosionSize {ExplosionSize = WeaponMaxExplodeSize}
        oCrossHair.ExplosionSize = ExplosionSize
        } 
        else
        {
        GunBombCharging = true
        //THIS IS DUPLICATE OF STUFF ABOVE - PROBABLY SCRIPT AT SOME POINT, MATEY
        //HOW BIG IS THIS "BIG BOOM" GOING TO BE, SIR?
        ExplosionSize = ShotsFiredCount/ShotsFiredCountMax; if ExplosionSize <WeaponMinExplodeSize {ExplosionSize = WeaponMinExplodeSize}
        //SWITCH ON BEAM GRAPHICS & PREP IT ETC
        oCrossHair.DrawAimingBeam = true
        //PUT IMPACT TRACKER IN ROUGHLY THE RIGHT PLACE
        oImpactTracker.x = x
        oImpactTracker.y = y
        }
    }

        //RELEASE AND FIRE IT
        if mouse_check_button_released(mb_right)
        {
        
        //RESET PISTOL SETTINGS
        ShotsFiredCount = 0
        CanShoot = true
        RateOfFire = 0.2
        ShotSound = 0
        MyBulletSpeed = 4000 / global.RealGame_Speed
        
        //BOMB GUN
        GunBombCharging = false
        BombGunThrown = true
        MyGunBomb = instance_create(x + lengthdir_x(80, image_angle), y + lengthdir_y(80, image_angle),oExplodeGun)
                
        audio_play_sound(aPlayerShoot,100,false)
        MyGunBomb.direction = image_angle
        MyGunBomb.speed = MyGunBombSpeed
        //MyGunBomb.ExplosionSize = ExplosionSize
        MyGunBomb.ExplosionSize = WeaponMaxExplodeSize
        
            //SWITCH OFF LASER AIM BEAM SHIT
            with (oCrossHair)
            {
            DrawAimingBeam=false
            PowerBarXScale=0
            PowerBarYScale=0
            PowerBarAlpha=0
            }
        } 
    }

#define MachineGun_Stuff
 //Machine gun done, switch to pistol
        if mouse_check_button_released(mb_left)
        {
        if CanShoot=false
            {
            instance_activate_object(oPistol)
            instance_destroy()
            }
        }