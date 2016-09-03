PointAX = argument0
PointAY = argument1
PointBX = argument2
PointBY = argument3
turnSpeed = argument4
accuracy = argument5
facingDir = argument6

var targetDir = point_direction(PointAX,PointAY,PointBX,PointBY);
var facingMinusTarget = facingDir - targetDir;
var angleDiff = facingMinusTarget;
    if(abs(facingMinusTarget) > 180){
        if(facingDir > targetDir){
        angleDiff = -1 * ((360 - facingDir) + targetDir);
        }
            else{
            angleDiff = (360 - targetDir) + facingDir;
            }
    }
     var leastAccurateAim = 20;
     if(angleDiff > leastAccurateAim * accuracy){
     direction -= turnSpeed * 3;
     }
else if(angleDiff < leastAccurateAim * accuracy){
direction += turnSpeed * 3;
}
