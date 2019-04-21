/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;

if (place_meeting(x+hsp, y, obj_wall)) {
	while (!place_meeting(x+sign(hsp), y, obj_wall)) {
		x = x + sign(hsp);
	}
	hsp = -hsp;
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
	sprite_index = spr_golem;
} else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = spr_golem;
	} else {
		sprite_index = spr_golemRun;
	}
}

if (hsp != 0) {
	image_xscale = -sign(hsp);
}

