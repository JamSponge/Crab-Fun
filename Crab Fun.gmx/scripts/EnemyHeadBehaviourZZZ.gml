objToTurn = argument0
target = argument1
turnSpeed = argument2
accuracy = argument3
MoveSpeed = argument4
MoveSpeedFocused = argument5
facingDir = image_angle

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
    objToTurn.direction -= turnSpeed * 10;
}
else if(angleDiff < leastAccurateAim * accuracy)
{
    objToTurn.direction += turnSpeed * 10;
}
