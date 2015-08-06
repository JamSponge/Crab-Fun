//CONTAINS MOVEMENT AND COLLISION

objToTurn = argument0
target = argument1
turnSpeed = argument2
accuracy = argument3
MoveSpeed = argument4
MoveSpeedFocused = argument5
facingDir = image_angle

//SPEED BUFF WHEN SHOOTING
if mouse_check_button(mb_left){EnemySpeedBuff=50}
if !mouse_check_button(mb_left){EnemySpeedBuff=0}
if collision_line(x,y,oPlayer.x,oPlayer.y,oEnemy,false,true) =noone{
EnemySpeedBuff = 80
}

//FUDGED ENEMY COLLISION!
    //LONG RANGE AND FUDGE
    if distance_to_object(oPlayer) >800{
    speed = (MoveSpeed+RandomSpeedTweak+EnemySpeedBuff)/ room_speed
    point_direction(x,y,target.x+-300,target.y+-300)
    }

    //COLLISION - FAR
    if instance_place (x,y,oEnemy)
    and distance_to_object(oPlayer) >1000
    {
    speed = ((MoveSpeed+RandomSpeedTweak+EnemySpeedBuff)/ room_speed)*random_range(1,4)
    point_direction(x,y,target.x+-500,target.y+-500)
    }
    
    //COLLISION - FAR & MESSY
    if instance_place (x,y,oEnemy)
    and distance_to_object(oPlayer) >1300{
    x = random_range (x+100,x-100)
    y = random_range (y+100,y-100)
    }

//TURN TOWARDS PLAYER - CLOSE RANGE & ACCURATE
if distance_to_object(oPlayer) <800 and CollisionTimer = 0{
speed = ((MoveSpeed+RandomSpeedTweak+EnemySpeedBuff)/ room_speed)*1.3
var targetDir = point_direction(objToTurn.x, objToTurn.y, target.x, target.y);
var facingMinusTarget = facingDir - targetDir;
var angleDiff = facingMinusTarget;
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
}var leastAccurateAim = 20;
if(angleDiff > leastAccurateAim * accuracy)
{
    objToTurn.direction -= turnSpeed * 3;
}
else if(angleDiff < leastAccurateAim * accuracy)
{
    objToTurn.direction += turnSpeed * 3;
}
}
//COLLISION - NEAR
if instance_place(x,y,oEnemy)
and distance_to_object(oPlayer) <1000
and collision_line(x,y,oPlayer.x,oPlayer.y,oEnemy,false,true) !=noone
and CollisionTimer = 0
{
direction = image_angle + random_range(-20,20)
speed = ((MoveSpeed+RandomSpeedTweak+EnemySpeedBuff)/ room_speed)
CollisionTimer = CollisionTimer + 1/room_speed
}

//POST COLLIDE MOVEMENT & RESET
if CollisionTimer >0 {
CollisionTimer = CollisionTimer + 1/room_speed
speed = ((MoveSpeed+RandomSpeedTweak+EnemySpeedBuff)/ room_speed)
if CollisionTimer >0.3 { CollisionTimer =0}
}