#define Global_Part_Setup
//Setup the Particle Sys
global.ps=part_system_create();
part_system_depth(global.ps, -220);

//ONLY APPEAR ON LAND, ETC
global.psLandOnly=part_system_create();
part_system_depth(global.psLandOnly, -100);

//CREATE PARTICLE TYPES

global.Particle1 = part_type_create();

part_type_shape(global.Particle1,pt_shape_line);            
part_type_size(global.Particle1,0.3,0.9,0,2);                   
part_type_scale(global.Particle1,1,0.7);                       
part_type_color1(global.Particle1,c_purple);                 
part_type_alpha2(global.Particle1,1,0);                       
part_type_speed(global.Particle1,3,10,5,5);           
part_type_direction(global.Particle1,0,359,0,20);           
part_type_orientation(global.Particle1,0,0,0,0,1);          
part_type_blend(global.Particle1,1);                        
part_type_life(global.Particle1,1,10);                       

PlayerSplashSetup()
PlayerWetFeetParticlesSetup()
ShotImpactSetup()
HitCrateParticlesSetup()
DestroyCrateParticlesSetup()

#define Particle_Burst
//PARTICLES, PLEASE (PartTyoe)
PartType = argument0
DirMin = argument1
DirMax = argument2
PartX = argument3
PartY = argument4

//DIRECTIONS FOR PARTICLE SYSTEM
part_type_direction(global.Particle1,DirMin,DirMax,0,0);            

//MAKE PARTICLE EMITTER
P_Emit1=part_emitter_create(global.ps)
part_emitter_region(global.ps,P_Emit1,PartX,PartX,PartY,PartY,ps_shape_rectangle,ps_distr_linear)

//BURST PARTICLES
part_emitter_burst(global.ps,P_Emit1,PartType, 15 + irandom(5)); 

//KILL SYSTEM
part_emitter_destroy(global.ps,P_Emit1)

#define PlayerSplashSetup
//WATER SPLASHES

//Creating Particle Types
//PlayerWalkSplashEffect0
global.pt_PlayerWalkSplashEffect0 = part_type_create();
part_type_shape(global.pt_PlayerWalkSplashEffect0, pt_shape_ring);
part_type_size(global.pt_PlayerWalkSplashEffect0, 0.01, 0.20, 0.01, 0.10);
part_type_scale(global.pt_PlayerWalkSplashEffect0, 1, 1);
part_type_orientation(global.pt_PlayerWalkSplashEffect0, 41, 138, 0, 0, 1);
part_type_color3(global.pt_PlayerWalkSplashEffect0, 16777215, 16777088, 255);
part_type_alpha3(global.pt_PlayerWalkSplashEffect0, 0.71, 0, 0);
part_type_blend(global.pt_PlayerWalkSplashEffect0, 1);
part_type_life(global.pt_PlayerWalkSplashEffect0, 50, 200);
part_type_speed(global.pt_PlayerWalkSplashEffect0, 1, 3, -0.20, 1);
part_type_direction(global.pt_PlayerWalkSplashEffect0, 0, 359, 0, 0);
part_type_gravity(global.pt_PlayerWalkSplashEffect0, 0, 299);

//PlayerWalkSplashEffect1
global.pt_PlayerWalkSplashEffect1 = part_type_create();
part_type_shape(global.pt_PlayerWalkSplashEffect1, pt_shape_pixel);
part_type_size(global.pt_PlayerWalkSplashEffect1, 1, 5, -0.20, 3);
part_type_scale(global.pt_PlayerWalkSplashEffect1, 1, 1);
part_type_orientation(global.pt_PlayerWalkSplashEffect1, 0, 0, 0, 1, 0);
part_type_color3(global.pt_PlayerWalkSplashEffect1, 16777215, 16777215, 16777215);
part_type_alpha3(global.pt_PlayerWalkSplashEffect1, 0.97, 0.37, 0);
part_type_blend(global.pt_PlayerWalkSplashEffect1, 1);
part_type_life(global.pt_PlayerWalkSplashEffect1, 10, 15);
part_type_speed(global.pt_PlayerWalkSplashEffect1, 2, 12, -0.50, 5);
part_type_direction(global.pt_PlayerWalkSplashEffect1, 0, 360, 0, 2);
part_type_gravity(global.pt_PlayerWalkSplashEffect1, 0, 0);

