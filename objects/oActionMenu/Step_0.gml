//Mouse Button Right Click
if mouse_check_button_pressed(mb_right)
{
	//Create a list of all instances of oParent under the mouse cursor
	var sList = ds_list_create();
	var su = instance_place_list(mouse_x, mouse_y, oParent, sList, true);
	//If an object has been clicked
	if su > 0
	{
		//Grab the first object on the list
		var iu = ds_list_find_value(sList, 0);
		//Don't do anything if we've clicked the object that is currently selected
		if iu != selectedObj
		{ 
			//If an object is already selected then deselect that object
			if selectedObj != noone { selectedObj.isSelected = false; }
			//Select the new object
			iu.isSelected = true; 
			//Grab the object id
			selectedObj = iu;
			//Set the menu label as the object myType
			menu = selectedObj.myType;
			//Create the menu
			SetActionMenu(menu);
		}
	}
	//No object has been clicked
	else
	{
		//Reset the menu
		if menuActive { SetActionMenu("RESET"); }
	}
	//Remove the list from memory
	ds_list_destroy(sList);
}

if menuActive
{
	//If the mouse is touching the menu header then enable menu dragging
	if GetMenuTouch(menu, -1) { touchHeader = true; }
		else { touchHeader = false; }
	//Get the size of the current menu list
	var mls = ds_list_size(menuList);
	var touchCount = -1;
	touchButton = false;
	for (var i = 0; i < mls; ++i)
	{
		//Check if the mouse is touching a button
		if GetMenuTouch(menu, i)
		{
			//If it is then retrieve the button number
			touchCount = i;
			touchButton = true;
		}
	}
	//Determine if the mouse is touching the menu or not
	if touchHeader || touchButton { menuTouch = true; }
		else { menuTouch = false; }
	//If the mouse is touching the menu
	if menuTouch
	{
		//Mouse Button Left Click
		if mouse_check_button_pressed(mb_left)
		{
			//Determine which actions to take depending on the active menu and the button pressed
			ExecuteAction(menu, touchCount);
		}
	}
	//Mouse Button Left Release
	if mouse_check_button_released(mb_left)
	{
		//Disable menu dragging
		menuDrag = false;
	}
	//If menu dragging is enabled
	if menuDrag
	{
		//Adjust the menu x and y position
		menuX = lerp(menuX, mouse_x-menuCellmx, 1);
		menuY = lerp(menuY, mouse_y-menuCellmy, 1);
	}
}