/* COLLISION UH OH  
    if distance_to_object(oPlayer) <800
    and instance_place(x,y,oEnemyBody)
    and BodyCollisionTimer =0
    {
    BodyCollisionTimer = BodyCollisionTimer +1/room_speed }
    with (Owner){
    vspeed = vspeed*-1
    hspeed = hspeed*-1
    }
    
    
     //COOLDOWN PERIOD
    if BodyCollisionTimer >0{
    BodyCollisionTimer = BodyCollisionTimer +1/room_speed
    }
    //COLLISION RESET
    if  BodyCollisionTimer >0.2{
    BodyCollisionTimer = 0
    }
