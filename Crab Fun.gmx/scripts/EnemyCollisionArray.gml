//FUDGED ENEMY COLLISION!
    
    //COLLISION - FAR
    if instance_place (x,y,oEnemy)
    and distance_to_object(oPlayer) >1000
    {
    speed = ((MoveSpeed+RandomSpeedTweak+EnemySpeedBuff+SpeedBurst)/ room_speed)*random_range(1,1.5)
    point_direction(x,y,target.x+random_range(-500,500),y+random_range(-500,500))
    }
    
    //COLLISION - FAR & MESSY
    if distance_to_object(oPlayer) >1300{
    if instance_place (x,y,oEnemy) or instance_place (x,y,oSolidObject){
    x = random_range (x+100,x-100)
    y = random_range (y+100,y-100)
    }
    }

//COLLISION - NEAR
if instance_place(x,y,oEnemy)
and distance_to_object(oPlayer) <1000
and collision_line(x,y,oPlayer.x,oPlayer.y,oEnemy,false,true) !=noone
and CollisionTimer < 0.7
{
var EnemyToEvade = instance_place(x,y,oEnemy)
var targetDir = point_direction(EnemyToEvade.x, EnemyToEvade.y, x,y);
var facingMinusTarget = facingDir - targetDir;
var angleDiff = facingMinusTarget;
EnemyToEvade.SpeedBurst = SpeedBurst + 20
if(abs(facingMinusTarget) > 180)
{
    if(facingDir > targetDir)
    {
        angleDiff = -1 * ((360 - facingDir) + targetDir);
    }
    else
    {
        angleDiff = (360 - targetDir) + facingDir;
    }
}var leastAccurateAim = 80;
if(angleDiff > leastAccurateAim * accuracy)
{
    enemytomove.direction -= turnSpeed * 5;
}
else if(angleDiff < leastAccurateAim * accuracy)
{
    enemytomove.direction += turnSpeed * 5;
}
CollisionTimer = CollisionTimer + 1/room_speed
}

//POST COLLIDE MOVEMENT & RESET
if CollisionTimer >0 {
CollisionTimer = CollisionTimer + 1/room_speed
speed = ((MoveSpeed+RandomSpeedTweak+EnemySpeedBuff+SpeedBurst)/ room_speed)
if CollisionTimer >1.5 { CollisionTimer =0}
}
