#define LEVEL_GENERATION
/* HEY BABE THANKS FOR COMING!!!!

THIS IS WHERE WE GENERATE LEVELS, FROM SCRATCH!!! WOW WHAT!????
WHO R U, KEVIN FUCKING LEVINE? WOW
*/

GridMidPointHori= (GridMaxHori div 2)
GridMidPointVert= (GridMaxVert div 2)

//ASSIGN GRID IDENTITIES & DRAW SPRITES
LevelGenProcess()

#define LevelGenProcess
//SET INITIAL VARIABLES AND GRID SIZE / BOUNDARIES
SetupLevelGen()

//8 BIT SPRITE BULLSHIT
SpriteSetup()

//GENERATE ERRATIC SHALLOW BEACH BACKDROP (#ofcycles,minsize,maxsize,rectanglecalc,valuetoassign)
SpecialGridGen(10,3,10,6,INACCESSIBLE,true)

//MAKE ISLANDS PLEASE
IslandGenerator(1,5,23,ACCESSIBLE,TOERODE)

//MAKE ANTI-ISLANDS PLEASE (POOLS)
IslandGenerator(0,3,4,INACCESSIBLE,TOERODE)

//FINAL ISLAND GEN (Stop player spawning in a puddle)
BeachDiskRadius = round(random_range (3,6))
ErodedBeachDiskRadius = 0
ds_grid_set_disk(grid,SafeIslandX,SafeIslandY,BeachDiskRadius,ACCESSIBLE)


//GIVE EVERY EMPTY CELL IN THE GRID A VALUE
GridDataAllocator()

//APPLY CORRECT SPRITES AND DATA FOR CELLS THAT REQUIRE INFO
AllocateSpritesToINACCESSIBLE()
AllocateSpritesToOUTOFBOUNDS()

//FILL THE LEVEL WITH STUFF
PopulateLevel()

room_goto(global.LevelBeingMade)

oCamera.LevelExists = true



#define IslandGenerator
BIGIslandsToMake = argument0
IslandsToMake = argument1
TinyIslandsToMake = argument2
InnerValue = argument3
OuterValue = argument4

 for (var TinyIsles = TinyIslandsToMake; 0 < TinyIsles; TinyIsles--)
    {
    //MAKE LOADS OF DIDDLER ISLANDS TOO, PLEASE. THANKS. I MEAN IT, THANKS.
    var RandomX, RandomY;
    RandomX = round(random_range(GridMidPointHori-GridMidPointHori/2,GridMidPointHori+GridMidPointHori/2))
    RandomY = round(random_range(GridMidPointVert-GridMidPointVert/2,GridMidPointVert+GridMidPointVert/2))
    
    BeachDiskRadius = round(random_range (2,3))
    ErodedBeachDiskRadius = round(BeachDiskRadius*1.2)

    ds_grid_set_disk(grid,RandomX,RandomY,ErodedBeachDiskRadius,OuterValue)
    ds_grid_set_disk(grid,RandomX,RandomY,BeachDiskRadius,InnerValue)
    }
    
while 0 < IslandsToMake
{
//MAKE BIG ISLANDS
    var RandomX, RandomY;
    RandomX = round(random_range(GridMidPointHori-GridMidPointHori/4,GridMidPointHori+GridMidPointHori/4))
    RandomY = round(random_range(GridMidPointVert-GridMidPointVert/4,GridMidPointVert+GridMidPointVert/4))
    
    BeachDiskRadius = round(random_range (4,6))
    ErodedBeachDiskRadius = round(BeachDiskRadius*1.2)

ds_grid_set_disk(grid,RandomX,RandomY,ErodedBeachDiskRadius,OuterValue)
ds_grid_set_disk(grid,RandomX,RandomY,BeachDiskRadius,InnerValue)

IslandsToMake --
}

while 0 < BIGIslandsToMake
{
//MAKE A WHOPPING ISLAND
    BeachDiskRadius = round(random_range (7,10))
    ErodedBeachDiskRadius = round(BeachDiskRadius*1.1)

ds_grid_set_disk(grid,SafeIslandX,SafeIslandY,ErodedBeachDiskRadius,OuterValue)
ds_grid_set_disk(grid,SafeIslandX,SafeIslandY,BeachDiskRadius,InnerValue)
BIGIslandsToMake--
}

