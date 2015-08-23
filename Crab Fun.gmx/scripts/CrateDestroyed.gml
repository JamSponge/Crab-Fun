//CRATE EXPLODES INTO PIECES! THIS IS ABOUT THE PIECES, YO. SAME LANGUAGE AS SPLATS BECAUSE YOLO

AttackSource = instance_nearest(x,y,oExplosion)
BitsCreated = 0
TotalBits = 10
ExtraChunkChance = random_range(0,10)

while BitsCreated < TotalBits {BitsCreated = BitsCreated+1
NewBitSmall = instance_create(x,y,oCrateShrapnel1)
NewBitSmall.direction = point_direction(AttackSource.x,AttackSource.y, x,y)+random_range(2,50)
NewBitSmall.speed= random_range(1000,3000)/room_speed

NewBitSmall2 = instance_create(x,y,oCrateShrapnel1)
NewBitSmall2.direction = point_direction(AttackSource.x,AttackSource.y, x,y)-random_range(2,50)
NewBitSmall2.speed= random_range(1000,3000)/room_speed
}

//EXTRA BIG CHUNK & SMOKE!
if BitsCreated >= TotalBits {
//PUFF OF SMOKE
NewSmoke = instance_create(x,y,oSmokePuff)
NewSmoke.direction = random_range (0,359)
NewSmoke.image_xscale= random_range(1,2.5)
NewSmoke.image_yscale=image_xscale

//BIG CHUNK
NewBitBig = instance_create(x,y,oCrateShrapnelBig)
NewBitBig.direction = point_direction(AttackSource.x,AttackSource.y, x,y)choose(+random_range(25,45),-random_range(25,45))
NewBitBig.speed= random_range(800,2000)/room_speed

//EXTRA BIG CHUNK - SOMETIMES
if ExtraChunkChance > 7 {
NewBitBig2 = instance_create(x,y,choose(oCrateShrapnelBig))
NewBitBig2.direction = point_direction(AttackSource.x,AttackSource.y, x,y)choose(+random_range(25,45),-random_range(25,45))
NewBitBig2.speed= random_range(800,2000)/room_speed
}
}
