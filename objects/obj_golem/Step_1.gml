/// @description Insert description here
// You can write your code in this editor
if (hp <= 0) {
	with (instance_create_layer(x,y,layer,obj_dead)) {
		direction = other.hitfrom;	
		hsp = lengthdir_x(0.5, direction);
		vsp = lengthdir_y(0.2, direction);
		image_xscale = sign(hsp);
		if (sign(hsp) != 0) image_xscale = sign(hsp);
	}
	instance_destroy();
}