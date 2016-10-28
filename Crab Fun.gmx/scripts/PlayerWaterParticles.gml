#define PlayerWaterParticles

#define PlayerWetFeetParticlesSetup

//Footprint1
global.pt_Footprint1 = part_type_create();
part_type_shape(global.pt_Footprint1, pt_shape_disk);
part_type_size(global.pt_Footprint1, 0.15, 0.15, 0, 0);
part_type_scale(global.pt_Footprint1, 1.70, 1);
part_type_orientation(global.pt_Footprint1, 0, 0, 0, 0, 1);
part_type_color3(global.pt_Footprint1, 0, 8404992, 8404992);
part_type_alpha3(global.pt_Footprint1, 0.60, 0, 0);
part_type_blend(global.pt_Footprint1, 0);
part_type_life(global.pt_Footprint1, 160, 160);
part_type_speed(global.pt_Footprint1, 0, 0, 0, 0);
part_type_direction(global.pt_Footprint1, 0, 0, 0, 0);
part_type_gravity(global.pt_Footprint1, 0, 0);

//Footprint0
global.pt_Footprint0 = part_type_create();
part_type_shape(global.pt_Footprint0, pt_shape_disk);
part_type_size(global.pt_Footprint0, 0.15, 0.15, 0, 0);
part_type_scale(global.pt_Footprint0, 1.70, 1);
part_type_orientation(global.pt_Footprint0, 0, 0, 0, 0, 1);
part_type_color3(global.pt_Footprint0, 0, 8404992, 8404992);
part_type_alpha3(global.pt_Footprint0, 0.60, 0, 0);
part_type_blend(global.pt_Footprint0, 0);
part_type_life(global.pt_Footprint0, 160, 160);
part_type_speed(global.pt_Footprint0, 0, 0, 0, 0);
part_type_direction(global.pt_Footprint0, 0, 0, 0, 0);
part_type_gravity(global.pt_Footprint0, 0, 0);

//Creating Emitters
global.pe_Footprint0 = part_emitter_create(global.psLandOnly);
global.pe_Footprint1 = part_emitter_create(global.psLandOnly);



#define PlayerWetFeetParticles
DirMin = argument0
DirMax = argument1
Opacity = argument2/10
if 1 < Opacity {Opacity = 1} 

part_type_direction(global.pt_Footprint0, DirMin, DirMax, 0, 0);
part_type_direction(global.pt_Footprint1, DirMin, DirMax, 0, 0);
part_type_alpha3(global.pt_Footprint0, 0.60, 0, 0);

var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.psLandOnly, global.pe_Footprint0, xp-21, xp-15, yp-11, yp-7, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.psLandOnly, global.pe_Footprint0, global.pt_Footprint0, 1);
part_emitter_region(global.psLandOnly, global.pe_Footprint1, xp+16, xp+22, yp+5, yp+9, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.psLandOnly, global.pe_Footprint1, global.pt_Footprint1, 1);
