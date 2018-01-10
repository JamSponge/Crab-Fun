#define ENEMY_SPAWN_AND_MOVE

#define EnemySpawnSetup
//2D ARRAY WITH ENEMY DATA [0 Number of the Enemy, 0 legs of enemy 1 collision imminent?]
EnemyArray[0,0] = 0
//ARRAY TEXT FOR EASE OF READING LOL
EnemyBody = 0
EnemyLegs = 1
EnemyCollisionTIMERVALUE = 2
EnemyDeathAnimation = 3
EnemyDeathSpeed = 4

//SETUP FOR TELEPORTERS
global.TeleporterCooldownTime = global.RealGame_Speed/2
global.TeleporterWarmUpSpeed = global.RealGame_Speed*1.5
//TIME BETWEEN SPAWN CHECKS
alarm[1] = global.RealGame_Speed*1.5

EnemyInactivityDistance = 2000
alarm[0] = global.RealGame_Speed*2

/*
instance_create(global.CrabaporterLocations[#0,0],global.CrabaporterLocations[#1,1],oMoney)
instance_create(global.CrabaporterLocations[#0,1],global.CrabaporterLocations[#2,2],oMoney)
instance_create(global.CrabaporterLocations[#0,2],global.CrabaporterLocations[#3,3],oMoney)
instance_create(global.CrabaporterLocations[#0,3],global.CrabaporterLocations[#4,4],oMoney)

#define StandardEnemyArrayAlarm
var i;
 for (i = 0; i < array_height_2d(EnemyArray); i += 1) //Loop Through Full Array
    {
         //Is it actually an enemy? Or just a blank array slot
         if EnemyArray[i,0] = 0{}
         else {
                  
              //Is the body going to hit another enemy? If it is, put it on a LIST.
             with (EnemyArray[i,1]) if place_meeting (x+hspeed,y+vspeed,oEnemy){
                 //Add enemy to list of collision problems
                 (oEnemyArrayController.EnemyArray[i,2]) = 1
                 } 
                else {(oEnemyArrayController.EnemyArray[i,2]) = 0}
           
         }
    }

//RESET ALARM         
alarm[0] = global.RealGame_Speed*0.5

#define StandardEnemyArray
//NO SPAWN, BUT THEY CAN STILL MOVE
if instance_exists(oCamera){
    
    //MOVE EACH ENEMY IN THE ARRAY
      //Set up some variables to save CPU!
                var TargetX = oCamera.x
                var TargetY = oCamera.y
                var PlayerX = TargetX
                var PlayerY = TargetY
    if instance_exists(oPlayer)
    {
    var PlayerX = oPlayer.x
    var PlayerY = oPlayer.y
    }
    var i;
     for (i = 0; i < array_height_2d(EnemyArray); i += 1) //Loop Through Full Array
        
        
         //Is it actually an enemy? Or just a blank array slot
         if EnemyArray[i,0] = 0 {}
         
             else {
                                          
             
                 //OK, it's an enemy. Make sure your body is where your legs are.
                var CurrentX,CurrentY;
               CurrentX = EnemyArray[i,1].x
               CurrentY = EnemyArray[i,1].y
                    with (EnemyArray[i,0]) {
                    x = CurrentX
                    y = CurrentY
                    }
                    
//SEE HOW MANY CRABS CAN SKIP COLLISION CHECKS THIS TIME

                //ENEMY FAR AWAY, NO CLEVER STUFF NEEDED
                    if point_distance (CurrentX,CurrentY,TargetX,TargetY) >EnemyInactivityDistance{
                    EnemyArray[i,2] = 0
                    }
                
//THESE CRABS GOT PROBLEMS, YO!                
                if EnemyArray[i,2] = 1 {
                
                     //GIVE CRAB DATA NEEDED FOR EVASION
                         with (EnemyArray[i,1]) {
                           turnSpeed = EnemyTurnSpeed*0.2
                           enemyspeed = EnemySpeed*0.8      
                           accuracy = EnemyAccuracy  
                           
                             //TEMPORARILY MOVE CRAB MILES AWAY TO GET ACCURATE NEAREST DATA
                             
                             var xx,yy;
                             xx = x;
                             yy = y;
                             x = xx + 50000;
                             y = yy + 50000;            
                             var EnemyColliding = instance_nearest(xx,yy,oEnemy);
                             x = xx;
                             y = yy;
                           }
                           //USE OTHER CRAB AS Current POINT, RATHER THAN YOURSELF
                           var CurrentX,CurrentY,TargetX,TargetY, ActualX,ActualY;
                           CurrentX = EnemyColliding.x;
                           CurrentY = EnemyColliding.y;
                           TargetX = xx
                           TargetY = yy
                           ActualX = xx
                           ActualY = yy   
                         
                    } else {
                    //MOVE AS NORMAL - TOWARDS PLAYER, OR MAYBE AN ICECREAM
                       
                        with (EnemyArray[i,1]) {
                            var facingDir,CurrentX,CurrentY,ActualX,ActualY;
                            facingDir = image_angle; 
                            CurrentX = x
                            CurrentY = y
                            ActualX = x
                            ActualY = y 
                            
                            //DETERMINE GRID LOCATION
                            var col = x div global.TileSetSize;
                            var row = y div global.TileSetSize;
                            CurrentLocation = oCamera.grid[# col, row];

                            accuracy = EnemyAccuracy
                            enemyspeed = EnemySpeed
                            turnSpeed = EnemyTurnSpeed
                            
                                //WATER CHECK, YO
                                if CurrentLocation = -3
                                {
                                enemyspeed = EnemySpeed*1.6
                                turnSpeed = EnemyTurnSpeed*0.5
                                }
                            }           
                        }
            
//FINAL INSTRUCTIONS FOR EACH SET OF LEGS
            with (EnemyArray[i,1])
            {

                //THERE'S A CLEAR LINE TO THE PLAYER MATE, GUN IT.
                if IHaveLineOfSightTo(oPlayer)
                    {
                //RESET SETTINGS TO NORMAL CRAB MODE, POINT TOWARDS THE PLAYER!
                    CurrentX = ActualX
                    CurrentY = ActualY
                    TargetX = PlayerX 
                    TargetY = PlayerY
            
                    enemyspeed = enemyspeed*1.5
                    turnSpeed = EnemyTurnSpeed*2
                    accuracy = EnemyAccuracy*1.5
                    }
                
                    //WHOA FUCK THAT GUY I SAW AN ICECREAM
                   if IceCreamValue = 0 and distance_to_object (oDeadIceCreamCone) <= 200 
                   {
                   var NearestIceCreamCone = instance_nearest (x,y,oDeadIceCreamCone)
                   var TargetX = NearestIceCreamCone.x
                   var TargetY = NearestIceCreamCone.y
                   }
                   
                
                //OBJECT COLLISION CHECK
                if place_meeting (x+(hspeed*3),y+(vspeed*3),oSolidObject){
                vspeed = vspeed*-1
                hspeed = hspeed*-1
                direction = direction + choose (-35,-20,0,20,35)
                
                turnSpeed = EnemyTurnSpeed*0.3
                accuracy = EnemyAccuracy*0.5
                }
                         
            //CARRY OUT ACTUAL ANGLE AND SPEED
            EnemyTurning(CurrentX,CurrentY,TargetX,TargetY,turnSpeed,accuracy,image_angle)
            speed = enemyspeed
            }                              

           

//ENEMY DIES BUT **IS NOT A KILL** !!!
            
//EATING AN ICECREAM
//POWER-UP ANIMATION TO REPLACE PREVIOUS CRAB
                                    with (EnemyArray[i,1]) if instance_place(x,y,oDeadIceCreamCone) and IceCreamValue = 0{                                                               
                                    var SpawnX = x
                                    var SpawnY = y
                                    var facingDir = image_angle
                                    
                                    {
                                    RedToBlueCrab = instance_create (SpawnX,SpawnY,oRedToBlueCrab)
                                    RedToBlueCrab.image_angle = facingDir
                                    }                                                               

//CLEAN UP THE DEBRIS & WIPE ARRAY DATA
    
                                      //DESTROY THE LEGS 
                                       instance_destroy()  
                                      //DESTROY THE BODY
                                       with (oEnemyArrayController.EnemyArray[i,0]) {instance_destroy()}   
                                      //WIPE PREVIOUS ENEMY DATA
                                       with oEnemyArrayController {
                                       
                                       var ii;
                                        for (ii = 0; ii < array_length_2d(EnemyArray, i); ii += 1) //Loop Through Full Array
                                        EnemyArray[i,ii] = 0
                                        }                                       
                                        //KILL THE ICE CREAM CONE
                                       var NearestIceCreamCone = instance_nearest (x,y,oDeadIceCreamCone)        
                                       with NearestIceCreamCone {
                                       instance_destroy()
                                       }    
                                    }
        } //CLOSES OFF ARRAY LOOP
        
}  //IF CAMERA EXISTS BOOKEND     



    //ABANDONED CODE
    /*Check if there's a old slot in the array that can be used
    var i;
     i = array_length_1d(oEnemyArrayController.EnemyArray) //See how many enemy array entries exist
     
         repeat(array_length_1d(oEnemyArrayController.EnemyArray)) {
         if oEnemyArrayController.EnemyArray[i] = 0 {
         //Oh! There is a free gap. Make the new enemy fill the old gap.
        with (oEnemyArrayController) EnemyArray[i] = NewEnemy.id
         //EXIT
         exit
         } else {
         i -= 1;
         }
         //There aren't any gaps, create a new entry
             if i <= 0 {   
             with (oEnemyArrayController) EnemyArray[array_length_1d(oEnemyArrayController.EnemyArray)] = NewEnemy.id
             }
         }    */         
            

