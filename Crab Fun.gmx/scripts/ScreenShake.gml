ShakeAmount =argument0

if bonusscreenshake >= 6
{
bonusscreenshake = 6
}
x += random(ShakeAmount)+bonusscreenshake - (ShakeAmount/2)+(bonusscreenshake/2);
y += random(ShakeAmount)+bonusscreenshake - (ShakeAmount/2)+(bonusscreenshake/2);

