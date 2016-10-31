#define Object_Impact_Particles


#define HitCrateParticlesSetup
//Creating Particle Types
//CrateHit0
global.pt_CrateHit0 = part_type_create();
part_type_shape(global.pt_CrateHit0, pt_shape_cloud);
part_type_size(global.pt_CrateHit0, 0.60, 1, -0.02, 0.10);
part_type_scale(global.pt_CrateHit0, 1, 1);
part_type_orientation(global.pt_CrateHit0, 0, 352, 3, 0, 0);
part_type_color3(global.pt_CrateHit0, 12632256, 16777215, 255);
part_type_alpha3(global.pt_CrateHit0, 1, 0.36, 0);
part_type_blend(global.pt_CrateHit0, 0);
part_type_life(global.pt_CrateHit0, 20, 40);
part_type_speed(global.pt_CrateHit0, 5, 10, -0.50, 0);
part_type_direction(global.pt_CrateHit0, -61, 81, 0, 0);
part_type_gravity(global.pt_CrateHit0, 0, 0);

//CrateHit1
global.pt_CrateHit1 = part_type_create();
part_type_shape(global.pt_CrateHit1, pt_shape_line);
part_type_sprite(global.pt_CrateHit1, sCrateShrapnelSmall, 0, 0, 1);
part_type_size(global.pt_CrateHit1, 0.20, 0.35, 0, 0);
part_type_scale(global.pt_CrateHit1, 1, 0.50);
part_type_orientation(global.pt_CrateHit1, 0, 352, 0, 0, 1);
part_type_color3(global.pt_CrateHit1, 16777215, 16777215, 255);
part_type_alpha3(global.pt_CrateHit1, 1, 0, 0);
part_type_blend(global.pt_CrateHit1, 0);
part_type_life(global.pt_CrateHit1, 100, 100);
part_type_speed(global.pt_CrateHit1, 7, 15, -1, 0);
part_type_direction(global.pt_CrateHit1, -35, 45, 0, 0);
part_type_gravity(global.pt_CrateHit1, 0, 0);

//Creating Emitters
global.pe_CrateHit0 = part_emitter_create(global.ps);
global.pe_CrateHit1 = part_emitter_create(global.ps);

#define HitCrateParticles
DirMin = argument0
DirMax = argument1
CrateColour = argument2

part_type_color3(global.pt_CrateHit1, CrateColour, CrateColour, 255);
part_type_direction(global.pt_CrateHit0, DirMin, DirMax, 0, 0);
part_type_direction(global.pt_CrateHit1, DirMin, DirMax, 0, 0);

var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.ps, global.pe_CrateHit0, xp-8, xp+8, yp-8, yp+8, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_CrateHit0, global.pt_CrateHit0, 20);
part_emitter_region(global.ps, global.pe_CrateHit1, xp-8, xp+8, yp-8, yp+8, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_CrateHit1, global.pt_CrateHit1, 4);
#define DestroyCrateParticlesSetup
//Creating Particle Types
//CrateDestroyedSmoke
global.pt_CrateDestroyedSmoke = part_type_create();
part_type_shape(global.pt_CrateDestroyedSmoke, pt_shape_explosion);
part_type_size(global.pt_CrateDestroyedSmoke, 0.50, 4, 0.07, 0.10);
part_type_scale(global.pt_CrateDestroyedSmoke, 1, 1);
part_type_orientation(global.pt_CrateDestroyedSmoke, 0, 352, 10, 0, 0);
part_type_color3(global.pt_CrateDestroyedSmoke, 16777215, 12632256, 255);
part_type_alpha3(global.pt_CrateDestroyedSmoke, 1, 0.11, 0);
part_type_blend(global.pt_CrateDestroyedSmoke, 0);
part_type_life(global.pt_CrateDestroyedSmoke, 10, 40);
part_type_speed(global.pt_CrateDestroyedSmoke, 15, 25, -0.50, 0);
part_type_direction(global.pt_CrateDestroyedSmoke, 0, 360, 0, 0);
part_type_gravity(global.pt_CrateDestroyedSmoke, 0, 0);

//CrateDestroyed360Bits
global.pt_CrateDestroyed360Bits = part_type_create();
part_type_shape(global.pt_CrateDestroyed360Bits, pt_shape_square);
part_type_sprite(global.pt_CrateDestroyed360Bits, sCrateShrapnelSmall, 0, 0, 1);
part_type_scale(global.pt_CrateDestroyed360Bits, 1, 1);
part_type_orientation(global.pt_CrateDestroyed360Bits, 0, 358, 0, 0, 1);
part_type_color3(global.pt_CrateDestroyed360Bits, 16777215, 6570752, 255);
part_type_alpha3(global.pt_CrateDestroyed360Bits, 1, 0, 0);
part_type_blend(global.pt_CrateDestroyed360Bits, 0);
part_type_life(global.pt_CrateDestroyed360Bits, 100, 300);
part_type_speed(global.pt_CrateDestroyed360Bits, 30, 40, -2, 0);
part_type_direction(global.pt_CrateDestroyed360Bits, -175, 182, 0, 0);
part_type_gravity(global.pt_CrateDestroyed360Bits, 0, 0);

