/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

if (key_left) || (key_right) || (key_jump) {
	controller = 0;
}

if (abs(gamepad_axis_value(4, gp_axislh)) > 0.2) {
	key_left = abs(min(gamepad_axis_value(4,gp_axislh),0));
	key_right = max(gamepad_axis_value(4,gp_axislh),0);
	controller = 1;
}

if (gamepad_button_check_pressed(4,gp_shoulderlb)) {
	key_jump = 1;
	controller = 1;	
}

var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_wall)) && (key_jump) {
	vsp = -7;
}

if (place_meeting(x+hsp, y, obj_wall)) {
	while (!place_meeting(x+sign(hsp), y, obj_wall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp; 

if (place_meeting(x,y+vsp, obj_wall)) {
	while (!place_meeting(x,y+sign(vsp), obj_wall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp; 

if (!place_meeting(x,y+1,obj_wall)) {
	sprite_index = spr_playerAir;
} else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = spr_player;
	} else {
		sprite_index = spr_playerRun;
	}
}

if (hsp != 0) {
	image_xscale = sign(hsp);
}

