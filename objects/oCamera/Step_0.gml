//Mouse wheel inputs
if mouse_wheel_up() || keyboard_check_pressed(vk_up) 
{ 
	zoom_level -= 1;
	if zoom_level < 0 { zoom_level = 0; }
} 
if mouse_wheel_down() || keyboard_check_pressed(vk_down) 
{ 
	zoom_level += 1;
	if zoom_level > 5 { zoom_level = 5; }
}

//Set target width and height according to zoom level
switch zoom_level 
{
	case 0:
		//Set the camera's target view width
        target_width = 1024;
		//Set the target size ratio to send to the action menu
		target_ratio = 0.7;
        break;
    case 2:
		target_width = 1366;
		target_ratio = 0.85;
        break;
	case 3:
		target_width = 1920;
		target_ratio = 1;
        break;
	case 4:
		target_width = 2560;
		target_ratio = 1.15;
        break;
	case 5:
		target_width = 3200;
		target_ratio = 1.3;
        break;
}
		
//Zoom the view to target
if camera_get_view_width(my_camera) != target_width 
{
    var view_dif = (camera_get_view_width(my_camera)-target_width);
    start_view_x = camera_get_view_width(my_camera);
    start_view_y = camera_get_view_height(my_camera);
    if camera_get_view_width(my_camera) < target_width 
	{
		camera_set_view_size(my_camera, camera_get_view_width(my_camera)-(view_dif*zoom_speed), camera_get_view_height(my_camera));
		camera_set_view_size(my_camera, camera_get_view_width(my_camera), camera_get_view_width(my_camera)/view_ratio);
        //Center the view
		camera_set_view_pos(my_camera, camera_get_view_x(my_camera)-(abs(camera_get_view_width(my_camera) -start_view_x)/2), 
				                        camera_get_view_y(my_camera)-(abs(camera_get_view_height(my_camera)-start_view_y)/2));
    }
    else if camera_get_view_width(my_camera) > target_width 
	{ 
		camera_set_view_size(my_camera, camera_get_view_width(my_camera)+(view_dif*-zoom_speed), camera_get_view_height(my_camera));
		camera_set_view_size(my_camera, camera_get_view_width(my_camera), camera_get_view_width(my_camera)/view_ratio);
        //Center the view
		camera_set_view_pos(my_camera, camera_get_view_x(my_camera)+(abs(camera_get_view_width(my_camera) -start_view_x)/2), 
				                        camera_get_view_y(my_camera)+(abs(camera_get_view_height(my_camera)-start_view_y)/2));
    }
			
	cam_x = camera_get_view_x(my_camera);
	cam_y = camera_get_view_y(my_camera);
	cam_w = camera_get_view_width(my_camera);
	cam_h = camera_get_view_height(my_camera);
}

//Calculate the menu ratio 
if current_ratio != target_ratio
{
	//Smooth out the change in size to avoid a snapping effect
	var menu_diff = abs(current_ratio-target_ratio);
	if current_ratio < target_ratio { current_ratio += menu_diff*0.1; }
		else if current_ratio > target_ratio { current_ratio -= menu_diff*0.1; }
	//Set the action menu size ratio
	oActionMenu.menuRatio = current_ratio;
}

//Keeps the view inside the room
camera_set_view_pos(my_camera, clamp(camera_get_view_x(my_camera), 0, room_width), clamp(camera_get_view_y(my_camera), 0, room_height));

//Center the camera object
x = camera_get_view_x(my_camera) + (camera_get_view_width(my_camera) *0.5);
y = camera_get_view_y(my_camera) + (camera_get_view_height(my_camera)*0.5);