//CrateDestroyed180Bits
global.pt_CrateDestroyed180Bits = part_type_create();
part_type_shape(global.pt_CrateDestroyed180Bits, pt_shape_square);
part_type_sprite(global.pt_CrateDestroyed180Bits, sCrateShrapnelSmall, 0, 0, 1);
part_type_scale(global.pt_CrateDestroyed180Bits, 1, 1);
part_type_orientation(global.pt_CrateDestroyed180Bits, 0, 358, 0, 0, 1);
part_type_color3(global.pt_CrateDestroyed180Bits, 16777215, 6570752, 255);
part_type_alpha3(global.pt_CrateDestroyed180Bits, 1, 0, 0);
part_type_blend(global.pt_CrateDestroyed180Bits, 0);
part_type_life(global.pt_CrateDestroyed180Bits, 100, 250);
part_type_speed(global.pt_CrateDestroyed180Bits, 20, 50, -2, 0);
part_type_direction(global.pt_CrateDestroyed180Bits, -74, 72, 0, 0);
part_type_gravity(global.pt_CrateDestroyed180Bits, 0, 0);

//CrateDestroyed180Bits_copy
global.pt_CrateDestroyed180Bits_copy = part_type_create();
part_type_shape(global.pt_CrateDestroyed180Bits_copy, pt_shape_square);
part_type_sprite(global.pt_CrateDestroyed180Bits_copy, sCrateShrapnelBig, 0, 0, 1);
part_type_scale(global.pt_CrateDestroyed180Bits_copy, 1, 1);
part_type_orientation(global.pt_CrateDestroyed180Bits_copy, 0, 358, 0, 0, 1);
part_type_color3(global.pt_CrateDestroyed180Bits_copy, 16777215, 6570752, 255);
part_type_alpha3(global.pt_CrateDestroyed180Bits_copy, 1, 0, 0);
part_type_blend(global.pt_CrateDestroyed180Bits_copy, 0);
part_type_life(global.pt_CrateDestroyed180Bits_copy, 100, 250);
part_type_speed(global.pt_CrateDestroyed180Bits_copy, 30, 40, -2, 0);
part_type_direction(global.pt_CrateDestroyed180Bits_copy, -55, 80, 0, 0);
part_type_gravity(global.pt_CrateDestroyed180Bits_copy, 0, 0);

//Creating Emitters
global.pe_CrateDestroyedSmoke = part_emitter_create(global.ps);
global.pe_CrateDestroyed360Bits = part_emitter_create(global.ps);
global.pe_CrateDestroyed180Bits = part_emitter_create(global.ps);
global.pe_CrateDestroyed180Bits_copy = part_emitter_create(global.ps);



#define DestroyCrateParticles
DirMin = argument0
DirMax = argument1
CrateColour = argument2
CrateScale = argument3

part_type_size(global.pt_CrateDestroyed360Bits, 1*CrateScale, 1*CrateScale, 0, 0);
part_type_size(global.pt_CrateDestroyed180Bits_copy, 0.50*CrateScale, 0.50*CrateScale, 0, 0);
part_type_size(global.pt_CrateDestroyed180Bits, 0.50*CrateScale, 1*CrateScale, 0, 0);

part_type_color3(global.pt_CrateDestroyed360Bits, CrateColour, CrateColour, 255);
part_type_color3(global.pt_CrateDestroyed180Bits, CrateColour, CrateColour, 255);
part_type_color3(global.pt_CrateDestroyed180Bits_copy, CrateColour, CrateColour, 255);

part_type_direction(global.pt_CrateDestroyed180Bits, DirMin, DirMax, 0, 0);
part_type_direction(global.pt_CrateDestroyed180Bits_copy, DirMin, DirMax, 0, 0);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.ps, global.pe_CrateDestroyedSmoke, xp-128, xp+128, yp-128, yp+128, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_CrateDestroyedSmoke, global.pt_CrateDestroyedSmoke, 20);
part_emitter_region(global.ps, global.pe_CrateDestroyed360Bits, xp-129, xp+127, yp-128, yp+128, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_CrateDestroyed360Bits, global.pt_CrateDestroyed360Bits, 4);
part_emitter_region(global.ps, global.pe_CrateDestroyed180Bits, xp-129, xp+127, yp-128, yp+128, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_CrateDestroyed180Bits, global.pt_CrateDestroyed180Bits, 20);
part_emitter_region(global.ps, global.pe_CrateDestroyed180Bits_copy, xp-130, xp+126, yp-128, yp+128, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_CrateDestroyed180Bits_copy, global.pt_CrateDestroyed180Bits_copy, 2);