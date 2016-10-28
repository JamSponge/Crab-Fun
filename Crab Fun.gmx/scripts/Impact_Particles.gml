#define Impact_Particles

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
part_type_size(global.pt_CrateHit1, 0.50, 0.80, 0, 0);
part_type_scale(global.pt_CrateHit1, 1.20, 1);
part_type_orientation(global.pt_CrateHit1, 0, 352, 0, 0, 1);
part_type_color3(global.pt_CrateHit1, 32896, 32896, 255);
part_type_alpha3(global.pt_CrateHit1, 1, 0, 0);
part_type_blend(global.pt_CrateHit1, 0);
part_type_life(global.pt_CrateHit1, 100, 100);
part_type_speed(global.pt_CrateHit1, 6, 12, -0.50, 0);
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
