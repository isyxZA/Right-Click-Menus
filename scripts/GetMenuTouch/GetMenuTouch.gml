/// @description GetMenuTouch(activeMenu, buttonTouched) Determine which button is being touched
/// @param activeMenu Which menu is currently active
/// @param buttonTouched Which button to check for touch


/*
	This script checks whether the mouse is touching a certain button on the menu or not
	It also changes the display text when the mouse is touching
	Simply duplicate a case in the switch statement to create your own menu buttons
	When adding more buttons please ensure that the point_in_rectangle Y position is incremented correctly
*/

function GetMenuTouch(activeMenu, buttonTouched)
{
	switch activeMenu
	{
		case "FRIEND":
			switch buttonTouched
			{
				case -1://Header
					//Check the mouse position
					if point_in_circle(mouse_x, mouse_y, menuX + ((menuCellw *menuRatio) * 0.5), menuY + ((menuCellh * menuRatio) * 0.5), (menuCellh *menuRatio) * 0.5)
					{
						//Change the display text when touching the button
						textHeader = "Click and Drag";
						//Yes, the button is under the mouse position
						return true;
					}
					else
					{
						textHeader = "Friendly Actions";
						return false;
					}
				case 0://Button from menu list index
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + (menuCellh*menuRatio), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 2))
					{
						var tText = "Click to chat"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Chat"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				case 1:
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + ((menuCellh*menuRatio) * 2), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 3))
					{
						var tText = "Click to trade"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Trade"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				case 2:
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + ((menuCellh*menuRatio) * 3), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 4))
					{
						var tText = "Click to cancel"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Cancel"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				default:
					return false;
			}
			break;
		case "ENEMY":
			switch buttonTouched
			{
				case -1://Header
					if point_in_circle(mouse_x, mouse_y, menuX + ((menuCellw *menuRatio) * 0.5), menuY + ((menuCellh * menuRatio) * 0.5), (menuCellh *menuRatio) * 0.5)
					{
						textHeader = "Click and Drag";
						return true;
					}
					else
					{
						textHeader = "Enemy Actions";
						return false;
					}
				case 0://Button from list index
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + (menuCellh*menuRatio), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 2))
					{
						var tText = "Click to melee"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Melee Attack"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				case 1:
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + ((menuCellh*menuRatio) * 2), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 3))
					{
						var tText = "Click to shoot"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Ranged Attack"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				case 2:
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + ((menuCellh*menuRatio) * 3), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 4))
					{
						var tText = "Click to cancel"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Cancel"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				default:
					return false;
			}
			break;
		case "CHEST":
			switch buttonTouched
			{
				case -1://Header
					if point_in_circle(mouse_x, mouse_y, menuX + ((menuCellw *menuRatio) * 0.5), menuY + ((menuCellh * menuRatio) * 0.5), (menuCellh *menuRatio) * 0.5)
					{
						textHeader = "Click and Drag";
						return true;
					}
					else
					{
						textHeader = "Chest Actions";
						return false;
					}
				case 0://Button from list index
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + (menuCellh*menuRatio), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 2))
					{
						var tText = "Click to open"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Open"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				case 1:
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + ((menuCellh*menuRatio) * 2), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 3))
					{
						var tText = "Click to close"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Close"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				default:
					return false;
			}
			break;
		case "DOOR":
			switch buttonTouched
			{
				case -1://Header
					if point_in_circle(mouse_x, mouse_y, menuX + ((menuCellw *menuRatio) * 0.5), menuY + ((menuCellh * menuRatio) * 0.5), (menuCellh *menuRatio) * 0.5)
					{
						textHeader = "Click and Drag";
						return true;
					}
					else
					{
						textHeader = "Door Actions";
						return false;
					}
				case 0://Button from list index
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + (menuCellh*menuRatio), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 2))
					{
						var tText = "Click to lock"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Lock"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				case 1:
					if point_in_rectangle(mouse_x, mouse_y, menuX, menuY + ((menuCellh*menuRatio) * 2), menuX + (menuWidth*menuRatio), menuY + ((menuCellh*menuRatio) * 3))
					{
						var tText = "Click to unlock"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return true;
					}
					else
					{
						var tText = "Unlock"; 
						if menuList[| buttonTouched] != tText { menuList[| buttonTouched] = tText; }
						return false;
					}
				default:
					return false;
			}
			break;
		default:
			return false;
	}
}