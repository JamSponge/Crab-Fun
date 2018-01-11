#define DEATH_FADE


#define DeathFadeTimer
depth = depth+20
if depth >=1000{ depth =1000}
SecondsUntilFadeStarts--




#define DeathFadeActivated
if SecondsUntilFadeStarts <= 0
{
image_alpha += (0 - image_alpha) *0.05

    if image_alpha <0.01
    {
    instance_destroy()
    }
image_xscale += (0 - image_xscale) *0.01
image_yscale += (0 - image_yscale) *0.01

if image_xscale < 0 {image_xscale = 0}
if image_yscale < 0 {image_yscale = 0}
}

#define DeathFadeAlarmTrigger
if 0 < SecondsUntilFadeStarts
{
}
else
DeathFadeActivated()

#define DeathFadeSetup
SecondsUntilFadeStarts = argument0

with (oDebrisArray)
{
if CurrentArraySlot = 299 {CurrentArraySlot = 0}
}

/*PLACE THE BELOW CODE INTO CREATE

var DebrisID = self.id
with (oDebrisArray)
{
CurrentArray[CurrentArraySlot] = DebrisID
CurrentArraySlot++
}