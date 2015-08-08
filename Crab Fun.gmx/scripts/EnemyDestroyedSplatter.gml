//SET CACHE LIMIT FOR COLOUR VARIATIONS?!

SmallSplatterUsed = argument0
BigSplatterUsed = argument1
SecondBigSplatterUsed = argument2
SplatterColourR = argument3
SplatterColourG = argument4
SplatterColourB = argument5

while BitsCreated < TotalBits {BitsCreated = BitsCreated+1
NewBitSmall = instance_create(x,y,SmallSplatterUsed)
NewBitSmall.image_blend = make_colour_rgb (SplatterColourR,SplatterColourG,SplatterColourB)
NewBitSmall.direction = point_direction(oPlayer.x,oPlayer.y, x,y)+random_range(5,35)
NewBitSmall.image_angle=direction
NewBitSmall.speed= 2000/room_speed
NewBitSmall2 = instance_create(x,y,SmallSplatterUsed)
NewBitSmall2.image_blend = make_colour_rgb (SplatterColourR,SplatterColourG,SplatterColourB)
NewBitSmall2.direction = point_direction(oPlayer.x,oPlayer.y, x,y)-random_range(5,35)
NewBitSmall2.image_angle=direction
NewBitSmall2.speed= 2000/room_speed
}
if BitsCreated >= TotalBits{
NewBitSplat = instance_create(x,y,BigSplatterUsed)
NewBitSplat.image_blend = make_colour_rgb (SplatterColourR,SplatterColourG,SplatterColourB)
NewBitSplat.image_angle = point_direction(oPlayer.x,oPlayer.y, x,y)+-random(3)
NewBitSplat2 = instance_create(x,y,BigSplatterUsed)
NewBitSplat2.image_blend = make_colour_rgb (SplatterColourR,SplatterColourG,SplatterColourB)
NewBitSplat2.image_angle = point_direction(oPlayer.x,oPlayer.y, x,y)+-random(30)
audio_play_sound_at(choose(aDeathSplat1,aDeathSplat2,aDeathSplat3,aDeathSplat4,aDeathSplat5,aDeathSplat6,aDeathSplat7,aDeathSplat8,aDeathSplat9),x,y,0,100,300,1,false,1)
}

