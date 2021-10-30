x += ( keyboard_check(ord("D")) - keyboard_check(ord("A")) ) * 2;
y += ( keyboard_check(ord("S")) - keyboard_check(ord("W")) ) * 2;

image_angle = point_direction(x, y, mouse_x, mouse_y);