#define GridDataAllocator
//SCAN THROUGH GRID
for (var row=0; row<ds_grid_height(grid); row++)
{
    for (var col=0; col<ds_grid_width(grid); col++)
    { 
    //ERODE AREAS WOT NEED ERODIN
    ErodeSpecialArea(TOERODE,10,INACCESSIBLE,ACCESSIBLE,col,row)
    
    
    //FILL BLANKS WITH SEA
    if (grid[# col, row] == BLANK)
    {
    grid[# col, row] = INACCESSIBLE
    }

    //OUT OF BOUNDS AREAS
    if col <=3 || col >=GridMaxHori-4 || row <=3 || row >=GridMaxVert-4 
    {grid[# col, row] = OUTOFBOUNDS}
}
}

#define ErodeSpecialArea
//"ERODES" SOME GRID CELLS TO MAKE LARGE BLOCKS LESS OBVIOUS
//CUSTOM WIN/FAIL ENTRY FOR WEIRD SHIT, I GUESS

//SPECIALTYPE, EROSIONCHANCE,TYPEA,TYPEB) //EC: 1 = TYPE A 100% consistent, 20 = TYPE B 100% consistent

SPECIALTYPE = argument0
EROSIONCHANCE = argument1
TYPEA = argument2
TYPEB = argument3
col = argument4
row = argument5
if (grid[# col, row] == SPECIALTYPE)
{
        if RollD20(EROSIONCHANCE) == true
                {
                grid[# col, row] = TYPEA
                }
                else
                grid[# col, row] = TYPEB
}

#define AllocateSpritesToINACCESSIBLE
//ALL ASSIGNED AS ACCESSIBLE OR FULL - TIME TO PLACE THE SEA TILES        
//ONLY APPLY TO REQUIRED SPACES, SO THIS IS A SECOND FULL-SCAN OF THE GRID
 //SCAN THROUGH GRID
    for (var row=0; row<ds_grid_height(grid); row++)
    {
        for (var col=0; col<ds_grid_width(grid); col++)
        {
            
            //CHECK IT'S A SEA TILE, IF IT IS, WE'LL WORK OUT WHAT TYPE.
            if (grid[# col, row] == INACCESSIBLE)
            {
            var sum = 0; 
            var NW,N,NE,W,E,SW,S,SE;
            NW=0;N=0;NE=0;W=0;E=0;SW=0;S=0;SE=0;

            
            //NORTH
            if grid[# col, row-1] != ACCESSIBLE {N=1}
            //WEST
            if grid[# col-1, row] != ACCESSIBLE {W=1}
            //EAST
            if grid[# col+1, row] != ACCESSIBLE {E=1}
            //SOUTH
            if grid[# col, row+1] != ACCESSIBLE {S=1}
            
            //NORTH-WEST
            if N=1 && W=1
                {
                if grid[# col-1, row-1] != ACCESSIBLE {NW=1}
                }
            //NORTH-EAST
            if N=1 && E=1
                {
                if grid[# col+1, row-1] != ACCESSIBLE {NE=1}
                }
            //SOUTH-WEST
            if S=1 && W=1
                {
                if grid[# col-1, row+1] != ACCESSIBLE {SW=1}
                }
            //SOUTH-EAST
            if S=1 && E=1
                {
                if grid[# col+1, row+1] != ACCESSIBLE {SE=1}
                }
                
            sum = (1*NW + 2*N + 4*NE + 8*W + 16*E + 32*SW + 64*S + 128*SE)
            //SET THE SPRITE ID BASED ON SUM

                for (var i=0; i< array_height_2d(tileset); i+= 1)
                    { 
                    if (sum == tileset[i,0])
                        {
                        grid[# col, row] = tileset[i,1]
                        //MAKE ONLY ONE TYPE OF SEA-SEA TILE
                        if grid[# col, row] = 46 {grid[# col, row] =0}
                        break;
                        }
                    }
            }
        }
    }
            
//OK, DEEP SEA TIME MOTHERHUBBARDDDD! FIND THEM DEEP SEA TILES!            
    for (var row=0; row<ds_grid_height(grid); row++)
    {
        for (var col=0; col<ds_grid_width(grid); col++)
        {

        //CREATE DEEP SEA TILES, ONLY IF THEY ARE OUT IN THE SEAAAA
            if grid[# col, row] = 0
            {
            //NESW - FULL CHECK FOR FULL SEA TILES
           var deepenough = 3;
        
           if grid[# col, row-1] = 0 || grid[# col, row-1] = OUTOFBOUNDS
           {deepenough--}
           
           if grid[# col-1, row] = 0 || grid[# col-1, row] = OUTOFBOUNDS
            {deepenough--}
            
           if grid[# col+1, row] = 0 || grid[# col+1, row] = OUTOFBOUNDS
            {deepenough--}
            
           if grid[# col, row+1] = 0 || grid[# col, row+1] = OUTOFBOUNDS
            {deepenough--}
            
            if deepenough <= 1 {grid[# col, row] = OUTOFBOUNDS}  
                
            }
        }
    }

#define SetupLevelGen
//LISTEN UP THIS IS ***IMPORTANT*** - 
//ACCESSIBLE tiles are EMPTY spaces for bground.
//INACCESSIBLE tiles are where invisible walls get spawned
//OUTOFBOUNDS have different sprites, and need no walls as OOB.
//SPECIAL are earmarked to be INACCESSIBLE after main process

//STANDARD STUFF - BASIC USE
BLANK=-1;
ACCESSIBLE=-2;
INACCESSIBLE=-3;
OUTOFBOUNDS=999; //needs to be high # because of scan function

//SPECIFIC VALUES FOR "SPECIAL" STUFF
POOL=-4;
TOERODE=-5;

//MAKE THIS NOW FOR PLAYER LOCATION DATA
SafeIslandX = round(random_range(GridMidPointHori-GridMidPointHori/4.5,GridMidPointHori+GridMidPointHori/4.5))
SafeIslandY = round(random_range(GridMidPointVert-GridMidPointVert/4.5,GridMidPointVert+GridMidPointVert/4.5))

//CREATE THE GRID
grid = ds_grid_create(GridMaxHori,GridMaxVert)
ds_grid_set_region(grid,0,0,GridMaxHori-1,GridMaxVert-1,BLANK)




#define SpecialGridGen
//SET MIN & MAX AS 1 FOR SINGLE-SQUARE GEN ONLY
//RECTANGULATOR WORKS AS SO:
    //minrangevalue= Rectangle City;  
    //maxrangevalue = Chance of BIG SQUARES ;

CyclesToRun = argument0
MinRangeCellScale = argument1
MaxRangeCellScale = argument2
Rectangulator = argument3
GridValueToSet = argument4
AddErosion = argument5

//CREATES SPECIAL BLOCK-AREAS TO ADD VARIATION/ENVIRONMENTAL OBJECTS
var HowManySPECIALs = CyclesToRun 
while HowManySPECIALs >=0
{
//SPECIAL SIZE
var SPECIALWidth, SPECIALHeight
SPECIALWidth = round (random_range(MinRangeCellScale,MaxRangeCellScale))
    //APPLY THE RECTANGULATORRRRRR
    if SPECIALWidth < MaxRangeCellScale/Rectangulator
    {
    MinRangeCellScale = MinRangeCellScale/1.5
    MinRangeCellScale = MaxRangeCellScale/1.5
    }
SPECIALHeight = round (random_range(MinRangeCellScale,MaxRangeCellScale))

    
    //ASSIGN THIS MOTHERCHUFFING BLOCK OF SPACES WITH VALUES
    
    //RANDOM POSITION WITHIN GRID MAIN BOUNDS
    var RandomX, RandomY;
    RandomX = round(random_range(GridMidPointHori-GridMidPointHori/2.5,GridMidPointHori+GridMidPointHori/3.5))
    RandomY = round(random_range(GridMidPointVert-GridMidPointVert/2.5,GridMidPointVert+GridMidPointVert/3.5))
    
    //PLACE THE EROSION TILES THAT GO AROUND THE EDGE, IF APPLICABLE
    if AddErosion=true
    {
    ds_grid_set_region(grid,RandomX-2,RandomY-2,(RandomX+SPECIALWidth)+2,(RandomY+SPECIALHeight)+2,TOERODE)
    }
    //PLACE THE SPECIALS PLEASE, GENTLEMEN
    ds_grid_set_region(grid,RandomX,RandomY,(RandomX+SPECIALWidth),(RandomY+SPECIALHeight),GridValueToSet)
    HowManySPECIALs--  
}


#define AllocateSpritesToOUTOFBOUNDS
//OK, now sort the deep sea tileset - and CREATE INVISIBLE WALLS, MATE!
for (var row=0; row<ds_grid_height(grid); row++)
    {
        for (var col=0; col<ds_grid_width(grid); col++)
        {
            if grid[# col, row] = OUTOFBOUNDS
            {
            
            var sum = 0; 
            var NW,N,NE,W,E,SW,S,SE;
            NW=0;N=0;NE=0;W=0;E=0;SW=0;S=0;SE=0;

            
                //NORTH
            if grid[# col, row-1] >= 48
            {N=1}
            //WEST
            if grid[# col-1, row] >= 48
            {W=1}
            //EAST
            if grid[# col+1, row] >= 48
            {E=1}
            //SOUTH
            if grid[# col, row+1] >= 48
            {S=1}
            
            //NORTH-WEST
            if N=1 && W=1
                {
                if grid[# col-1, row-1] >= 48
                {NW=1}
                }
            //NORTH-EAST
            if N=1 && E=1
                {
                if grid[# col+1, row-1] >= 48
                {NE=1}
                }
            //SOUTH-WEST
            if S=1 && W=1
                {
                if grid[# col-1, row+1] >= 48
                {SW=1}
                }
            //SOUTH-EAST
            if S=1 && E=1
                {
                if grid[# col+1, row+1] >= 48
                {SE=1}
                }
                          
            sum = (1*NW + 2*N + 4*NE + 8*W + 16*E + 32*SW + 64*S + 128*SE)
            //SET THE SPRITE ID BASED ON SUM

                for (var i=0; i< array_height_2d(tileset); i+= 1)
                    { 
                    if (sum == tileset[i,0])
                        {
                        grid[# col, row] = tileset[i,1]+48
                        
                            if grid[# col, row] = 94 || grid[# col, row] = 48
                            {
                            }
                                else
                                {
                                //INVISIBLE WALLS! I'M MAKING INVISIBLE WALLS! I'M OFFICIALLY PART OF THE PROBLEM!
                                room_instance_add(global.LevelBeingMade,(col*128)+64, (row*128)+64,oInvisibleWall)
                                }
                        break;
                        }
                    }
            }
        }

    }

#define SpriteSetup
//INITIALISE 256 to 48 ARRAY
tileset[0,0] = 2   
tileset[0,1] = 1
tileset[1,0] = 8   
tileset[1,1] = 2
tileset[2,0] = 10  
tileset[2,1] = 3
tileset[3,0] = 11  
tileset[3,1] = 4
tileset[4,0] = 16  
tileset[4,1] = 5
tileset[5,0] = 18  
tileset[5,1] = 6
tileset[6,0] = 22  
tileset[6,1] = 7
tileset[7,0] = 24  
tileset[7,1] = 8
tileset[8,0] = 26  
tileset[8,1] = 9
tileset[9,0] = 27  
tileset[9,1] = 10
tileset[10,0] = 30  
tileset[10,1] = 11
tileset[11,0] = 31  
tileset[11,1] = 12
tileset[12,0] = 64  
tileset[12,1] = 13
tileset[13,0] = 66  
tileset[13,1] = 14
tileset[14,0] = 72  
tileset[14,1] = 15
tileset[15,0] = 74  
tileset[15,1] = 16
tileset[16,0] = 75  
tileset[16,1] = 17
tileset[17,0] = 80  
tileset[17,1] = 18
tileset[18,0] = 82  
tileset[18,1] = 19
tileset[19,0] = 86
tileset[19,1] = 20
tileset[20,0] = 88
tileset[20,1] = 21
tileset[21,0] = 90
tileset[21,1] = 22
tileset[22,0] = 91
tileset[22,1] = 23
tileset[23,0] = 94
tileset[23,1] = 24
tileset[24,0] = 95
tileset[24,1] = 25
tileset[25,0] = 104
tileset[25,1] = 26
tileset[26,0] = 106
tileset[26,1] = 27
tileset[27,0] = 107
tileset[27,1] = 28
tileset[28,0] = 120
tileset[28,1] = 29
tileset[29,0] = 122
tileset[29,1] = 30
tileset[30,0] = 123
tileset[30,1] = 31
tileset[31,0] = 126
tileset[31,1] = 32
tileset[32,0] = 127
tileset[32,1] = 33
tileset[33,0] = 208
tileset[33,1] = 34
tileset[34,0] = 210
tileset[34,1] = 35
tileset[35,0] = 214
tileset[35,1] = 36
tileset[36,0] = 216
tileset[36,1] = 37
tileset[37,0] = 218
tileset[37,1] = 38
tileset[38,0] = 219
tileset[38,1] = 39
tileset[39,0] = 222
tileset[39,1] = 40
tileset[40,0] = 223
tileset[40,1] = 41
tileset[41,0] = 248
tileset[41,1] = 42
tileset[42,0] = 250
tileset[42,1] = 43
tileset[43,0] = 251
tileset[43,1] = 44
tileset[44,0] = 254
tileset[44,1] = 45
tileset[45,0] = 255
tileset[45,1] = 46
tileset[46,0] = 0
tileset[46,1] = 47

#define PopulateLevel
 //POPULATE THE ROOM
 room_instance_add(global.LevelBeingMade,0,0,oEnemyArrayController)
 room_instance_add(global.LevelBeingMade,0,0,oImpactTracker)
 room_instance_add(global.LevelBeingMade,SafeIslandX*128,SafeIslandY*128,oPlayer)
 room_instance_add(global.LevelBeingMade,0,0,oPistol)


