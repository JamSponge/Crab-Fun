Target = argument0
Result = false

if instance_exists (Target) {
    if collision_line(x,y,Target.x,Target.y,oEnemy,false,true) =noone 
    &&
    collision_line(x,y,Target.x,Target.y,oSolidObject,false,true) =noone
    {
    Result = true
    }
    else {}
}

return Result
     
