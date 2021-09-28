//Menu Surface
menuSurf = -1;
//Active menu bool
menuActive = false;
//Menu label
menu = "";
//Menu x and y position
menuX = 0;
menuY = 0;
//Menu options list
menuList = ds_list_create();
//Menu cell width
menuCellw = 160;
//Menu cell height
menuCellh = 50;
//Cell middle x position
menuCellmx = menuCellw * 0.5;
//Cell middle y
menuCellmy = menuCellh * 0.5;
//Menu total width
menuWidth  = menuCellw;
//Menu total height
menuHeight = menuCellh;
//Menu sprite scale x
menuScaleX = menuWidth / sprite_get_width(sMenuCell);
//Menu sprite scale y
menuScaleY = menuCellh / sprite_get_height(sMenuCell);
//Menu size ratio
menuRatio = 1;
//Menu header text
textHeader = "Action Menu";
//Touch sensors
menuTouch = false;
touchHeader = false;
touchButton = false;
//Menu drag bool
menuDrag = false;
//Selected object
selectedObj = noone;