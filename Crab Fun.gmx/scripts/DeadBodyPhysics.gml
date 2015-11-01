//EXPLOSIVE NUDGE
if instance_place(x,y,oExplosion){ 
//Check frame in explode animation are actually explosive
AttackSource = instance_nearest(x,y,oExplosion)
    if AttackSource.image_index > 3 and AttackSource.image_index <8 {
       direction = point_direction(AttackSource.x,AttackSource.y,x,y)
       speed = 1000/room_speed
       friction = 1
        }
    }

move_bounce_solid(false);
