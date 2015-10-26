  //MUZZLE FLASH
    instance_create(x + lengthdir_x(80, image_angle), y + lengthdir_y(80, image_angle),MuzzleFlareType)
      
    //ACTUAL BULLETS
    
    BulletsFired = 0
    while BulletsFired <10 {
    MyBullet = instance_create(x,y,BulletType)
    MyBullet.Owner = self.id
    MyBullet.direction = image_angle +(choose(5,6,8,10,11,15))
    MyBullet.speed = MyBulletSpeed
    BulletsFired ++
    
    MyBullet = instance_create(x,y,BulletType)
    MyBullet.Owner = self.id
    MyBullet.direction = image_angle -(choose(5,6,8,10,11,15))
    MyBullet.speed = MyBulletSpeed
    BulletsFired ++
    }
    
    audio_play_sound(GunShootSFX,100,false)
    
