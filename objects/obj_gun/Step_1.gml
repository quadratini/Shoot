/// @description Insert description here
// You can write your code in this editor
x = obj_player.x+4;
y = obj_player.y+5;


if (obj_player.controller == 0) {
	image_angle = point_direction(x,y,mouse_x,mouse_y);
} else {
	var controllerh = gamepad_axis_value(4, gp_axisrh);
	var controllerv = gamepad_axis_value(4, gp_axisrv);
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2) {
		controllerangle = point_direction(0,0 ,controllerh, controllerv);
	}
	image_angle = controllerangle;
}

firingdelay = firingdelay - 1; //reduce this delay until it finally hits 0
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) || gamepad_button_check(4,gp_shoulderrb) && (firingdelay < 0) {
	recoil = 4.5;
	firingdelay = 7;  //7 frames after our last bullet was created
	with (instance_create_layer(x,y, "Bullets", obj_bullet)) {
		speed = 25;
		direction = other.image_angle + random_range(-1,1);
		image_angle = direction;
	}
}

if (image_angle > 90) && (image_angle < 270) {
	x = obj_player.x - 4;
	image_yscale = -1;
} else {
	x = obj_player.x + 4;
	image_yscale = 1;
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

