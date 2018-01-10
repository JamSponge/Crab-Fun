var ExplosionSize=argument0;
var ExplosionColour=argument1;

theboom = instance_create(x,y,oExplosion)
theboom.image_angle = random_range(1,360)
theboom.TimeToDeathFadeZero = 0
theboom.TimeToDeathFade = 1
theboom.image_xscale = ExplosionSize
theboom.image_yscale = ExplosionSize
theboom.WeaponDamage = ExplosionSize*5
theboom.Impact = ExplosionSize*1500/global.RealGame_Speed


audio_play_sound_at(aExplode,x,y,0,100,800,1,false,1)

with (oCamera) 
{
ShakeDirectional = false
screenshake = true
ShakeAmount = global.DisplayRatio*((ExplosionSize*20)+5)
bonusscreenshake = bonusscreenshake + ExplosionSize
alarm[0]=600/global.RealGame_Speed
alarm[1]=global.RealGame_Speed*1.5
}


instance_destroy()