#define Spawn_Enemies_Alarm
//SPAWN ENEMIES
//CHECK NUMBER OF FOES, CHOOSE LOCATION TO SPAWN
if instance_exists(oPlayer)
    {
        if instance_number (oEnemyBody) <30 
            {
            var i = round(random_range(0,global.CrabaporterQuantities));
                //LOCATION CHOSEN, ACTIVATE TIMER
                with (global.CrabaporterObjects[i])
                {
                //TODOPLS "teleporting in" particles & hum noise go here
                alarm[0] = global.TeleporterWarmUpSpeed //How long before they actually arrive?
                alarm[1] = global.TeleporterCooldownTime //How Long Before This Can Happen Again
                TeleporterOnCooldown = true
                TeleporterIsGo = true
                ds_list_shuffle(TeleporterPadSpecificLocations)
                }
            }
        
        //RESET YOUR OWN ALARM
        alarm[1]=global.RealGame_Speed
    }


#define Crab_Teleporter_Create_Event
TeleporterIsGo = false
TeleporterActive = false
TeleporterOnCooldown = false
alarm[3] = global.RealGame_Speed/2 //ALARM FOR NOT ACTIVE PARTICLE SPAWNING


//SETUP THE LIST THAT DETERMINES SPAWN ORDER

TeleporterPadSpecificLocations = ds_list_create()

