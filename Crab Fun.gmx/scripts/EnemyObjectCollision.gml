/*Bounce off objects
CollisionChecks = 0
while place_meeting(x + hspeed, y + vspeed, oSolidObject) && CollisionChecks <= 4 {
Owner.direction = Owner.direction +45
CollisionChecks = CollisionChecks + 1
if CollisionChecks = 4 and instance_place(x,y,oSolidObject) {
x = xprevious
y = yprevious
}
}
