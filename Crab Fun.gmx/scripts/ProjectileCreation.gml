    //PROJECTILE CREATION
    //MUZZLE FLASH
    instance_create(x + lengthdir_x(80, image_angle), y + lengthdir_y(80, image_angle),MuzzleFlareType)
    
    //BULLET BEAM
            var dir,dist,dist2;
        laser_ox = x; //set this to the origin x of the laser
        laser_oy = y; //set this to the origin y of the laser
        laser_ex = mouse_x; //set this to the "endpoint" x of the laser
        laser_ey = mouse_y; //set this to the "endpoint" y of the laser
        dist = 1000; //set this to the length of the laser. 
                    //For a beam weapon, probably high enough to ensure that the end is always offscreen.
        dir=degtorad(point_direction(laser_ox,laser_oy,laser_ex,laser_ey)); //Finds the direction of the laser
        
        laser_ex=laser_ox+cos(dir)*dist; //sets the x-endpoint of the laser
        laser_ey=laser_oy-sin(dir)*dist; //sets the y-endpoint of the laser
        
        /*
        Now you should check for collisions with enemies. 
        If an enemy is hit and is closer to the origin point than the current length of the laser, shorten the laser.
        */
        with(oGlobalSolid){
         if (collision_line(other.laser_ox,other.laser_oy,other.laser_ex,other.laser_ey,id,true,false)!=noone){
              dist2=point_distance(x,y,other.laser_ox,other.laser_oy);
              if (dist2<dist) dist = dist2;
         }
        }
        
        //Now set the endpoints again with the new distance, and you're set. Use these variables when drawing the laser.
        laser_ex=laser_ox+cos(dir)*dist; //sets the x-endpoint of the laser
        laser_ey=laser_oy-sin(dir)*dist; //sets the y-endpoint of the laser
        
        LaserXScale = distance_to_point(laser_ex,laser_ey)     
        
        //Impact Animation!
        var BeamImpactScale = random_range(1.5,2);
        MyBeamImpact = instance_create(x + lengthdir_x(LaserXScale-20, image_angle), y + lengthdir_y(LaserXScale-20, image_angle),ImpactAnimationType)
        MyBeamImpact.image_xscale = BeamImpactScale
        MyBeamImpact.image_yscale = BeamImpactScale
        
        //Create the BEAM
        MyBeam = instance_create(x + lengthdir_x(80, image_angle), y + lengthdir_y(80, image_angle),BulletBeamType)
        MyBeam.Owner = self.id
        MyBeam.direction = image_angle
        MyBeam.image_angle = image_angle
        MyBeam.image_xscale = LaserXScale-80
        
        audio_play_sound(GunShootSFX,100,false)
        
    //ACTUAL BULLET
    MyBullet = instance_create(x,y,BulletType)
    MyBullet.Owner = self.id
    MyBullet.direction = image_angle
    MyBullet.speed = MyBulletSpeed
    MyBullet.image_angle = image_angle
            
