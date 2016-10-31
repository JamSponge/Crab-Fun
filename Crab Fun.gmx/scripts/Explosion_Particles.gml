#define Explosion_Particles

#define Scorch_Particles_Setup
//Creating Particle Types
//Effect1
global.pt_Effect1 = part_type_create();
part_type_shape(global.pt_Effect1, pt_shape_pixel);
part_type_sprite(global.pt_Effect1, sScorchParticles, 0, 0, 1);
part_type_size(global.pt_Effect1, 0.80, 1.70, 0, 0);
part_type_scale(global.pt_Effect1, 1, 2);
part_type_orientation(global.pt_Effect1, 0, 0, 0, 0, 1);
part_type_color3(global.pt_Effect1, 0, 0, 8421504);
part_type_alpha3(global.pt_Effect1, 0.80, 0.80, 0);
part_type_blend(global.pt_Effect1, 0);
part_type_life(global.pt_Effect1, 120, 120);
part_type_speed(global.pt_Effect1, 6, 8, -2, 0);
part_type_direction(global.pt_Effect1, 0, 360, 0, 0);
part_type_gravity(global.pt_Effect1, 0, 0);

//Creating Emitters
global.pe_Effect1 = part_emitter_create(global.psLandOnly);

#define Scorch_Particles
//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.psLandOnly, global.pe_Effect1, xp-5, xp+5, yp-5, yp+5, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.psLandOnly, global.pe_Effect1, global.pt_Effect1, 35);