//PRESET POTENTIAL LOCATIONS TO SPAWN (FOUR CORNERS, BASICALLY - NW to SE as per)

ax = x-global.TileSetSizeHalved
ay = y-global.TileSetSizeHalved

bx = x+global.TileSetSizeHalved
by = y-global.TileSetSizeHalved

cx = x-global.TileSetSizeHalved
cy = y+global.TileSetSizeHalved
                
dx = x+global.TileSetSizeHalved
dy = y+global.TileSetSizeHalved

#define Crab_Teleporter_Step_Event
//Step Script Triggered by oCrabaporter

if TeleporterOnCooldown = false
    {
        if TeleporterActive = true
            {
                ds_list_add(TeleporterPadSpecificLocations,1,2,3,4)
                alarm[2] = global.RealGame_Speed/4
                TeleporterActive = false
            }
    }

#define Crab_Teleporter_Active_Alarm
//Alarm[1] of oCrabaporter


var val,xx,yy,enemyfacing;
val = ds_list_find_value (TeleporterPadSpecificLocations,0)
    
    //ALL DATA FROM LIST IS GONE, MATE. END THIS.
    if is_undefined(val)
    {
    TeleporterIsGo = false
    }

else
    {
    ds_list_delete(TeleporterPadSpecificLocations,0)
    
        switch (val)
        {
        case 1: 
        xx = ax
        yy = ay 
        break;
        
        case 2:
        xx = bx
        yy = by
        break;
        
        case 3:
        xx = cx
        yy = cy
        break;
        
        case 4:
        xx = dx
        yy = dy
        break;
        
        case 5:
        xx = x
        yy = x
        break;
        }
    //TP PARTICLES! SHAZZAAAAMMM
    part_emitter_region(global.ps, global.pe_Teleport_In, xx,xx,yy,yy, ps_shape_rectangle, ps_distr_linear);
    part_emitter_burst(global.ps, global.pe_Teleport_In, global.pt_Teleport_In, 1);
    instance_create(xx,yy,oEnemyTeleportingIn)
        
        //RESET TELEPORTER OR LOOP IF ENEMIES STILL ON THE WAY
        {
        alarm[2] = global.RealGame_Speed/4
        }
    }
