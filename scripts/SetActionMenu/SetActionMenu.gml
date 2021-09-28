/// @description SetActionMenu(activeMenu) Set the action menu options
/// @param activeMenu Set the menu options

/*
	In this script you can set the menu options according to the object variable myType
	Simply duplicate a case from the switch statement and populate the menu list with your custom options
*/
function SetActionMenu(activeMenu)
{
	switch activeMenu
	{
		case "RESET"://Reset the menu
			//Remove the display
			menuActive = false;
			//Reset the sensors
			menuDrag = false;
			menuTouch = false;
			touchHeader = false;
			touchButton = false;
			//Deselect if neccesary
			if selectedObj != noone 
			{ 
				selectedObj.isSelected = false; 
				selectedObj = noone;
			}
			//Clear the menu list
			ds_list_clear(menuList);
			break;
		case "FRIEND":
			//Clear the menu list
			ds_list_clear(menuList);
			//Populate the menu list 
			menuList[| 0] = "Chat";
			menuList[| 1] = "Trade";
			menuList[| 2] = "Cancel";
			//Activate menu display 
			menuActive = true;
			menuDrag = false;
			//Set the menu position
			menuX = mouse_x + 32;
			menuY = mouse_y - 16;
			break;
		case "ENEMY":
			ds_list_clear(menuList);
			
			menuList[| 0] = "Melee Attack";
			menuList[| 1] = "Ranged Attack";
			menuList[| 2] = "Cancel";
			
			menuActive = true;
			menuDrag = false;
			menuX = mouse_x + 32;
			menuY = mouse_y - 16;
			break;
		case "CHEST":
			ds_list_clear(menuList);
			
			menuList[| 0] = "Open";
			menuList[| 1] = "Close";
			
			menuActive = true;
			menuDrag = false;
			menuX = mouse_x + 32;
			menuY = mouse_y - 16;
			break;
		case "DOOR":
			ds_list_clear(menuList);
			
			menuList[| 0] = "Lock";
			menuList[| 1] = "Unlock";
			
			menuActive = true;
			menuDrag = false;
			menuX = mouse_x + 32;
			menuY = mouse_y - 16;
			break;
	}
}