/* OBSOLETE
//CONTAINS MOVEMENT AND COLLISION

enemytomove = argument0
enemylegs = argument1
target = argument2
turnSpeed = argument3
accuracy = argument4
MoveSpeed = argument5
TopMoveSpeed = argument6

facingDir = image_angle

//TELL YOUR LEGS WHERE THEY ARE, MATE
{var xx,yy;
xx = enemytomove.x
yy = enemytomove.y
    with (enemylegs) {
    x = xx
    y = yy
    }
}

with (enemytomove)
//ENEMY FAR AWAY, SEND IT ROUGHLY TOWARDS THE PLAYER
if distance_to_object(oPlayer) >1000{
    speed = MoveSpeed*1.5/(room_speed)
    direction = point_direction(x,y,target.x+random_range(-500,500),y+random_range(-500,500))
    }

//NO ENEMY IN THE WAY, I'M COMING RIGHT 4 UR TASTY DICK
if collision_line(xx,yy,oPlayer.x,oPlayer.y,oEnemy,false,true) =noone{
speed += (TopMoveSpeed - MoveSpeed) * 0.1
} else
{ speed = MoveSpeed }

//TURN TOWARDS PLAYER - CLOSE RANGE & ACCURATE
if distance_to_object(oPlayer) <800{
speed = MoveSpeed/room_speed
var targetDir = point_direction(enemytomove.x, enemytomove.y, target.x, target.y);
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
    enemytomove.direction -= turnSpeed * 3;
}
else if(angleDiff < leastAccurateAim * accuracy)
{
    enemytomove.direction += turnSpeed * 3;
}
}
