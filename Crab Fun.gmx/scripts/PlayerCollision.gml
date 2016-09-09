CollidingWith = argument0

//COLLISION WITH SOLID OBJECT
if place_meeting(x+hspeed,y+vspeed,CollidingWith) {
    //Keep as much Hori Speed as poss!
    OldHSpeed = hspeed
    hspeed = 0
    while 
        place_meeting (x+hspeed+sign(OldHSpeed),y,CollidingWith) =false && //Check there's room to move before collision, if we crept closer to old hspeed
        abs(hspeed) < abs(OldHSpeed) //Check we're not back at previous speed - use abs to work out RELATIVE value, not just classic maths
        {
        //Restore hspeed to old hspeed
        hspeed = hspeed + sign(OldHSpeed)
        }
    
    //figured out how much hspeed we can keep without hitting anything - so we're keeping that.
            
    //Keep as much Vert Speed as poss!
    OldVSpeed = vspeed
    vspeed = 0
    while 
        place_meeting (x+hspeed,y+vspeed+sign(OldVSpeed),CollidingWith) =false && //Check there's room to move before collision, if we crept closer to old vspeed
        abs(vspeed) < abs(OldVSpeed) //Check we're not back at previous speed - use abs to work out RELATIVE value, not just classic maths
        {
        //Restore vspeed to old vspeed
        vspeed = vspeed + sign(OldVSpeed)
        }
}

