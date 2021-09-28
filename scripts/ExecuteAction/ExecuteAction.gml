/// @description ExecuteAction(activeMenu, buttonClicked) Button click actions
/// @param activeMenu Which menu is currently active
/// @param buttonTouched Which button to check for touch

/*
	In this script you can execute commands for the current selected object
	Simply duplicate a case from the switch statement and apply your custom logic for each button press
*/

function ExecuteAction(activeMenu, buttonClicked)
{
	switch activeMenu
	{
		case "FRIEND"://The menu label retrieved from the selected object's myType
			switch buttonClicked
			{
				case -1://The header has been clicked
					//Enable menu dragging
					menuDrag = true;
					break;
				case 0://Chat button has been clicked
					//Tell the selected object what action to take
					if instance_exists(selectedObj)
					{
						//Change the selected object's text display
						selectedObj.txt = "Chatting";
					}
					//Reset the menu
					SetActionMenu("RESET");
					break;
				case 1://Trade button
					if instance_exists(selectedObj)
					{
						selectedObj.txt = "Trading";
					}
					SetActionMenu("RESET");
					break;
				case 2://Cancel button
					if instance_exists(selectedObj)
					{
						selectedObj.txt = selectedObj.myType;
					}
					SetActionMenu("RESET");
					break;
			}
			break;
		case "ENEMY":
			switch buttonClicked
			{
				case -1:
					menuDrag = true;
					break;
				case 0://Melee
					if instance_exists(selectedObj)
					{
						selectedObj.txt = "Melee";
					}
					SetActionMenu("RESET");
					break;
				case 1://Ranged
					if instance_exists(selectedObj)
					{
						selectedObj.txt = "Ranged";
					}
					SetActionMenu("RESET");
					break;
				case 2://Cancel
					if instance_exists(selectedObj)
					{
						selectedObj.txt = selectedObj.myType;
					}
					SetActionMenu("RESET");
					break;
			}
			break;
		case "CHEST":
			switch buttonClicked
			{
				case -1:
					menuDrag = true;
					break;
				case 0://Open 
					if instance_exists(selectedObj)
					{
						selectedObj.txt = "Open";
					}
					SetActionMenu("RESET");
					break;
				case 1://Close
					if instance_exists(selectedObj)
					{
						selectedObj.txt = "Closed";
					}
					SetActionMenu("RESET");
					break;
			}
			break;
		case "DOOR":
			switch buttonClicked
			{
				case -1:
					menuDrag = true;
					break;
				case 0://Lock
					if instance_exists(selectedObj)
					{
						selectedObj.txt = "Locked";
					}
					SetActionMenu("RESET");
					break;
				case 1://Unlock
					if instance_exists(selectedObj)
					{
						selectedObj.txt = "Unlocked";
					}
					SetActionMenu("RESET");
					break;
			}
			break;
	}
}