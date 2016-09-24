#define GAME_SETTINGS




#define Video_Setup
//GAME VISUAL SETUP & DATA - PROBABLY MOVE THIS ELSEWHERE AT SOME POINT
window_set_fullscreen(true)
global.DisplayWidth = display_get_width()
global.DisplayHeight = display_get_height()
global.DisplayRatio = global.DisplayWidth / 1000

/* how much of the room do we want on-screen?*/
view_wview = global.DisplayWidth 
view_hview = global.DisplayHeight

/* how much of the screen do we want to take up?*/
view_wport = global.DisplayWidth 
view_hport = global.DisplayHeight

display_reset(0, true)

//Weird Bullshit
surface_resize(application_surface,global.DisplayWidth,global.DisplayHeight)
