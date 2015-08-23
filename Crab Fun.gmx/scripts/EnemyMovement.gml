//CONTAINS MOVEMENT AND COLLISION

enemytomove = argument0
target = argument1
turnSpeed = argument2
accuracy = argument3
MoveSpeed = argument4

facingDir = image_angle



//SPEED BURST - CONSTANTLY DECREASING, TEMP BUFF!
SpeedBurst += (0 - SpeedBurst) *0.1;
if SpeedBurst < 0 {SpeedBurst = 0}
if SpeedBurst > 200 {SpeedBurst = 200}

//SPEED BUFF WHEN SHOOTING
if mouse_check_button(mb_left){EnemySpeedBuff=50}
if !mouse_check_button(mb_left){EnemySpeedBuff=0}

//ENEMY FAR AWAY, SEND IT ROUGHLY TOWARDS THE PLAYER
if distance_to_object(oPlayer) >1000 and TimeForANewPlan = 0 {
    TimeForANewPlan = TimeForANewPlan + 1/room_speed
    SpeedBurst = SpeedBurst + random_range (1,50)
    speed = (MoveSpeed+RandomSpeedTweak+EnemySpeedBuff+SpeedBurst)/room_speed
    }
    

   if TimeForANewPlan > 2 {
    point_direction(x,y,target.x+random_range(-500,500),y+random_range(-500,500))
    TimeForANewPlan = 0
    }

//NO ENEMY IN THE WAY, I'M COMING RIGHT 4 UR TASTY DICK
if collision_line(x,y,oPlayer.x,oPlayer.y,oEnemy,false,true) =noone{
SpeedBurst = SpeedBurst + 5
}

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

//TURN TOWARDS PLAYER - CLOSE RANGE & ACCURATE
if distance_to_object(oPlayer) <800 and CollisionTimer = 0{
speed = ((MoveSpeed+RandomSpeedTweak+EnemySpeedBuff+SpeedBurst)/ room_speed)*1.3
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