//Creating Emitters
global.pe_PlayerWalkSplashEffect0 = part_emitter_create(global.ps);
global.pe_PlayerWalkSplashEffect1 = part_emitter_create(global.ps);

#define ShotImpactSetup
//GUNSHOT BULLET IMPACTS

//Creating Particle Types
//ShotImpact0
global.pt_ShotImpact0 = part_type_create();
part_type_shape(global.pt_ShotImpact0, pt_shape_line);
part_type_size(global.pt_ShotImpact0, 0.20, 0.90, 0, 0);
part_type_scale(global.pt_ShotImpact0, 1, 1);
part_type_orientation(global.pt_ShotImpact0, 0, 0, 0, 0, 1);
part_type_color3(global.pt_ShotImpact0, 16757759, 16711808, 255);
part_type_alpha3(global.pt_ShotImpact0, 0.67, 0.46, 0);
part_type_blend(global.pt_ShotImpact0, 1);
part_type_life(global.pt_ShotImpact0, 10, 20);
part_type_speed(global.pt_ShotImpact0, 30, 50, -4, 0);
part_type_direction(global.pt_ShotImpact0, -25, 23, 0, 0);
part_type_gravity(global.pt_ShotImpact0, 0, 204);

//ShotImpact1
global.pt_ShotImpact1 = part_type_create();
part_type_shape(global.pt_ShotImpact1, pt_shape_flare);
part_type_size(global.pt_ShotImpact1, 0.60, 4, -0.20, 0);
part_type_scale(global.pt_ShotImpact1, 1, 1);
part_type_orientation(global.pt_ShotImpact1, 0, 0, 0, 0, 1);
part_type_color3(global.pt_ShotImpact1, 16777215, 16777215, 255);
part_type_alpha3(global.pt_ShotImpact1, 1, 0, 0);
part_type_blend(global.pt_ShotImpact1, 1);
part_type_life(global.pt_ShotImpact1, 10, 20);
part_type_speed(global.pt_ShotImpact1, 0, 0, 0, 0);
part_type_direction(global.pt_ShotImpact1, 0, 360, 0, 0);
part_type_gravity(global.pt_ShotImpact1, 0, 0);

//Creating Emitters
global.pe_ShotImpact0 = part_emitter_create(global.ps);
global.pe_ShotImpact1 = part_emitter_create(global.ps);



#define PlayerSplashParticles

var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.ps, global.pe_PlayerWalkSplashEffect0, xp-1, xp+1, yp-1, yp+1, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_PlayerWalkSplashEffect0, global.pt_PlayerWalkSplashEffect0, 6);
part_emitter_region(global.ps, global.pe_PlayerWalkSplashEffect1, xp-7, xp+9, yp-8, yp+8, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_PlayerWalkSplashEffect1, global.pt_PlayerWalkSplashEffect1, 3);

SplashAlarmTriggered = false

#define ShotImpactParticles
DirMin = argument0
DirMax = argument1

//Particles!
part_type_direction(global.pt_ShotImpact0, DirMin, DirMax, 0, 0);
part_type_direction(global.pt_ShotImpact1, DirMin, DirMax, 0, 0);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.ps, global.pe_ShotImpact0, xp-3, xp+3, yp-2, yp+2, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_ShotImpact0, global.pt_ShotImpact0, 6);
part_emitter_region(global.ps, global.pe_ShotImpact1, xp-6, xp+6, yp-3, yp+3, ps_shape_line, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_ShotImpact1, global.pt_ShotImpact1, 1);