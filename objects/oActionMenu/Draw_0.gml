//Display the action menu on a scalable surface
if menuActive
{
	//If the surface exists
	if surface_exists(menuSurf)
	{
		//Set the surface target to draw on
		surface_set_target(menuSurf);
		//Disable the alpha channel
		var cw = gpu_get_colorwriteenable();
		cw[3] = false;
		gpu_set_colorwriteenable(cw);
		draw_clear_alpha(c_black, 1);
		//Header
		draw_sprite_ext(sMenuCell, 0, 0, 0, menuScaleX, menuScaleY, 0, c_white, 1);
		draw_text(menuCellmx, menuCellmy, textHeader);
		//Retrieve the size of the active menu list
		var ms = ds_list_size(menuList);
		//Draw the buttons
		for (var i = 0; i < ms; ++i)
		{
			//Menu buttons
			draw_sprite_ext(sMenuCell, 0, 0, ((i+1) * menuCellh), menuScaleX, menuScaleY, 0, c_white, 1);
			draw_text(menuCellmx, menuCellmy + ((i+1) * menuCellh), menuList[| i]);
		}
		//Reset the surface target
		surface_reset_target();
		//Display the menu
		draw_surface_ext(menuSurf, menuX, menuY, menuRatio, menuRatio, 0, c_white, 1);
		//Enable the alpha channel
		cw[3] = true;
		gpu_set_colorwriteenable(cw);
	}
	//If there is no surface then create one
	else
	{
		menuWidth = menuCellw;
		menuHeight = menuCellh * (ds_list_size(menuList)+1);
		menuSurf = surface_create(menuWidth, menuHeight);
		surface_set_target(menuSurf);
		draw_clear_alpha(c_black, 0);
		surface_reset_target();
	}
}
//There is no active menu
else
{
	//Free the surface
	if surface_exists(menuSurf) { surface_free(menuSurf); }
}