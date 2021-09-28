//Simple camera with zoom setup
my_view = 0; 
view_camera[my_view] = camera_create_view(x, y, 1920, 1080);
my_camera = view_camera[my_view];

zoom_level = 3;
zoom_speed = 0.05;

view_ratio = 1.777777777777778;//1080p
current_ratio = 0;
target_ratio = 0;
target_width  = camera_get_view_width(my_camera);
start_view_x  = camera_get_view_x(my_camera);
start_view_y  = camera_get_view_y(my_camera);

cam_x = start_view_x;
cam_y = start_view_y;
cam_w = target_width;
cam_h = target_width/view_ratio;