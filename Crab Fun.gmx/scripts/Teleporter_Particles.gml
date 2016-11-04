#define Teleporter_Particles

#define TP_Particle_Setup
//Creating Particle Types
//Telepad_Not_Active_Rings
global.pt_Telepad_Not_Active_Rings = part_type_create();
part_type_shape(global.pt_Telepad_Not_Active_Rings, pt_shape_ring);
part_type_size(global.pt_Telepad_Not_Active_Rings, 0, 0, 0.05, 0);
part_type_scale(global.pt_Telepad_Not_Active_Rings, 1, 1);
part_type_orientation(global.pt_Telepad_Not_Active_Rings, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Telepad_Not_Active_Rings, 16777215, 16776960, 16777215);
part_type_alpha3(global.pt_Telepad_Not_Active_Rings, 0, 0.26, 0);
part_type_blend(global.pt_Telepad_Not_Active_Rings, 1);
part_type_life(global.pt_Telepad_Not_Active_Rings, 80, 80);
part_type_speed(global.pt_Telepad_Not_Active_Rings, 0, 0, 0, 0);
part_type_direction(global.pt_Telepad_Not_Active_Rings, 0, 360, 0, 0);
part_type_gravity(global.pt_Telepad_Not_Active_Rings, 0, 0);

//Telepad_Active_Rings
global.pt_Telepad_Active_Rings = part_type_create();
part_type_shape(global.pt_Telepad_Active_Rings, pt_shape_ring);
part_type_size(global.pt_Telepad_Active_Rings, 0, 0, 0.06, 0);
part_type_scale(global.pt_Telepad_Active_Rings, 1, 1);
part_type_orientation(global.pt_Telepad_Active_Rings, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Telepad_Active_Rings, 16776960, 16776960, 16777215);
part_type_alpha3(global.pt_Telepad_Active_Rings, 1, 0.68, 0);
part_type_blend(global.pt_Telepad_Active_Rings, 1);
part_type_life(global.pt_Telepad_Active_Rings, 80, 80);
part_type_speed(global.pt_Telepad_Active_Rings, 0, 0, 0, 0);
part_type_direction(global.pt_Telepad_Active_Rings, 0, 360, 0, 0);
part_type_gravity(global.pt_Telepad_Active_Rings, 0, 0);

//FloatyTeleporterBits_copy
global.pt_FloatyTeleporterBits_copy = part_type_create();
part_type_shape(global.pt_FloatyTeleporterBits_copy, pt_shape_flare);
part_type_size(global.pt_FloatyTeleporterBits_copy, 0.20, 0.40, 0, 0.10);
part_type_scale(global.pt_FloatyTeleporterBits_copy, 1, 1);
part_type_orientation(global.pt_FloatyTeleporterBits_copy, 0, 0, 0, 0, 1);
part_type_color3(global.pt_FloatyTeleporterBits_copy, 16777215, 16777215, 16777215);
part_type_alpha3(global.pt_FloatyTeleporterBits_copy, 0, 0.61, 0);
part_type_blend(global.pt_FloatyTeleporterBits_copy, 1);
part_type_life(global.pt_FloatyTeleporterBits_copy, 150, 200);
part_type_speed(global.pt_FloatyTeleporterBits_copy, 3, 4, -0.01, 0);
part_type_direction(global.pt_FloatyTeleporterBits_copy, 0, 360, 4, 0);
part_type_gravity(global.pt_FloatyTeleporterBits_copy, 0, 0);

//TeleportZap
global.pt_TeleportZap = part_type_create();
part_type_shape(global.pt_TeleportZap, pt_shape_flare);
part_type_size(global.pt_TeleportZap, 0.10, 0.20, 0.10, 7);
part_type_scale(global.pt_TeleportZap, 0.50, 1.50);
part_type_orientation(global.pt_TeleportZap, -323, 28, 30, 0, 0);
part_type_color3(global.pt_TeleportZap, 16777215, 16777215, 16777088);
part_type_alpha3(global.pt_TeleportZap, 0.69, 0, 0);
part_type_blend(global.pt_TeleportZap, 1);
part_type_life(global.pt_TeleportZap, 20, 20);
part_type_speed(global.pt_TeleportZap, 0, 0, 0, 0);
part_type_direction(global.pt_TeleportZap, 0, 360, 0, 0);
part_type_gravity(global.pt_TeleportZap, 0, 0);

//Teleport_In
global.pt_Teleport_In = part_type_create();
part_type_shape(global.pt_Teleport_In, pt_shape_flare);
part_type_size(global.pt_Teleport_In, 6, 6, -0.50, 0);
part_type_scale(global.pt_Teleport_In, 1, 1);
part_type_orientation(global.pt_Teleport_In, -7, 323, 0, 0, 0);
part_type_color3(global.pt_Teleport_In, 16777088, 16777088, 16777088);
part_type_alpha3(global.pt_Teleport_In, 1, 1, 1);
part_type_blend(global.pt_Teleport_In, 1);
part_type_life(global.pt_Teleport_In, 10, 10);
part_type_speed(global.pt_Teleport_In, 0, 0, 0, 0);
part_type_direction(global.pt_Teleport_In, 0, 360, 0, 0);
part_type_gravity(global.pt_Teleport_In, 0, 0);

//Linking Particle Types together (Death and Step)
part_type_death(global.pt_Teleport_In, 1, global.pt_TeleportZap);

//Creating Emitters
global.pe_Telepad_Not_Active_Rings = part_emitter_create(global.psTeleporter);
global.pe_Telepad_Active_Rings = part_emitter_create(global.psTeleporter);
global.pe_FloatyTeleporterBits_copy = part_emitter_create(global.ps);
global.pe_Teleport_In = part_emitter_create(global.ps);

#define TP_Particle_Alarm
//ALARM CODE IN oCrabaporter - alarm[3]

if TeleporterIsGo = false
{
//CHILLED OUT PARTICLES
part_emitter_region(global.psTeleporter, global.pe_Telepad_Not_Active_Rings, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.psTeleporter, global.pe_Telepad_Not_Active_Rings, global.pt_Telepad_Not_Active_Rings, 1);

alarm[3] = room_speed
}
else
{
//CHARGING UP PARTICLES
part_emitter_region(global.psTeleporter, global.pe_Telepad_Active_Rings, x,x,y,y, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.psTeleporter, global.pe_Telepad_Active_Rings, global.pt_Telepad_Active_Rings, 1);

part_emitter_region(global.ps, global.pe_FloatyTeleporterBits_copy, x-100,x+100,y-100,y+100, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_FloatyTeleporterBits_copy, global.pt_FloatyTeleporterBits_copy, 3);
alarm[3] = room_speed/3
}
