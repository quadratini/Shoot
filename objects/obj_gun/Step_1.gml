/// @description Insert description here
// You can write your code in this editor
x = obj_player.x+4;
y = obj_player.y+5;

image_angle = point_direction(x,y,mouse_x,mouse_y);


firingdelay = firingdelay - 1; //reduce this delay until it finally hits 0
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) && (firingdelay < 0) {
	recoil = 2;
	firingdelay = 7;  //7 frames after our last bullet was created
	with (instance_create_layer(x,y, "Bullets", obj_bullet)) {
		speed = 25;
		direction = other.image_angle + random_range(-1,1);
		image_angle = direction;
	}
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}